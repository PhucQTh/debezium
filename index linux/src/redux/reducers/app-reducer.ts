export const OPEN_POPUP = 'OPEN_CART';
const initState = {
    isPopupOpen: false,
    popupContent: {},
};

const appReducer = (state = initState, payload: any) => {
    switch (payload.type) {
        case OPEN_POPUP:
            return {
                ...state,
                isPopupOpen: payload.isPopupOpen,
                popupContent: payload.popupContent,
            };

        default:
            return state;
    }
};

export default appReducer;
