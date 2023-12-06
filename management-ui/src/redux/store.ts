import { configureStore } from '@reduxjs/toolkit';
import popupSlice from './popup-slice';
import connectorsSlice from './connector-slice';
import appSlice from './app-slice';
import consumerSlice from './consumer-slice';

const store = configureStore({
  reducer: {
    popup: popupSlice.reducer,
    connector: connectorsSlice.reducer,
    app: appSlice.reducer,
    consumer: consumerSlice.reducer,
  },
});
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
export default store;
