import axios from 'axios';

/**
 * Returns a string representation of a number with commas as thousands separators.
 *
 * @param {number} x - The number to format.
 * @return {string} The formatted number as a string.
 */
export function numberWithCommas(x: number) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
/**
 * Converts a value from bytes to gigabytes.
 *
 * @param {number} bytes - The value in bytes.
 * @return {number} The value in gigabytes.
 */
export function bytesToGigabytes(bytes: number): number {
  return bytes / (1024 * 1024 * 1024);
}
const config = JSON.parse(localStorage.getItem('config') || '{}');
/**
 * Sends a GET request to the specified API endpoint.
 *
 * @param {string} url - The URL of the API endpoint.
 * @param {boolean} isBridge - Whether the request is for a bridge API.
 * @return {Promise<AxiosResponse>} A promise that resolves to the response from the API.
 */
export const getAPI = (url: string, isBridge?: boolean) => {
  const { apiURL } = config;
  const encodeUrl = encodeURIComponent(url);
  const finalUrl = isBridge ? `${apiURL}/connectors?api=${encodeUrl}` : url;
  const res = axios.get(finalUrl, {
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${localStorage.getItem('token')}`,
    },
  });
  return res;
};
/**
 * Sends a POST request to the specified URL with optional data.
 *
 * @param {string} url - The URL to send the POST request to.
 * @param {any} data - Optional data to send with the request.
 * @param {boolean} isBridge - Indicates if the request is a bridge request.
 * @return {Promise} A promise that resolves with the response from the server.
 */
export const postAPI = (url: string, data?: any, isBridge?: boolean) => {
  const { apiURL } = config;
  const encodeUrl = encodeURIComponent(url);
  const finalUrl = isBridge ? `${apiURL}/connectors?api=${encodeUrl}` : url;
  const res = axios.post(finalUrl, data, {
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${localStorage.getItem('token')}`,
    },
  });
  return res;
};
