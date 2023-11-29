import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import axios from 'axios';
import { toast } from 'react-toastify';
import { Topic } from 'src/page/replica-management-page/replica-index';
const config = JSON.parse(localStorage.getItem('config') || '{}');
const connectorsSlice = createSlice({
  name: 'connectors',
  initialState: {
    status: 'idle',
    connectors: [] as Topic[],
    databases: [''],
  },
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchConnectors.pending, (state, action) => {
        state.status = 'loading';
      })
      .addCase(fetchConnectors.fulfilled, (state, action) => {
        state.status = 'success';
        state.connectors = action.payload.tempConnectors;
        state.databases = action.payload.database;
        toast.success('Connectors fetched successfully', {
          position: 'bottom-right',
        });
      })
      .addCase(fetchConnectors.rejected, (state, action) => {
        state.status = 'failed';
      })
      .addCase(createSinkConnectors.fulfilled, (state, action) => {
        state.status = 'success';
      })
      .addCase(deleteConnector.fulfilled, (state, action) => {});
  },
});

export const fetchConnectors = createAsyncThunk(
  'connectors/fetchConnectors',
  async () => {
    const response = await axios.get(config.kafkaConnect);
    const connectors = [...response.data];
    const tempConnectors = await Promise.all(
      connectors.map(async (connector) => {
        const statusUrl = `${config.kafkaConnect}/${connector}/status`;
        const statusResponse = await axios.get(statusUrl);
        return statusResponse.data;
      })
    );
    const database = Array.from(
      new Set(
        tempConnectors
          .filter((connector) => connector.type === 'sink')
          .map((connector) => connector.name.split('-')[1])
      )
    );
    return { tempConnectors, database };
  }
);
export const createSinkConnectors = createAsyncThunk(
  'connectors/createSinkConnectors',
  async () => {}
);

export const deleteConnector = createAsyncThunk(
  'connectors/deleteConnector',
  async (connector: string) => {
    const url = `${config.kafkaConnect}/${connector}`;
    const response = await axios.delete(url);
    return response.data;
  }
);
export default connectorsSlice;
