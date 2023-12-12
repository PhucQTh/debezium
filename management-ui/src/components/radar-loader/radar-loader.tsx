// https://freecodez.com
import style from './radar-loader.module.scss';
import classNames from 'classnames/bind';

const cx = classNames.bind(style);
const RadarLoader = () => {
  return (
    <div className={cx('loader')}>
      <span></span>
    </div>
  );
};

export default RadarLoader;
