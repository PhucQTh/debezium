import classNames from 'classnames/bind';
import { Link } from 'react-router-dom';
import styles from 'src/components/layout/header.module.scss';
const cx = classNames.bind(styles);
function Header() {
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
        </div>
      </div>
    </>
  );
}

export default Header;
