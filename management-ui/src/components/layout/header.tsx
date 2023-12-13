import classNames from 'classnames/bind';
import { useSelector } from 'react-redux';
import { Link, useNavigate } from 'react-router-dom';
import styles from 'src/components/layout/header.module.scss';
import { hostConfig } from 'src/config/config';
import appSlice from 'src/redux/app-slice';
import { appSelector, useAppDispatch } from 'src/redux/redux-hook';
import { QueryCache } from '@tanstack/react-query';
const cx = classNames.bind(styles);

function Header() {
  const dispath = useAppDispatch();
  const { environment, auth } = useSelector(appSelector);
  const navigate = useNavigate();
  const handleChange = (value: string) => {
    dispath(appSlice.actions.setEnv(value));
    navigate('/');
    window.location.reload();
  };
  const handleLogout = () => {
    dispath(appSlice.actions.setLogout());
    navigate('/login');
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
          {auth && (
            <div className={cx('header-right')}>
              <select
                className={cx('select-environment')}
                onChange={(e) => {
                  handleChange(e.target.value);
                }}
                value={environment.name}
              >
                {hostConfig.map((item) => (
                  <option key={item.name} value={item.name}>
                    {item.name}
                  </option>
                ))}
              </select>

              <div className={cx('btn-logout')} onClick={handleLogout}>
                Logout
              </div>
            </div>
          )}
        </div>
      </div>
    </>
  );
}

export default Header;
