import { ReactNode } from 'react';
import styles from 'src/components/panel-popup/panel-popup.module.scss';
import classNames from 'classnames/bind';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faXmark } from '@fortawesome/free-solid-svg-icons';
const cx = classNames.bind(styles);
type PopupProps = {
  children: ReactNode;
  isShow: boolean;
  onClose: () => void;
};

const PanelPopup = ({ children, isShow, onClose }: PopupProps) => {
  const handleButtonClick = () => {
    onClose();
  };

  return (
    <div className={isShow ? cx('wrapper') : cx('wrapper-hide')}>
      <div className={cx('popup')}>
        <div className={cx('close')} onClick={handleButtonClick}>
          <label className={cx('tooltip')}>Close</label>
          <FontAwesomeIcon icon={faXmark} />
        </div>
        {children}
      </div>
    </div>
  );
};
export default PanelPopup;
