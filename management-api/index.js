const axios = require('axios');
const cors = require('cors');
const express = require('express');
const jwt = require('jsonwebtoken');
const mysql = require('mysql');
const {
  backupConfig,
  prodConfig,
  sftBackupConfig,
  sftConfig,
} = require('./config');
const config = require('./config');

const app = express();
app.use(cors());
app.use(express.json({ type: '*/*' }));

app.get('/api/get-primary-key', authenToken, (req, res) => {
  const { dbname, server } = req.query;
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

app.get('/api/binlog', authenToken, async (req, res) => {
  const query = 'SHOW BINARY LOGS;';
  const { server } = req.query;

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

app.get('/api/connectors', authenToken, async (req, res) => {
  try {
    const { api } = req.query;
    const decodedUrl = decodeURIComponent(api);
    const response = await axios.get(decodedUrl);
    console.log(`GET: ${decodedUrl}`);
    res.send(response.data);
  } catch (error) {
    res.status(500).send('Internal Server Error');
  }
});
app.post('/api/connectors', authenToken, async (req, res) => {
  try {
    const { api } = req.query;
    const decodedUrl = decodeURIComponent(api);
    const data = req.body;
    console.log(data);
    console.log(JSON.stringify(data));
    const response = await axios.post(decodedUrl, data, {
      headers: {
        'Content-Type': 'application/json',
      },
    });
    console.log(`POST: ${decodedUrl}`);
    res.send(response.data);
  } catch (error) {
    console.log(error.response.data);
    res
      .status(error.response.data['error_code'])
      .send(error.response.data['message']);
  }
});
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

app.put('/api/connectors', authenToken, async (req, res) => {
  try {
    const { api } = req.query;
    const decodedUrl = decodeURIComponent(api);
    const response = await axios.put(decodedUrl, req.body, {
      headers: {
        'Content-Type': 'application/json',
      },
    });
    console.log(`PUT: ${decodedUrl}`);
    res.send(response.data);
  } catch (error) {
    res.status(500).send('Internal Server Error');
  }
});
app.delete('/api/connectors', authenToken, async (req, res) => {
  try {
    const { api } = req.query;
    const decodedUrl = decodeURIComponent(api);
    const response = await axios.delete(decodedUrl, {
      headers: {
        'Content-Type': 'application/json',
      },
    });
    console.log(`DELETE: ${decodedUrl}`);
    res.send(response.data);
  } catch (error) {
    const { status, statusText, data } = error.response;
    res.status(500).send({
      err: 'Internal Server Error',
      bridgeErr: {
        status,
        statusText,
        data: data,
      },
    });
  }
});
app.delete('/api/binlog', authenToken, async (req, res) => {
  const { binlog, server } = req.query;
  const query = `PURGE BINARY LOGS TO '${binlog}';`;
  try {
    conn = mysql.createConnection(
      server === 'production' ? prodConfig : sftConfig
    );
    conn.query(query, [binlog], (err, results) => {
      err? res.status(500).send(err) : res.send(results);
    });
  } catch (err) {
    throw err;
  } finally {
    conn.end();
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
