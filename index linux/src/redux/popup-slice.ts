import { createSlice } from '@reduxjs/toolkit';

export enum PopupStatus {
  close,
  open,
}

export default createSlice({
  name: 'popup',
  initialState: {
    status: PopupStatus.close,
  },
  reducers: {
    setPopupStatus: (state, action) => {
      // mutation || IMMER
      state.status = action.payload;
    },
  },
});
