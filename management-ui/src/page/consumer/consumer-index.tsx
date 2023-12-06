import { useEffect, useState } from 'react';
import {
  IConsumers,
  IDatabase,
  deleteConsumers,
  fetchConsumers,
} from 'src/redux/consumer-slice';
import styles from 'src/page/consumer/consumer.module.scss';
import {
  consumerSelector,
  useAppDispatch,
  useAppSelector,
} from 'src/redux/redux-hook';
import classNames from 'classnames/bind';
const cx = classNames.bind(styles);
const ConsumerIndex = () => {
  const dispath = useAppDispatch();
  const { consumers } = useAppSelector(consumerSelector);
  const [expand, setExpand] = useState(['']);
  const handleClick = (table: string) => {
    if (expand.includes(table)) {
      setExpand(expand.filter((t) => t !== table));
    } else {
      setExpand([...expand, table]);
    }
    console.log(expand);
  };
  const handleDelete = (group: IConsumers) => {
    dispath(deleteConsumers(group));
  };
  useEffect(() => {
    dispath(fetchConsumers());
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);
  return (
    <div>
      <h1>Consumers management</h1>
      {consumers.map((group: IConsumers, key) => {
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
