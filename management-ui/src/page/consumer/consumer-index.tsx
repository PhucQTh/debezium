import { useState } from 'react';
import styles from 'src/page/consumer/consumer.module.scss';
import classNames from 'classnames/bind';
import {
  IConsumers,
  IDatabase,
  deleteConsumer,
  useConsumers,
} from 'src/query/consumer.query';
import { useQueryClient } from '@tanstack/react-query';
const cx = classNames.bind(styles);
const ConsumerIndex = () => {
  const [expand, setExpand] = useState(['']);

  const handleClick = (table: string) => {
    if (expand.includes(table)) {
      setExpand(expand.filter((t) => t !== table));
    } else {
      setExpand([...expand, table]);
    }
  };

  const handleDelete = (group: IConsumers) => {
    deleteConsumer(group).then(() => {});
  };
  const queryClient = useQueryClient();
  const { data, isError, isLoading, isFetching } = useConsumers();

  //#REGION HANDLE STATUS
  if (isLoading) {
    return <div>Loading...</div>;
  }
  if (isError) {
    return <div>Error</div>;
  }
  if (isFetching) {
    return <div>Fetching</div>;
  }
  //#endregion
  return (
    <div>
      <h1>Consumers management</h1>
      {data.map((group: IConsumers, key: number) => {
        return (
          <div key={key}>
            <div className={cx('group')}>
              {group['name']}
              <button className={cx('btn-delete')} onClick={() => {}}>
                Delete
              </button>
            </div>
            {group.databases.map((database: IDatabase, key) => {
              return (
                <div key={key}>
                  <div
                    className={cx('database')}
                    onClick={() => {
                      handleClick(`${group['name']}-${database.name}`);
                    }}
                  >
                    {database.name}
                    {expand.includes(`${group['name']}-${database.name}`) && (
                      <button
                        className={cx('btn-delete')}
                        onClick={() => {
                          handleDelete(group);
                        }}
                      >
                        Delete
                      </button>
                    )}
                  </div>
                  <div
                    className={cx([
                      'table',
                      expand.includes(`${group['name']}-${database.name}`)
                        ? 'active'
                        : '',
                    ])}
                  >
                    {database.table.map((table: any, key) => {
                      return (
                        <div key={key} className={cx(['table-item'])}>
                          {table.name}
                        </div>
                      );
                    })}
                  </div>
                </div>
              );
            })}
          </div>
        );
      })}
    </div>
  );
};

export default ConsumerIndex;
