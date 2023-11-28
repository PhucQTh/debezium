import { ReactNode } from 'react';
import styles from 'src/components/panel-popup/panel-popup.module.scss';
import classNames from 'classnames/bind';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faXmark } from '@fortawesome/free-solid-svg-icons';
import { useAppDispatch, useAppSelector } from 'src/redux/hook';
import { handleOpenPopup } from 'src/redux/actions/app-action';
const cx = classNames.bind(styles);
type PopupProps = {
  children: ReactNode;
};

const PanelPopup = ({ children }: PopupProps) => {
  const handleButtonClick = () => {
    dispath(handleOpenPopup(!isPopupOpen));
  };
  const appConfig = useAppSelector((state) => state.appReducer);
  const dispath = useAppDispatch();
  const { isPopupOpen } = appConfig;

  return (
    <div className={isPopupOpen ? cx('wrapper') : cx('wrapper-hide')}>
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
