import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import classNames from 'classnames/bind';
import styles from 'src/page/replica-management-page/replica-management.module.scss';
import ErrorPage from 'src/components/error-page/error-page';
import { toast } from 'react-toastify';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faLinkSlash } from '@fortawesome/free-solid-svg-icons';
import { getAPI, postAPI } from 'src/config/ultis';
import PanelPopup from 'src/components/panel-popup/panel-popup';
import { useAppDispatch } from 'src/redux/redux-hook';
import popupSlice, { PopupStatus } from 'src/redux/popup-slice';
import FormInput from 'src/components/form-input/form-input';
import RadarLoader from 'src/components/radar-loader/radar-loader';
const config = JSON.parse(localStorage.getItem('config') || '{}');
const cx = classNames.bind(styles);
function ReplicaManagementPage() {
  const { connector } = useParams<{ connector: string }>();
  const [tables, setTables] = useState(['']);
  const [topics, setTopics] = useState<ITopic[]>([]);
  const [database, setDatabase] = useState(['']);
  const [loader, setLoader] = useState('loading');
  const [isCustomConfig, setIsCustomConfig] = useState(false);
  const [bodyShow, setBodyShow] = useState<string[]>([]);
  const { backupDbHost, backupDbUser, backupDbPassword, kafkaUI } = config;

  const [hostInput, setHostInput] = useState('');
  const [usernameInput, setUsernameInput] = useState('');
  const [passwordInput, setPasswordInput] = useState('');
  const [prefixInput, setPrefixInput] = useState('');
  const [prefixDbInput, setPrefixDbInput] = useState('');

  let link = `${kafkaUI}/ui/clusters/Default/all-topics/`;

  const handleClick = (table: string) => {
    if (bodyShow.includes(table)) {
      setBodyShow(bodyShow.filter((t) => t !== table));
    } else {
      setBodyShow([...bodyShow, table]);
    }
  };
  const fetchData = async () => {
    try {
      const { kafkaConnect } = config;
      const topicUrl = `${kafkaConnect}/${connector}/topics`;
      const [topicsResponse, connectorsResponse] = await Promise.all([
        getAPI(topicUrl, true),
        getAPI(kafkaConnect, true),
      ]);
      const completeData: ITopic[] = [];
      const { topics } = topicsResponse.data[connector || ''];
      const filterData = topics.filter((table: string) => table.includes('.'));
      filterData.forEach((element: string) => {
        const data = element.split('.');
        const sinkConnectors = connectorsResponse.data.filter(
          (item: string) =>
            `-${item.split('-')[1]}-${item.split('-')[2]}` ===
            `-${data[1]}-${data[2]}`
        );
        const prefix = sinkConnectors.map((s: string) => s.split('-')[0]);
        completeData.push({
          topic: element,
          database: data[1],
          table: data[2],
          sink: prefix.join('|'),
        });
      });
      console.log(completeData);
      setTables(filterData);
      setTopics(completeData);
      setDatabase(
        Array.from(
          new Set(filterData.map((item: string) => item.split('.')[1]))
        )
      );
      setLoader('success');
    } catch (err) {
      setLoader('error');
      console.log(err);
    }
  };
  const dispath = useAppDispatch();
  useEffect(() => {
    fetchData();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);
  if (loader === 'error') {
    return <ErrorPage />;
  }

  if (loader === 'loading') {
    return <RadarLoader />;
  }
  return (
    <div className={cx('container')}>
      <div className={cx('header')}>
        <h1>Connector: {connector}</h1>
        <button
          className='text-white text-3xl font-medium  px-5 py-2.5 hover:shadow-blue-500/50 bg-blue-500 text-center shadow-lg'
          onClick={() => {
            dispath(popupSlice.actions.setPopupStatus(PopupStatus.open));
          }}
        >
          Create Sink Connector
        </button>
      </div>
      {database.map((database: string, index) => {
        const filteredTopics = topics.filter(
          (topic: ITopic) => topic.database === database
        );
        // .sort((a, b) => a.sink.localeCompare(b.sink));

        return (
          <div key={index}>
            <div
              className={cx('container-header')}
              onClick={() => {
                handleClick(database);
              }}
            >
              {index + 1}. {database}
              <div>{`topics: ${filteredTopics.length}`}</div>
              {countTopics(filteredTopics, '') > 0 && (
                <span className={cx('red-dot')}>
                  {countTopics(filteredTopics, '')}
                </span>
              )}
            </div>
            {bodyShow.includes(database) && (
              <div className={cx('table-container')}>
                {filteredTopics.map((topic: ITopic, index) => {
                  return (
                    <div key={index} className={cx('table-content')}>
                      {`${index + 1}-${topic.table}`}
                      <div className={cx('status')}>
                        <div className={cx('status-container')}>
                          {topic.sink !== '' ? (
                            topic.sink.split('|').map((sink: string) => (
                              <div key={sink} className={cx('sink-prefix')}>
                                {sink}
                              </div>
                            ))
                          ) : (
                            <FontAwesomeIcon
                              icon={faLinkSlash}
                              className='text-red-500 cursor-pointer'
                            />
                          )}
                        </div>
                        <a
                          href={link + topic.topic}
                          target='_blank'
                          rel='noopener noreferrer'
                          className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full'
                        >
                          View in Kafka
                        </a>
                      </div>
                    </div>
                  );
                })}
              </div>
            )}
          </div>
        );
      })}

      <PanelPopup>
        <h1>Sink Connector Config</h1>
        <div className={cx('input-container')}>
          <label htmlFor='conn-string' style={{ width: '20%' }}>
            Custom config
          </label>
          <label className={cx('switch')}>
            <input
              type='checkbox'
              checked={isCustomConfig}
              onChange={(e) => {
                setIsCustomConfig(e.target.checked);
              }}
            />
            <span className={cx(['slider', 'round'])}></span>
          </label>
        </div>
        <div className={isCustomConfig === true ? cx('blur-container') : ''}>
          <div className={cx('input-container')}>
            <label htmlFor='conn-string' style={{ width: '20%' }}>
              DB Host:{' '}
            </label>
            <FormInput
              type='text'
              placeholder='Host'
              style={{ width: '40%', marginRight: '10px' }}
              value={backupDbHost}
              disabled
            />

            <FormInput
              type='text'
              placeholder='Database Prefix'
              style={{ width: '20%' }}
              disabled
            />
          </div>
          <div className={cx('input-container')}>
            <label htmlFor='conn-string' style={{ width: '20%' }}>
              Authenticator:{' '}
            </label>
            <FormInput
              type='text'
              placeholder='Username'
              style={{ width: '20%', marginRight: '10px' }}
              value={backupDbUser}
              disabled
            />
            <FormInput
              type='password'
              placeholder='Password'
              style={{ width: '20%', marginRight: '10px' }}
              value={'***********'}
              disabled
            />
          </div>
        </div>
        <div className={isCustomConfig === false ? cx('blur-container') : ''}>
          <div className={cx('input-container')}>
            <label htmlFor='conn-string' style={{ width: '20%' }}>
              DB Host:{' '}
            </label>
            <FormInput
              type='text'
              placeholder='Host'
              style={{ width: '40%', marginRight: '10px' }}
              value={hostInput}
              onChange={(e) => {
                setHostInput(e.target.value);
              }}
            />
            <FormInput
              type='text'
              placeholder='Database Prefix'
              style={{ width: '20%' }}
              value={prefixInput}
              onChange={(e) => {
                setPrefixInput(e.target.value);
              }}
            />
          </div>
          <div className={cx('input-container')}>
            <label htmlFor='conn-string' style={{ width: '20%' }}>
              Authenticator:{' '}
            </label>
            <FormInput
              type='text'
              placeholder='Username'
              style={{ width: '20%', marginRight: '10px' }}
              value={usernameInput}
              onChange={(e) => {
                setUsernameInput(e.target.value);
              }}
            />
            <FormInput
              type='password'
              placeholder='Password'
              style={{ width: '20%', marginRight: '10px' }}
              value={passwordInput}
              onChange={(e) => {
                setPasswordInput(e.target.value);
              }}
            />
            <FormInput
              type='text'
              placeholder='Prefix for db name'
              style={{ width: '20%', marginRight: '10px' }}
              value={prefixDbInput}
              onChange={(e) => {
                setPrefixDbInput(e.target.value);
              }}
            />
          </div>
        </div>
        <button
          className={cx('button-create')}
          onClick={() => {
            if (isCustomConfig) {
              connector &&
                createSinkConnector(
                  tables,
                  connector,
                  hostInput,
                  prefixInput,
                  passwordInput,
                  usernameInput,
                  prefixDbInput
                );
            } else {
              connector &&
                createSinkConnector(
                  tables,
                  connector,
                  backupDbHost,
                  '',
                  backupDbPassword,
                  backupDbUser
                );
            }
          }}
        >
          Create Sink Connector
        </button>
      </PanelPopup>
    </div>
  );
}
/**
 * Creates a sink connector for the given data.
 *
 * @param {string[]} data - An array of data.
 * @param {string} connector - The connector string.
 * @param {string} host - The host string.
 * @param {string} prefix - The prefix string.
 * @param {string} password - The password string.
 * @param {string} username - The username string.
 * @param {string} [prefixDbname] - The backupname string.
 * @return {Promise<void>} A promise that resolves when the sink connector is created.
 */
const createSinkConnector = async (
  data: string[],
  connector: string,
  host: string,
  prefix: string,
  password: string,
  username: string,
  prefixDbname?: string
) => {
  if (host.length === 0 || password.length === 0 || username.length === 0) {
    toast.error('Please fill all fields', {
      position: 'top-center',
      autoClose: 5000,
      hideProgressBar: true,
      closeOnClick: true,
      pauseOnHover: true,
      draggable: true,
      progress: undefined,
      theme: 'light',
    });
    return;
  }
  const sqlHepperApiURL = `${config.apiURL}/get-primary-key`;
  const uniqueList = Array.from(
    new Set(data.map((item) => item.split('.')[1]))
  );
  const connPrefix = prefix === '' ? 'sink-' : `${prefix}-`;
  await Promise.all(
    uniqueList.map(async (db) => {
      const response = await getAPI(
        `${sqlHepperApiURL}?dbname=${db}&server=${connector.toLowerCase()}`
      );
      const finalDbName = prefixDbname ? `${prefixDbname}_${db}` : db;
      await Promise.all(
        response.data.map(async (item: any) => {
          const connectorName = `${connPrefix}${db}-${item['TABLE_NAME']}`;
          const connectionUrl = `jdbc:mysql://${host}/${finalDbName}?useSSL=false`;
          const body = {
            name: connectorName,
            config: {
              'connector.class': 'io.confluent.connect.jdbc.JdbcSinkConnector',
              'key.converter': 'org.apache.kafka.connect.json.JsonConverter',
              'value.converter': 'org.apache.kafka.connect.json.JsonConverter',
              'key.converter.schemas.enable': 'true',
              'value.converter.schemas.enable': 'true',
              'tasks.max': '1',
              'connection.url': connectionUrl,
              'connection.user': username,
              'connection.password': password,
              topics: `${data[0].split('.')[0]}.${db}.${item['TABLE_NAME']}`,
              'insert.mode': 'upsert',
              'auto.create': 'true',
              'auto.evolve': 'true',
              'delete.enabled': 'true',
              'schema.evolution': 'basic',
              'database.time_zone': 'UTC',
              'pk.mode': 'record_key',
              'pk.fields': `${item['PK'].join(',')}`,
              'time.precision.mode': 'connect',
              transforms: 'dropTopicPrefix',
              'transforms.dropTopicPrefix.type':
                'org.apache.kafka.connect.transforms.RegexRouter',
              'transforms.dropTopicPrefix.regex': '([^.]+)\\.([^.]+)\\.([^.]+)',
              'transforms.dropTopicPrefix.replacement': '$3',
            },
          };
          try {
            await postAPI(config.kafkaConnect, body, true);
            toast.success(`${item['TABLE_NAME']} is created successfully`, {
              position: 'top-right',
              autoClose: 5000,
              hideProgressBar: true,
              closeOnClick: true,
              pauseOnHover: true,
              draggable: true,
              progress: undefined,
              theme: 'colored',
            });
          } catch (error) {
            console.log(error);
          } finally {
            console.log(body);
          }
        })
      );
    })
  );
};

export default ReplicaManagementPage;
interface ITopic {
  topic: string;
  database: string;
  table: string;
  sink: string;
  [key: string]: string;
}
const countTopics = (data: ITopic[], value: string) => {
  return data.filter((item) => item.sink === value).length;
};
