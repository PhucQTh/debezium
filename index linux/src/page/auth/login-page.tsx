import classNames from 'classnames/bind';
import FormInput from 'src/components/form-input/form-input';
import styles from 'src/page/auth/login-page.module.scss';
const cx = classNames.bind(styles);

const LoginPage = () => {
  const handleClick = () => {
    console.log('click');
  };
  return (
    <div className={cx('wrapper')}>
      <div className={cx('form')}>
        <div className={cx('form-header')}>
          <h1>Đăng nhập hệ thống</h1>
        </div>
        <div className={cx('form-body')}>
          <FormInput type='text' placeholder='Tên đăng nhập' />
          <FormInput type='password' placeholder='Mật khẩu' />
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
