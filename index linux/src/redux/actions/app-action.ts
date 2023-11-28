import { OPEN_POPUP } from 'src/redux/reducers/app-reducer';

export const handleOpenPopup = (isPopupOpen: boolean, popupContent?: any) => (dispatch: any) => {
    dispatch({
        type: OPEN_POPUP,
        isPopupOpen: isPopupOpen,
        popupContent: popupContent
    });
};
