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
