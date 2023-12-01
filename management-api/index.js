const express = require('express');
const mysql = require('mysql');
const {
  prodConfig,
  sftConfig,
  backupConfig,
  sftBackupConfig,
} = require('./config');
const cors = require('cors');
const app = express();
var jwt = require('jsonwebtoken');
const axios = require('axios');
const config = require('./config');

app.use(cors());

app.get('/api/get-pk/:server/:dbname', (req, res) => {
  const { dbname, server } = req.params;
  const query = `SELECT TABLE_NAME, GROUP_CONCAT(COLUMN_NAME) AS PK
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = ? AND COLUMN_KEY = 'PRI'
  GROUP BY TABLE_NAME;`;
  try {
    conn = mysql.createConnection(
      server === 'production' ? backupConfig : sftBackupConfig
    );
    conn.query(query, [dbname], (err, data) => {
      const formattedData = data.map((row) => ({
        TABLE_NAME: row.TABLE_NAME,
        PK: row.PK.split(','),
      }));
      res.json(formattedData);
    });
  } catch (err) {
    throw err;
  } finally {
    conn.end();
  }
});

app.get('/api/binlog/:server/status', authenToken, async (req, res) => {
  const query = 'SHOW BINARY LOGS;';
  const server = req.params.server;

  try {
    let config;
    switch (server) {
      case 'production':
        config = prodConfig;
        break;
      case 'sft':
        config = sftConfig;
        break;
      default:
        res.json({
          code: '001',
          message: 'Server name is wrong!',
        });
        return;
    }
    const pool = mysql.createPool(config);
    // Get a connection from the pool
    const connection = await new Promise((resolve, reject) => {
      pool.getConnection((err, conn) => {
        if (err) {
          reject(err);
        } else {
          resolve(conn);
        }
      });
    });

    // Use the connection
    const data = await new Promise((resolve, reject) => {
      connection.query(query, (err, results) => {
        if (err) {
          reject(err);
        } else {
          resolve(results);
        }
      });
    });

    // Release the connection back to the pool
    connection.release();

    res.json(data);
  } catch (err) {
    res.status(500).send('Internal Server Error');
  }
});

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.get('/api/connectors', async (req, res) => {
  try {
    const { api } = req.query;
    const response = await axios.get(api);
    console.log(`GET: ${api}`);
    res.send(response.data);
  } catch (error) {
    res.status(500).send('Internal Server Error');
  }
});
app.use(express.json({ type: '*/*' }));
app.post('/api/login', async (req, res) => {
  try {
    const { username, password } = req.body;
    if (username === 'admin' && password === 'admin') {
      const data = {
        username,
        fullname: 'Administrator',
        role: 'admin',
      };
      const accessToken = jwt.sign(data, config.TOKEN_SECRET, {
        expiresIn: '1d',
      });
      res.send({ authorization: 'success', token: accessToken });
    } else {
      res
        .status(403)
        .send({ authorization: 'failed', message: 'Invalid credentials' });
    }
  } catch (error) {
    res.status(500).send('Internal Server Error');
    throw error;
  }
});

function authenToken(req, res, next) {
  const authorizationClient = req.headers['authorization'];
  const token = authorizationClient && authorizationClient.split(' ')[1];

  if (!token) return res.sendStatus(401);

  try {
    jwt.verify(token, config.TOKEN_SECRET);
    next();
  } catch (e) {
    return res.sendStatus(403);
  }
}

app.listen(4000, () => console.log('App listening on port 4000'));
