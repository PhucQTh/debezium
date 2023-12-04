import classNames from 'classnames/bind';
import { useState } from 'react';
import { getAPI, numberWithCommas } from 'src/config/ultis';
import styles from 'src/page/database-management/database-management.module.scss';

const cx = classNames.bind(styles);
const { apiURL } = JSON.parse(localStorage.getItem('config') || '{}');
const servers = ['production', 'sft'].sort();

interface IBinlog {
  Log_name: string;
  File_size: number;
}
const DatabaseIndexPage = () => {
  const [data, setData] = useState<IBinlog[]>([]);
  const fetchData = (server: string) => {
    try {
      getAPI(`${apiURL}/binlog?server=${server}`).then((response) => {
        setData(response.data);
      });
    } catch (error) {
      console.error(error);
    }
  };

  const sizeToGigabytes = () => {
    let sum = 0;
    for (let i = 0; i < data.length; i++) {
      sum += data[i].File_size;
    }
    return (sum / (1024 * 1024 * 1024)).toFixed(2);
  };

  return (
    <div className={cx('container')}>
      <h1 className='mt-10'>Database management</h1>
      <div className={cx('wrapper')}>
        <div className={cx('server-list')}>
          {servers.map((server) => (
            <div
              key={server}
              className={cx('server-card')}
              onClick={() => fetchData(server)}
            >
              {server}
            </div>
          ))}
        </div>
        <div className={cx('data-card')}>
          {data.map((item, index) => (
            <div key={index} className={cx('binfile')}>{`Log name: ${
              item.Log_name
            } - Log size: ${numberWithCommas(item.File_size)}`}</div>
          ))}
          {data.length !== 0 && (
            <div className={cx('card-footer')}>
              {`Total: ${data.length} - Size: ${sizeToGigabytes()} GB`}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default DatabaseIndexPage;
