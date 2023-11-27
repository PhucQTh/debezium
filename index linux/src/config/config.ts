export const config = {
  kafkaConnect: 'http://192.168.109.43:8083/connectors',
  kafkaUI: 'http://192.168.109.43:8980',
  baseUrl: '192.168.109.43',
  sqlHelperUrl: 'http://192.168.109.42:4000/api',
  backupDbHost: '192.168.109.43:3306', //IP:Port
  backupDbUser: 'root',
  backupDbPassword: 'api@#1470',
//sftBackup
  sftBackupDbHost: '192.168.109.42:3306', //IP:Port
  sftBackupDbUser: 'root',
  sftBackupDbPassword: 'P@ss_2018',
};
// export const config = {
//   kafkaConnect: 'http://192.168.109.43:8083/connectors',
//   kafkaUI: 'http://192.168.109.43:8980',
//   baseUrl: '192.168.109.43',
  
//   // sqlHelperUrl: 'http://192.168.109.42:4000/api',
//   sqlHelperUrl: 'http://localhost:4000/api',
//   backupDbHost: '192.168.1.206:3306', //IP:Port
//   backupDbUser: 'root',
//   backupDbPassword: 'P@ss_2018',
// };
export const auth = {
  username: 'admin',
  password: 'admin',
}