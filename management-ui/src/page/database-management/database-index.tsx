import { useMutation, useQueryClient } from '@tanstack/react-query';
import classNames from 'classnames/bind';
import { useState } from 'react';
import { toast } from 'react-toastify';
import { numberWithCommas } from 'src/config/ultis';
import styles from 'src/page/database-management/database-management.module.scss';
import { useDatabaseQuery, deleteBinlog } from 'src/query/database.query';
const cx = classNames.bind(styles);
const servers = ['production', 'sft'].sort();

interface IBinlog {
  Log_name: string;
  File_size: number;
}
const DatabaseIndexPage = () => {
  const [isChoiced, setIsChoiced] = useState(servers[0]);
  const [binlogName, setBinlogName] = useState('');
  const queryClient = useQueryClient();

  const sizeToGigabytes = () => {
    let sum = 0;
    for (let i = 0; i < data[isChoiced].length; i++) {
      sum += data[isChoiced][i].File_size;
    }
    return (sum / (1024 * 1024 * 1024)).toFixed(2);
  };
  const mutation = useMutation({
    mutationFn: () => deleteBinlog(binlogName, isChoiced),
    onSuccess: async () => {
      toast.success('Deleted successfully!');
      await queryClient.invalidateQueries({
        queryKey: ['databases'],
      });
    },
    onError: () => {
      toast.error('Delete failed!');
    },
  });

  const { data, isLoading, isError, isFetching } = useDatabaseQuery();
  if (isLoading) {
    return <div>Loading...</div>;
  }
  if (isError) {
    return <div>Error</div>;
  }
  if (isFetching) {
    return <div>Fetching</div>;
  }

  return (
    <div className={cx('container')}>
      <h1 className='mt-10'>Database management</h1>
      <div className={cx('wrapper')}>
        <div className={cx('server-list')}>
          {servers.map((server) => (
            <div
              key={server}
              className={cx('server-card')}
              onClick={() => setIsChoiced(server)}
            >
              {server}
            </div>
          ))}
        </div>
        <div className={cx('data-card')}>
          {data[isChoiced].map((item: IBinlog, index: number) => (
            <div key={index} className={cx('binfile')}>
              {`Log name: ${item.Log_name} - Log size: ${numberWithCommas(
                item.File_size
              )}`}
              {index !== 0 && (
                <div
                  className={cx('btn-clear-binlog')}
                  onClick={() => {
                    setBinlogName(item.Log_name);
                    mutation.mutate();
                  }}
                >
                  Clear Before
                </div>
              )}
            </div>
          ))}
          {data[isChoiced].length !== 0 && (
            <div className={cx('card-footer')}>
              {`Total: ${
                data[isChoiced].length
              } - Size: ${sizeToGigabytes()} GB`}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default DatabaseIndexPage;
