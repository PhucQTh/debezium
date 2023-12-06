import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import axios from 'axios';
import { toast } from 'react-toastify';
import { getAPI } from 'src/config/ultis';
import { Topic } from 'src/page/replica-management-page/replica-index';
const config = JSON.parse(localStorage.getItem('config') || '{}');
const connectorsSlice = createSlice({
  name: 'connectors',
  initialState: {
    status: 'idle',
    connectors: [] as Topic[],
    topicGroup: [''],
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
        state.topicGroup = action.payload.groupTopic;
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
    const { kafkaConnect } = config;
    const url = `${kafkaConnect}?expand=status`;
    const connectorss = (await getAPI(`${url}`, true)).data;
    // Get an array status of all the connector objects
    const tempConnectors = Object.values(connectorss).map(
      (item: any) => item.status
    );
    const database = Array.from(
      new Set(
        tempConnectors
          .filter((connector) => connector.type === 'sink')
          .map((connector) => connector.name.split('-')[1])
      )
    );
    const groupTopic = Array.from(
      new Set(
        tempConnectors
          .filter((connector) => connector.type === 'sink')
          .map((connector) => connector.name.split('-')[0])
      )
    );
    return { tempConnectors, database, groupTopic };
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
