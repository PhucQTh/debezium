import axios from 'axios';
import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import classNames from 'classnames/bind';
import styles from 'src/page/replica-management-page/replica-management.module.scss';
import ErrorPage from 'src/components/error-page/error-page';
import { toast } from 'react-toastify';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faLink, faLinkSlash } from '@fortawesome/free-solid-svg-icons';
const config = JSON.parse(localStorage.getItem('config') || '{}');
const cx = classNames.bind(styles);
function ReplicaManagementPage() {
  const { connector } = useParams<{ connector: string }>();
  const [tables, setTables] = useState(['']);
  const [topics, setTopics] = useState<ITopic[]>([]);
  const [database, setDatabase] = useState(['']);
  const [loader, setLoader] = useState('loading');
  let link = `${config.kafkaUI}/ui/clusters/Default/all-topics/`;
  const [bodyShow, setBodyShow] = useState<string[]>([]);

  const handleClick = (table: string) => {
    if (bodyShow.includes(table)) {
      setBodyShow(bodyShow.filter((t) => t !== table));
    } else {
      setBodyShow([...bodyShow, table]);
    }
  };
  const fetchData = async () => {
    try {
      const { kafkaConnect, sqlHelperUrl } = config;
      const topicUrl = `${kafkaConnect}/${connector}/topics`;
      const [topicsResponse, connectorsResponse] = await Promise.all([
        axios.get(`${sqlHelperUrl}/connectors?api=${topicUrl}`),
        axios.get(`${sqlHelperUrl}/connectors?api=${kafkaConnect}`),
      ]);

      const { topics } = topicsResponse.data[connector || ''];
      const filterData = topics.filter((table: string) => table.includes('.'));
      const sinkConnectors = connectorsResponse.data.filter((item: string) =>
        item.includes('sink-')
      );
      const completeData: ITopic[] = [];
      filterData.forEach((element: string) => {
        const data = element.split('.');
        if (sinkConnectors.includes(`sink-${data[1]}-${data[2]}`)) {
          completeData.push({
            topic: element,
            database: data[1],
            table: data[2],
            sink: `sink-${data[1]}-${data[2]}`, //THIS IS FORMAT SINK-DB-TABLE
          });
        } else {
          completeData.push({
            topic: element,
            database: data[1],
            table: data[2],
            sink: ``, //THIS IS FORMAT SOURCE-DB-TABLE
          });
        }
      });
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

  useEffect(() => {
    fetchData();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <div className={cx('container')}>
      {loader === 'success' ? (
        <>
          <div className='mt-10'>
            <h1>Connector: {connector}</h1>
            <button
              className='text-white text-3xl font-medium  px-5 py-2.5 hover:shadow-blue-500/50 bg-blue-500 text-center shadow-lg'
              onClick={() => {
                connector && createSinkConnector(tables, connector);
              }}
            >
              Create Sink Connector
            </button>
          </div>
          {database.map((database: string, index) => {
            const filteredTopics = topics
              .filter((topic: ITopic) => topic.database === database)
              .sort((a, b) => a.sink.localeCompare(b.sink));

            return (
              <div key={index}>
                <div
                  className={cx('database-container')}
                  onClick={() => {
                    handleClick(database);
                  }}
                >
                  <h1>
                    {index + 1}. {database}
                  </h1>
                  <div>{`topics: ${filteredTopics.length}`}</div>
                  {countTopics(filteredTopics, '') > 0 && (
                    <span className={cx('red-dot')}>
                      {countTopics(filteredTopics, '')}
                    </span>
                  )}
                </div>
                {bodyShow.includes(database) && (
                  <div className={cx('table-container')}>
                    <table className='w-full table-fixed bg-white'>
                      <tbody>
                        {filteredTopics.map((topic: ITopic, index) => {
                          return (
                            <tr key={index}>
                              <td className='py-4 px-6 border-b border-gray-200'>
                                {`${index + 1}-${topic.table}`}
                              </td>
                              <td className='py-4 px-6 border-b border-gray-200 text-center'>
                                {topic.sink !== '' ? (
                                  <FontAwesomeIcon
                                    icon={faLink}
                                    className='text-green-500 cursor-pointer'
                                  />
                                ) : (
                                  <FontAwesomeIcon
                                    icon={faLinkSlash}
                                    className='text-red-500 cursor-pointer'
                                  />
                                )}
                              </td>
                              <td className='py-4 px-6 border-b border-gray-200 text-center'>
                                <a
                                  href={link + topic.topic}
                                  target='_blank'
                                  rel='noopener noreferrer'
                                  className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full'
                                >
                                  View in Kafka
                                </a>
                              </td>
                            </tr>
                          );
                        })}
                      </tbody>
                    </table>
                  </div>
                )}
              </div>
            );
          })}
        </>
      ) : loader === 'loading' ? (
        <span className={cx('loader')} />
      ) : (
        <ErrorPage />
      )}
    </div>
  );
}
const createSinkConnector = async (data: string[], connector: string) => {
  const sqlHepperApiURL = `${
    config.sqlHelperUrl
  }/get-pk/${connector.toLowerCase()}/`;
  const uniqueList = Array.from(
    new Set(data.map((item) => item.split('.')[1]))
  );
  const {
    backupDbHost,
    backupDbUser,
    backupDbPassword,
    sftBackupDbHost,
    sftBackupDbUser,
    sftBackupDbPassword,
  } = config;
  const host =
    connector.toLowerCase() === 'sft' ? sftBackupDbHost : backupDbHost;
  const user =
    connector.toLowerCase() === 'sft' ? sftBackupDbUser : backupDbUser;
  const password =
    connector.toLowerCase() === 'sft' ? sftBackupDbPassword : backupDbPassword;

  await Promise.all(
    uniqueList.map(async (db) => {
      const response = await axios.get(`${sqlHepperApiURL}${db}`);
      await Promise.all(
        response.data.map(async (item: any) => {
          const connectorName = `sink-${db}-${item['TABLE_NAME']}`;
          const connectionUrl = `jdbc:mysql://${host}/${db}?useSSL=false`;
          // const connectionUrl = `jdbc:mysql://${config.backupDbHost}/clone_sft?useSSL=false`;
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
              'connection.user': user,
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
            await axios.post(config.kafkaConnect, body, {
              headers: { 'Content-Type': 'application/json' },
            });
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
            console.log('done');
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
