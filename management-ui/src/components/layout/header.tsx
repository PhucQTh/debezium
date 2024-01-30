import React from 'react';
import { useSelector } from 'react-redux';
import { Link, useNavigate } from 'react-router-dom';
import styles from 'src/components/layout/header.module.scss';
import { hostConfig } from 'src/config/config';
import appSlice from 'src/redux/app-slice';
import { appSelector, useAppDispatch } from 'src/redux/redux-hook';

const Header = React.memo(() => {
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
      <div className={styles['header-wrapper']}>
        <div className={styles['header-mobile']}>
          <Link to={'/'}>
            <img
              src='/logo.png'
              alt='logo-accredoasia'
              className={styles['logo']}
            />
          </Link>
        </div>
        <div className={styles['header-container']}>
          <div className={styles['header-left']}>
            <Link to={'/'}>
              <img
                src='/logo.png'
                alt='logo-accredoasia'
                className={styles['logo']}
              />
            </Link>
          </div>
          {auth && (
            <div className={styles['header-right']}>
              <select
                className={styles['select-environment']}
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

              <div className={styles['btn-logout']} onClick={handleLogout}>
                Logout
              </div>
            </div>
          )}
        </div>
      </div>
    </>
  );
})

export default Header;
