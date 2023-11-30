import axios from 'axios';
import { ReactNode, useEffect, useState } from 'react';
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
import { useSelector } from 'react-redux';
import popupSlice, { PopupStatus } from 'src/redux/popup-slice';
import { fetchConnectors } from 'src/redux/connector-slice';
import { ConnectorSelector, useAppDispatch } from 'src/redux/redux-hook';
import LoadingComponent from 'src/components/loading/loading';
import { useNavigate } from 'react-router-dom';
const cx = classNames.bind(styles);
const config = JSON.parse(localStorage.getItem('config') || '{}');
function ReplicaIndexPage() {
  const [isChecked, setIsChecked] = useState(false);
  const [popupContent, setPopupContent] = useState<any>({});
  const [bodyShow, setBodyShow] = useState<string[]>([]);
  const [columnsName, setColumnsName] = useState('');
  const {
    connectors,
    databases: database,
    status,
  } = useSelector(ConnectorSelector);
  const dispath = useAppDispatch();
  useEffect(() => {
    dispath(fetchConnectors());
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);
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
        fetchConnectors();
      })
      .catch((error) => {
        console.error(error);
      });
  };
  const handleDeleteAll = async (tables: Topic[]) => {
    Promise.all(tables.map((connector) => handleDelete(connector.name)))
      .then(() => {
        toast.success('All connectors are deleted successfully');
        fetchConnectors();
      })
      .catch((error) => {
        console.error(error);
      });
  };
  const handleGetConfig = async (tableName: string) => {
    const configUrl = `${config.kafkaConnect}/${tableName}/config`;
    axios.get(configUrl).then((response) => {
      setPopupContent(response.data);
    });
    dispath(popupSlice.actions.setPopupStatus(PopupStatus.open));
  };

  const handleGetErr = async (tableName: string) => {
    const errUrl = `${config.kafkaConnect}/${tableName}/status`;
    axios.get(errUrl).then((res) => {
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
    axios
      .put(
        `${config.kafkaConnect}/${popupContent['name']}/config`,
        JSON.stringify(popupContent),
        {
          headers: { 'Content-Type': 'application/json' },
        }
      )
      .then((res) => {
        toast.success('Connector is restarted successfully');
      });
    // console.log(popupContent);
  };
  return status === 'success' ? (
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
          database.map((database, index) => {
            const filterConnectors = [...connectors]
              .sort((a, b) => a.tasks[0].state.localeCompare(b.tasks[0].state))
              .filter(
                (connector) =>
                  connector.type === 'sink' && connector.name.includes(database)
              );
            const failedConnectors = filterConnectors.filter(
              (connector) => connector.tasks[0].state === 'FAILED'
            );
            return (
              <div key={index}>
                <div
                  className={cx([
                    'container-header',
                    bodyShow.includes(database) ? 'active' : '',
                  ])}
                  onClick={() => {
                    handleClick(database);
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
                {bodyShow.includes(database) && (
                  <div className={cx('table-container')}>
                    {connectors.map(
                      (connector, key) =>
                        connector.type === 'sink' &&
                        connector.name.includes(database) && (
                          <SinkContent
                            key={key}
                            topic={connector}
                            isSub={true}
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
  ) : status === 'loading' ? (
    <LoadingComponent />
  ) : (
    <ErrorPage />
  );
}
const SinkContent = ({
  topic,
  isSub,
  getConfig,
  getErr,
}: {
  topic: Topic;
  isSub?: boolean;
  getConfig?: (str: string) => void;
  getErr?: (str: string) => void;
}) => {
  return (
    <div key={topic.name} className={cx('table-content')}>
      {topic.name}
      {isSub && topic.tasks[0].state !== 'RUNNING' && (
        <>
          <button
            onClick={() => {
              axios
                .post(`${config.kafkaConnect}/${topic.name}/restart`)
                .then(() => {
                  toast.success('Connector is restarted successfully');
                  // fetchConnectors();
                })
                .catch((error) => {
                  console.error(error);
                });
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
    <div
      key={topic.name}
      className={cx('source-content')}
      onClick={() => {
        navigate(`/replica-management/${topic.name}`);
      }}
    >
      {topic.name}
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
const handleDelete = async (table: string) => {
  await axios.delete(`${config.kafkaConnect}/${table}`);
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