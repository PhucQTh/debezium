import { useQuery } from '@tanstack/react-query';
import { getAPI } from 'src/config/ultis';
const config = JSON.parse(localStorage.getItem('config') || '{}');
/**
 * Retrieves and returns a query result for the connectors data.
 *
 * @return {QueryResult} - The query result containing the connectors data.
 */
export const useConnectorsQuery = () => {
  return useQuery({
    queryKey: ['connectors'],
    queryFn: fetchConnectors,
    refetchOnWindowFocus: false,
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
  const connectorss = (await getAPI(`${url}`, true)).data;
  // Get an array status of all the connector objects
  const connectors = Object.values(connectorss).map((item: any) => item.status);
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
  return { connectors, databases, topicGroup };
};
