import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';
import { deleteAPI, getAPI } from 'src/config/ultis';
const config = JSON.parse(localStorage.getItem('config') || '{}');

const consumerSlice = createSlice({
  name: 'consumer',
  initialState: {
    status: 'idle',
    error: null,
    consumers: [] as IConsumers[],
  },
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchConsumers.pending, (state, action) => {
        state.status = 'loading';
      })
      .addCase(fetchConsumers.fulfilled, (state, action) => {
        state.status = 'idle';
        state.consumers = action.payload;
      });
  },
});
const { kafkaUI } = config;
export const fetchConsumers = createAsyncThunk(
  'consumer/fetchConsumers',
  async () => {
    const uri = `${kafkaUI}/api/clusters/Default/consumer-groups/paged?page=1&perPage=2500&search=`;
    const consumers = await getAPI(uri, true);
    const groupIds = consumers['data']['consumerGroups'].map(
      (item: any) => item.groupId
    );
    const result = groupIds.reduce((acc: any, groupId: any) => {
      // eslint-disable-next-line @typescript-eslint/no-unused-vars
      const [_, group, database, table] = groupId.split('-');

      const existingGroup = acc.find((item: any) => item.name === group);

      if (existingGroup) {
        const existingDatabase = existingGroup.databases.find(
          (item: any) => item.name === database
        );

        if (existingDatabase) {
          existingDatabase.table.push({ name: table, consumer: groupId });
        } else {
          existingGroup.databases.push({
            name: database,
            table: [
              {
                name: table,
                consumer: groupId,
              },
            ],
          });
        }
      } else {
        acc.push({
          name: group,
          databases: [
            {
              name: database,
              table: [
                {
                  name: table,
                  consumer: groupId,
                },
              ],
            },
          ],
        });
      }

      return acc;
    }, []);
    return result;
  }
);
export const deleteConsumers = createAsyncThunk(
  'consumer/deleteConsumers',
  async (group: IConsumers) => {
    console.log(group);
    const url = `${kafkaUI}/api/clusters/Default/consumer-groups/`;
    group.databases.forEach((database) => {
      database.table.forEach((table) => {
        deleteAPI(`${url}${table.consumer}`, '', true).then((res) => {
          console.log(res);
        });
      });
    });
  }
);
export interface IConsumers {
  name: string;
  databases: IDatabase[];
}
export interface IDatabase {
  name: string;
  table: [
    {
      name: string;
      consumer: string;
    }
  ];
}

export default consumerSlice;
