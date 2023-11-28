import classNames from 'classnames/bind';
import styles from 'src/components/loading/loading.module.scss';

const cx = classNames.bind(styles);

const LoadingComponent = () => {
  return (
    <div className={cx('wrapper')}>
      <span className={cx('loader')} />
    </div>
  );
};
export default LoadingComponent;
