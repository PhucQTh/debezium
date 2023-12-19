import { useQuery } from '@tanstack/react-query';
import { MINUTES, getAPI } from 'src/config/ultis';
const config = JSON.parse(localStorage.getItem('config') || '{}');
/**
 * Retrieves and returns a query result for the connectors data.
 *
 * @return {QueryResult} - The query result containing the connectors data.
 */
export const useConnectorsQuery = (filter?: any) => {
  return useQuery({
    queryKey: ['connectors'],
    queryFn: () => fetchConnectors(),
    staleTime: 1 * MINUTES,
    gcTime: 1 * MINUTES,
    select: (data: {
      databases: any[];
      topicGroupIP: any[];
      connectors: any[];
    }) => {
      if (!filter) {
        return data;
      }
      return {
        topicGroupIP: data.topicGroupIP,
        connectors: data.connectors.filter((item) =>
          item.name.includes(filter)
        ),
        databases: data.databases,
      };
    },
  });
};
/**
 * Fetches the connectors from the specified Kafka Connect API endpoint and returns
 * an object containing arrays of connectors, databases, and topic groups.
 *
 * @return {Object} - An object containing arrays of connectors, databases, and topic groups.
 */
const fetchConnectors = async () => {
  const { kafkaConnect } = config;
  const url = `${kafkaConnect}?expand=status`;
  const data = (await getAPI(`${url}`, true)).data;
  // Get an array status of all the connector objects
  const connectors = Object.values(data).map((item: any) => item.status);
  const databases = Array.from(
    new Set(
      connectors
        .filter((connector) => connector.type === 'sink')
        .map((connector) => connector.name.split('-')[1])
    )
  );
  const topicGroup = Array.from(
    new Set(
      connectors
        .filter((connector) => connector.type === 'sink')
        .map((connector) => connector.name.split('-')[0])
    )
  );
  // Refactor the map function to create an array of topic names
  const topicNameIpPairs = await Promise.all(
    // Map each topic in the topicGroup array to an async function that returns an object with the topic name and IP address
    topicGroup.map(async (item) => {
      // get first connector of each topic
      const index = connectors.findIndex((connector) =>
        connector.name.includes(`${item}-`)
      );
      if (index === -1) return null;

      const connectorName = connectors[index].name;
      // Retrieve the configuration data for the connector
      const configRes = (await getAPI(`${kafkaConnect}/${connectorName}`, true))
        .data;
      const regex = /\d+\.\d+\.\d+\.\d+/;
      const connectionUrl = configRes.config['connection.url'];
      // Extract the IP address from the connection URL using a regular expression
      const ipAddressMatch = connectionUrl.match(regex);
      const ipAddress = ipAddressMatch ? ipAddressMatch[0] : null;

      // Return an object with the topic name and IP address if the IP address exists, otherwise return null
      return ipAddress ? { name: item, ipAddress } : null;
    })
  );

  const topicGroupIP = topicNameIpPairs.filter((pair) => pair !== null);

  return { connectors, databases, topicGroupIP };
};
