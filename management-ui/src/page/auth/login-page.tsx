import classNames from 'classnames/bind';
import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';
import FormInput from 'src/components/form-input/form-input';
import styles from 'src/page/auth/login-page.module.scss';
import { login } from 'src/redux/app-slice';
import {
  appSelector,
  useAppDispatch,
  useAppSelector,
} from 'src/redux/redux-hook';
const cx = classNames.bind(styles);

const LoginPage = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();
  const dispath = useAppDispatch();
  const handleClick = () => {
    dispath(login({ username, password }));
  };
  const { auth } = useAppSelector(appSelector);
  const now = Date.now();
  useEffect(() => {
    if (auth && JSON.parse(auth).exp * 1000 > now) {
      toast.success('Login successfully');
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
