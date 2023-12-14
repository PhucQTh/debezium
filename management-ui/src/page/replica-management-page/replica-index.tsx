import axios from 'axios';
import { ReactNode, useState } from 'react';
import classNames from 'classnames/bind';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import styles from 'src/page/replica-management-page/replica-management.module.scss';
import { toast } from 'react-toastify';
import ErrorPage from 'src/components/error-page/error-page';
import {
  faArrowRightArrowLeft,
  faCheckCircle,
  faFileLines,
  faInfo,
  faRotateRight,
  faTrashCan,
  faXmarkCircle,
} from '@fortawesome/free-solid-svg-icons';
import PanelPopup from 'src/components/panel-popup/panel-popup';
import popupSlice, { PopupStatus } from 'src/redux/popup-slice';
import { useAppDispatch } from 'src/redux/redux-hook';
import LoadingComponent from 'src/components/loading/loading';
import { useNavigate } from 'react-router-dom';
import { deleteAPI, getAPI, postAPI, putAPI } from 'src/config/ultis';
import { useConnectorsQuery } from 'src/query/connectors.query';
const cx = classNames.bind(styles);
const config = JSON.parse(localStorage.getItem('config') || '{}');
function ReplicaIndexPage() {
  const [isChecked, setIsChecked] = useState(false);
  const [popupContent, setPopupContent] = useState<any>({});
  const [bodyShow, setBodyShow] = useState<string[]>([]);
  const [columnsName, setColumnsName] = useState('');

  const dispath = useAppDispatch();
  const { kafkaConnect } = config;
  //#region HANDLE ACTION
  const handleClick = (table: string) => {
    if (bodyShow.includes(table)) {
      setBodyShow(bodyShow.filter((t) => t !== table));
    } else {
      setBodyShow([...bodyShow, table]);
    }
  };
  const handleRestartAll = async (tables: Topic[]) => {
    const restartPromises = tables
      .filter((connector) => connector.tasks[0].state === 'FAILED')
      .map((connector) =>
        axios.post(`${config.kafkaConnect}/${connector.name}/restart`)
      );
    axios
      .all(restartPromises)
      .then(() => {
        toast.success('All failed connectors are restarted successfully');
        // fetchConnectors();
      })
      .catch((error) => {
        console.error(error);
      });
  };
  const handleDeleteAll = async (tables: Topic[]) => {
    Promise.all(tables.map((connector) => handleDelete(connector.name)))
      .then(() => {
        toast.success('All connectors are deleted successfully');
        // fetchConnectors();
      })
      .catch((error) => {
        console.error(error);
      });
  };
  const handleGetConfig = async (tableName: string) => {
    const configUrl = `${kafkaConnect}/${tableName}/config`;
    getAPI(configUrl, true).then((res) => {
      setPopupContent(res.data);
    });
    dispath(popupSlice.actions.setPopupStatus(PopupStatus.open));
  };
  const handleGetErr = async (tableName: string) => {
    const errUrl = `${kafkaConnect}/${tableName}/status`;
    getAPI(errUrl, true).then((res) => {
      setPopupContent(res.data['tasks']['0']);
    });
    dispath(popupSlice.actions.setPopupStatus(PopupStatus.open));
  };
  const handleFixTimestampWithZ = () => {
    setPopupContent((prevContent: any) => {
      prevContent.transforms = `dropTopicPrefix,TimestampConverter`;
      prevContent['transforms.TimestampConverter.type'] =
        'org.apache.kafka.connect.transforms.TimestampConverter$Value';
      prevContent['transforms.TimestampConverter.format'] =
        "yyyy-MM-dd'T'HH:mm:ss'Z'";
      prevContent['transforms.TimestampConverter.target.type'] = 'Timestamp';
      prevContent['transforms.TimestampConverter.field'] = columnsName;
      return prevContent;
    });

    putAPI(
      `${config.kafkaConnect}/${popupContent['name']}/config`,
      JSON.stringify(popupContent),
      true
    ).then((res) => {
      toast.success('Connector is restarted successfully');
    });

    // console.log(popupContent);
  };
  //#endregion

  const { data, isError, isLoading } = useConnectorsQuery();
  if (isLoading) {
    return <LoadingComponent />;
  }
  if (isError) {
    return <ErrorPage />;
  }
  if (!data) {
    return <ErrorPage />;
  }
  const { connectors, databases: database, topicGroupIP } = data;
  return (
    <div className={cx('container')}>
      <div className='mt-10'></div>
      <div className='flex items-center justify-between'>
        <div className='flex items-center select-none'>
          <div
            className='text-white bg-cyan-500 shadow-lg shadow-cyan-500/50 text-3xl  font-bold  px-5 py-2.5 rounded-lg text-center  mr-4 cursor-pointer'
            onClick={() => setIsChecked(!isChecked)}
          >
            <FontAwesomeIcon icon={faArrowRightArrowLeft} />
          </div>
          <h1>
            {isChecked === false ? 'SOURCE CONNECTORS' : 'SINK CONNECTORS'}
          </h1>
        </div>
        {isChecked === false && (
          <div className='text-white bg-blue-500 shadow-lg shadow-blue-500/50 text-3xl  font-bold  px-5 py-2.5 rounded-lg text-center  mr-4 cursor-pointer'>
            Create Source
          </div>
        )}
      </div>
      <>
        {isChecked === false &&
          connectors.map(
            (connector, key) =>
              connector.type === 'source' && (
                <SourceContent topic={connector} key={key} />
              )
          )}
        {isChecked === true &&
          topicGroupIP.map((item) => {
            const topic = item?.name;
            return (
              <div key={item?.name}>
                <div className={cx(['container-header', 'bg-black'])}>
                  {item?.name} - {item?.ipAddress}
                </div>
                {database.map((database, index) => {
                  const filterConnectors = [...connectors]
                    .sort((a, b) =>
                      a.tasks[0].state.localeCompare(b.tasks[0].state)
                    )
                    .filter(
                      (connector) =>
                        connector.type === 'sink' &&
                        connector.name.includes(`${topic}-${database}`)
                    );
                  const failedConnectors = filterConnectors.filter(
                    (connector) => connector.tasks[0].state === 'FAILED'
                  );
                  return (
                    <div key={index}>
                      <div
                        className={cx([
                          'container-header',
                          bodyShow.includes(`${topic}-${database}`)
                            ? 'active'
                            : '',
                        ])}
                        onClick={() => {
                          handleClick(`${topic}-${database}`);
                        }}
                      >
                        {`${database} - Total: ${filterConnectors.length}`}
                        {` - Failed: ${failedConnectors.length}`}
                        <div>
                          <button
                            type='button'
                            className='text-red-500 text-3xl  font-medium  px-5 py-2.5 hover:shadow-red-500/50 bg-white text-center shadow-lg mr-4'
                            onClick={() => {
                              handleDeleteAll(filterConnectors);
                            }}
                          >
                            <FontAwesomeIcon icon={faTrashCan} />
                          </button>
                          <button
                            type='button'
                            className='text-blue-500 text-3xl font-medium  px-5 py-2.5 hover:shadow-blue-500/50 bg-white text-center shadow-lg'
                            onClick={() => {
                              handleRestartAll(filterConnectors);
                            }}
                          >
                            <FontAwesomeIcon icon={faRotateRight} />
                          </button>
                        </div>
                      </div>
                      {bodyShow.includes(`${topic}-${database}`) && (
                        <div className={cx('table-container')}>
                          {connectors.map(
                            (connector, key) =>
                              connector.type === 'sink' &&
                              connector.name.includes(
                                `${topic}-${database}`
                              ) && (
                                <SinkContent
                                  key={key}
                                  topic={connector}
                                  getConfig={handleGetConfig}
                                  getErr={handleGetErr}
                                />
                              )
                          )}
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            );
          })}
      </>

      <PanelPopup>
        {popupContent['trace'] ? (
          <>
            <h1 className='text-red-500'>Error</h1>
            <span>{popupContent['trace']}</span>
          </>
        ) : (
          <>
            <h1>Configuration: {popupContent['name']}</h1>
            {Object.entries(popupContent).map(([key, value]) => (
              <div key={key}>
                <span>{key}: </span>
                <span>{value as ReactNode}</span>
              </div>
            ))}
            <div className='flex mt-5 justify-between'>
              <input
                type='text'
                className={cx('input-field')}
                onChange={(e) => {
                  setColumnsName(e.target.value);
                }}
              />
              <button
                onClick={handleFixTimestampWithZ}
                className='text-white bg-blue-500 shadow-lg shadow-blue-500/50 text-2xl  font-bold  px-5 py-2.5 rounded-lg text-center  mr-4 cursor-pointer'
              >
                Fix timestamp with Z
              </button>
            </div>
          </>
        )}
      </PanelPopup>
    </div>
  );
}
/**
 * Renders the content of a sink.
 *
 * @param {object} props - The props object.
 * @param {Topic} props.topic - The topic object.
 * @param {boolean} [props.isSub] - Optional flag indicating if the sink is a sub-sink.
 * @param {function} [props.getConfig] - Optional function to get the configuration.
 * @param {function} [props.getErr] - Optional function to get the error.
 * @return {JSX.Element} - The rendered content of the sink.
 */
const SinkContent = ({
  topic,
  getConfig,
  getErr,
}: {
  topic: Topic;
  getConfig?: (str: string) => void;
  getErr?: (str: string) => void;
}) => {
  const dispath = useAppDispatch();
  const handleRestart = async () => {
    const { kafkaConnect } = config;
    const url = `${kafkaConnect}/${topic.name}/tasks/0/restart`;
    postAPI(url, true)
      .then(() => {
        toast.success('Connector is restarted successfully');
        // dispath(fetchConnectors());
      })
      .catch((error) => {
        console.error(error);
      });
  };
  return (
    <div key={topic.name} className={cx('table-content')}>
      {topic.name}
      {topic.tasks[0].state !== 'RUNNING' && (
        <>
          <button
            onClick={() => {
              handleRestart();
            }}
            className='text-blue-500 text-3xl font-medium  px-5 py-2.5 hover:shadow-blue-500/50 bg-white text-center shadow-lg ml-3'
          >
            <FontAwesomeIcon icon={faRotateRight} />
          </button>
          <button
            onClick={() => {
              getErr && getErr(topic.name);
            }}
            className='text-blue-500 text-3xl font-medium  px-5 py-2.5 hover:shadow-blue-500/50 bg-white text-center shadow-lg ml-3'
          >
            <FontAwesomeIcon icon={faInfo} />
          </button>
          <button
            onClick={() => {
              getConfig && getConfig(topic.name);
            }}
            className='text-blue-500 text-3xl font-medium  px-5 py-2.5 hover:shadow-blue-500/50 bg-white text-center shadow-lg ml-3'
          >
            <FontAwesomeIcon icon={faFileLines} />
          </button>
          <button
            onClick={() => {
              getConfig && handleDelete(topic.name);
            }}
            className='text-red-500 text-3xl font-medium  px-5 py-2.5 hover:shadow-red-500/50 bg-white text-center shadow-lg ml-3'
          >
            <FontAwesomeIcon icon={faTrashCan} />
          </button>
        </>
      )}
      <span
        className={cx(
          topic.tasks[0].state === 'RUNNING' ? 'success-badges' : 'error-badges'
        )}
      >
        <FontAwesomeIcon
          icon={
            topic.tasks[0].state === 'RUNNING' ? faCheckCircle : faXmarkCircle
          }
          className=' mr-2'
        />
        {topic.tasks[0].state}
      </span>
    </div>
  );
};
const SourceContent = ({ topic }: { topic: Topic }) => {
  const navigate = useNavigate();
  return (
    <div key={topic.name} className={cx('source-content-wrapper')}>
      <div className={cx('source-content')}>
        {topic.name}
        <span
          className={cx(
            topic.tasks[0].state === 'RUNNING'
              ? 'success-badges'
              : 'error-badges'
          )}
        >
          <FontAwesomeIcon
            icon={
              topic.tasks[0].state === 'RUNNING' ? faCheckCircle : faXmarkCircle
            }
            className=' mr-2'
          />
          {topic.tasks[0].state}
        </span>

        <div
          className={cx('right-toolbar')}
          onClick={() => {
            navigate(`/replica-management/${topic.name}`);
          }}
        >
          View
        </div>
      </div>
    </div>
  );
};
const handleDelete = async (table: string) => {
  await deleteAPI(`${config.kafkaConnect}/${table}`, '', true);
};

export default ReplicaIndexPage;

interface Connector {
  state: string;
  worker_id: string;
}

interface Task {
  id: number;
  state: string;
  worker_id: string;
}

export interface Topic {
  name: string;
  connector: Connector;
  tasks: Task[];
  type: string;
}
