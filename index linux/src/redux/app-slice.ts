import { createSlice } from '@reduxjs/toolkit';
import { toast } from 'react-toastify';
import { hostConfig } from 'src/config/config';

export default createSlice({
  name: 'app',
  initialState: {
    auth:
      localStorage.getItem('auth') || sessionStorage.getItem('auth') || null,
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
      const { username, password, remember } = action.payload;
      if (username === 'admin' && password === 'admin') {
        state.auth = 'OK';
        remember === true
          ? localStorage.setItem('auth', 'OK')
          : sessionStorage.setItem('auth', 'OK');
      } else toast.error('Wrong username or password');
    },
    setLogout(state) {
      state.auth = null;
      sessionStorage.removeItem('auth');
      localStorage.removeItem('auth');
    },
  },
});
