import axios from 'axios';
import { ReactNode, useEffect, useState } from 'react';
import classNames from 'classnames/bind';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import styles from 'src/page/replica-management-page/replica-management.module.scss';
import { toast } from 'react-toastify';
import ErrorPage from 'src/components/error-page/error-page';
import { config } from 'src/config/config';
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
import { handleOpenPopup } from 'src/redux/actions/app-action';
import { useAppDispatch, useAppSelector } from 'src/redux/hook';
const cx = classNames.bind(styles);
function ReplicaIndexPage() {
  const [connectors, setConnectors] = useState<Topic[]>([]);
  const [isChecked, setIsChecked] = useState(false);
  const [loader, setLoader] = useState('loading');
  const [database, setDatabase] = useState(['']);
  const [popupContent, setPopupContent] = useState<any>({});
  const [bodyShow, setBodyShow] = useState<string[]>([]);
  const [columnsName, setColumnsName] = useState('');

  const appConfig = useAppSelector((state) => state.appReducer);
  const dispath = useAppDispatch();
  const { isPopupOpen } = appConfig;
  const fetchConnectors = async () => {
    try {
      const response = await axios.get(config.kafkaConnect);
      const connectors = [...response.data];
      const tempConnectors = await Promise.all(
        connectors.map(async (connector) => {
          const statusUrl = `${config.kafkaConnect}/${connector}/status`;
          const statusResponse = await axios.get(statusUrl);
          return statusResponse.data;
        })
      );
      setConnectors(tempConnectors);
      const databases = tempConnectors
        .filter((connector) => connector.type === 'sink')
        .map((connector) => connector.name.split('-')[1]);
      setDatabase(Array.from(new Set(databases)));
      setLoader('success');
    } catch (error) {
      console.error(error);
    }
  };
  useEffect(() => {
    fetchConnectors();
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
  };

  const handleGetErr = async (tableName: string) => {
    const errUrl = `${config.kafkaConnect}/${tableName}/status`;
    axios.get(errUrl).then((res) => {
      setPopupContent(res.data['tasks']['0']);
    });
    dispath(handleOpenPopup(!isPopupOpen, 'aaaa'));
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
  return loader === 'success' ? (
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
      <div className='shadow-lg rounded-lg overflow-hidden  mt-5'>
        <table className='w-full table-fixed'>
          <thead>
            <tr className='bg-gray-300'>
              <th className='w-3/5 py-4 px-6 text-left text-gray-600 font-bold uppercase'>
                Connector Name
              </th>
              <th
                className='w-1/5 py-4 px-6 text-center text-gray-600 font-bold uppercase'
                colSpan={2}
              >
                Status
              </th>
            </tr>
          </thead>
          <tbody className={cx('table-content')}>
            {isChecked === false &&
              connectors.map(
                (connector, key) =>
                  connector.type === 'source' && (
                    <TableContent topic={connector} key={key} />
                  )
              )}
            {isChecked === true &&
              database.map((database, index) => {
                const filterConnectors = connectors
                  .sort((a, b) =>
                    a.tasks[0].state.localeCompare(b.tasks[0].state)
                  )
                  .filter(
                    (connector) =>
                      connector.type === 'sink' &&
                      connector.name.includes(database)
                  );
                const failedConnectors = filterConnectors.filter(
                  (connector) => connector.tasks[0].state === 'FAILED'
                );
                return (
                  <>
                    <tr
                      key={index}
                      className='cursor-pointer bg-gray-100 hover:bg-gray-200'
                    >
                      <td
                        colSpan={1}
                        className='py-4 px-6'
                        onClick={() => {
                          handleClick(database);
                        }}
                      >
                        {`${database} - Total: ${filterConnectors.length}`}
                        <span>{` - Failed: ${failedConnectors.length}`}</span>
                      </td>
                      <td
                        colSpan={2}
                        className='py-4 px-6 justify-center text-center'
                      >
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
                      </td>
                    </tr>
                    {bodyShow.includes(database) &&
                      connectors.map(
                        (connector, key) =>
                          connector.type === 'sink' &&
                          connector.name.includes(database) && (
                            <TableContent
                              topic={connector}
                              isSub={true}
                              getConfig={handleGetConfig}
                              getErr={handleGetErr}
                            />
                          )
                      )}
                  </>
                );
              })}
          </tbody>
        </table>
      </div>
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
  ) : loader === 'loading' ? (
    <div className={cx('container')}>
      <span className={cx('loader')} />
    </div>
  ) : (
    <ErrorPage />
  );
}
const TableContent = ({
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
    <tr key={topic.name} className={`cursor-pointer hover:bg-gray-100`}>
      <td
        className={`w-3/5 py-4 text-left   ${isSub ? 'px-10' : 'px-6'} ${
          topic.tasks[0].state !== 'RUNNING' ? 'text-red-500' : 'text-gray-600'
        }`}
      >
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
      </td>
      <td className='w-1/5 py-4 px-6  text-center text-gray-600'>
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
      </td>
      <td className='w-1/5 py-4 px-6 text-center text-gray-600'>
        <a
          href={`/replica-management/${topic.name}`}
          className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full mx-2'
        >
          View Detail
        </a>
      </td>
    </tr>
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

interface Topic {
  name: string;
  connector: Connector;
  tasks: Task[];
  type: string;
}
