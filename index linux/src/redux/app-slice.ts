import { createSlice } from '@reduxjs/toolkit';
import { hostConfig } from 'src/config/config';

export default createSlice({
  name: 'app',
  initialState: {
    auth: localStorage.getItem('auth') || '',
    environment: {
      name: localStorage.getItem('environment') || hostConfig[0].name,
    },
  },
  reducers: {
    setEnv(state, action) {
      state.environment = action.payload;
      localStorage.setItem('environment', action.payload);
      const config = hostConfig.find((item) => item.name === action.payload);
      localStorage.setItem('config', JSON.stringify(config));
    },
    setAuth(state, action) {
      state.auth = action.payload;
      localStorage.setItem('auth', action.payload);
    },
  },
});
