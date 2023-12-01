import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';
import axios from 'axios';
import { jwtDecode } from 'jwt-decode';
import { toast } from 'react-toastify';
import { hostConfig } from 'src/config/config';

export default createSlice({
  name: 'app',
  initialState: {
    auth: localStorage.getItem('auth') || null,
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
    setLogout(state) {
      state.auth = null;
      localStorage.removeItem('auth');
      localStorage.removeItem('token');
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(login.fulfilled, (state, action) => {
        const data = jwtDecode(action.payload.token);
        localStorage.setItem('token', action.payload.token);
        localStorage.setItem('auth', JSON.stringify(data));
        state.auth = JSON.stringify(data);
      })
      .addCase(login.rejected, (state, action) => {
        toast.error('Wrong username or password');
        state.auth = null;
      });
  },
});

export const login = createAsyncThunk(
  'app/login',
  async ({ username, password }: { username: string; password: string }) => {
    const res = await axios.post(
      'http://192.168.109.42:4000/api/login',
      { username, password },
      {
        headers: {
          'Content-Type': 'application/json',
        },
      }
    );
    return res.data;
  }
);
