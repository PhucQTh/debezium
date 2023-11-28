import { configureStore } from '@reduxjs/toolkit';
import popupSlice from './popup-slice';
import connectorsSlice from './connector-slice';
import appSlice from './app-slice';

const store = configureStore({
  reducer: {
    popup: popupSlice.reducer,
    connector: connectorsSlice.reducer,
    app: appSlice.reducer,
  },
});
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
export default store;
