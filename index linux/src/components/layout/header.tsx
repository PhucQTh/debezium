import classNames from 'classnames/bind';
import { useSelector } from 'react-redux';
import { Link, useNavigate } from 'react-router-dom';
import styles from 'src/components/layout/header.module.scss';
import { hostConfig } from 'src/config/config';
import appSlice from 'src/redux/app-slice';
import { appSelector, useAppDispatch } from 'src/redux/redux-hook';
const cx = classNames.bind(styles);
function Header() {
  const dispath = useAppDispatch();
  const env = useSelector(appSelector).environment;
  const navigate = useNavigate();
  const handleChange = (value: string) => {
    dispath(appSlice.actions.setEnv(value));
    navigate(0);
  };
  return (
    <>
      <div className={cx('header-wrapper')}>
        <div className={cx('header-mobile')}>
          <Link to={'/'}>
            <img
              src='/logo.png'
              alt='logo-accredoasia'
              className={cx('logo')}
            />
          </Link>
        </div>
        <div className={cx('header-container')}>
          <div className={cx('header-left')}>
            <Link to={'/'}>
              <img
                src='/logo.png'
                alt='logo-accredoasia'
                className={cx('logo')}
              />
            </Link>
          </div>
          <div className={cx('header-right')}>
            <select
              onChange={(e) => {
                handleChange(e.target.value);
              }}
              value={env.name}
            >
              {hostConfig.map((item) => (
                <option key={item.name} value={item.name}>
                  {item.name}
                </option>
              ))}
            </select>
          </div>
        </div>
      </div>
    </>
  );
}

export default Header;
