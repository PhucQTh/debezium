import { useQuery } from '@tanstack/react-query';
import { MINUTES, deleteAPI, getAPI } from 'src/config/ultis';
const config = JSON.parse(localStorage.getItem('config') || '{}');

const { kafkaUI } = config;
const fetchConsumers = async () => {
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
  // return consumers.data.consumerGroups;
};
export const deleteConsumer = async (group: IConsumers) => {
  const url = `${kafkaUI}/api/clusters/Default/consumer-groups/`;
  return await Promise.all(
    group.databases.flatMap((database) =>
      database.table.map((table) =>
        deleteAPI(`${url}${table.consumer}`, '', true)
      )
    )
  );
};
export const useConsumers = () => {
  return useQuery({
    queryKey: ['consumers'],
    queryFn: fetchConsumers,
    staleTime: 1 * MINUTES,
    gcTime: 1 * MINUTES,
  });
};

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
