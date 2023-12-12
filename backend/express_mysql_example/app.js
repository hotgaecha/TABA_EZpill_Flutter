const express = require('express');
const mysql = require('mysql');

const app = express();

// MySQL Connection Pooling
const pool = mysql.createPool({
  connectionLimit: 10, // Adjust as needed
  host: 'qqrx224.cgidx97t8k8h.ap-northeast-2.rds.amazonaws.com',
  user: 'BAEKI',
  password: 'qoqorlxo1!',
  database: 'Ezpill',
});

// Express Route: Fetch Data from MySQL
app.get('/api/data', (req, res) => {
  const sql = 'SELECT * FROM user';
  pool.query(sql, (error, results) => {
    if (error) {
      console.error('MySQL query error:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    res.json(results);
  });
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
