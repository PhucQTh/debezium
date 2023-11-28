import { ReactNode } from 'react';
import styles from 'src/components/panel-popup/panel-popup.module.scss';
import classNames from 'classnames/bind';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faXmark } from '@fortawesome/free-solid-svg-icons';
import popupSlice, { PopupStatus } from 'src/redux/popup-slice';
import { useDispatch, useSelector } from 'react-redux';
import { popupSelector } from 'src/redux/redux-hook';
const cx = classNames.bind(styles);
type PopupProps = {
  children: ReactNode;
};

const PanelPopup = ({ children }: PopupProps) => {
  const dispath = useDispatch();
  const popupStatus = useSelector(popupSelector);
  const handleButtonClick = () => {
    dispath(popupSlice.actions.setPopupStatus(PopupStatus.close));
  };

  return (
    <div
      className={
        popupStatus === PopupStatus.open ? cx('wrapper') : cx('wrapper-hide')
      }
    >
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
