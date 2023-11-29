import classNames from 'classnames/bind';
import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';
import FormInput from 'src/components/form-input/form-input';
import styles from 'src/page/auth/login-page.module.scss';
import appSlice from 'src/redux/app-slice';
import { appSelector } from 'src/redux/redux-hook';
const cx = classNames.bind(styles);

const LoginPage = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [remember, setRemember] = useState(false);
  const navigate = useNavigate();
  const dispath = useDispatch();
  const handleClick = () => {
    dispath(appSlice.actions.setAuth({ username, password, remember }));
  };
  const { auth } = useSelector(appSelector);
  useEffect(() => {
    if (auth === 'OK') {
      toast.success('Login successfully', { position: 'bottom-right' });
      navigate('/');
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [auth]);
  return (
    <div className={cx('wrapper')}>
      <div className={cx('form')}>
        <div className={cx('form-header')}>
          <h1>Đăng nhập hệ thống</h1>
        </div>
        <div className={cx('form-body')}>
          <FormInput
            type='text'
            placeholder='Tên đăng nhập'
            value={username}
            onChange={(e) => {
              setUsername(e.target.value);
            }}
          />
          <FormInput
            type='password'
            placeholder='Mật khẩu'
            value={password}
            onChange={(e) => {
              setPassword(e.target.value);
            }}
          />
          <div className={cx('form-remember')}>
            <input
              type='checkbox'
              id='remember'
              checked={remember}
              onChange={() => setRemember(!remember)}
              className={cx('form-checkbox')}
            />
            <label htmlFor='remember'> Remember me</label>
          </div>
          <button
            className={cx('form-btn-login')}
            onClick={() => handleClick()}
          >
            Đăng nhập
          </button>
        </div>
      </div>
    </div>
  );
};

export default LoginPage;
