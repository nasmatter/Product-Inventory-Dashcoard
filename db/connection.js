const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '1234',
  database: 'inventory_project'
});

db.connect(err => {
  if (err) throw err;
  console.log('📦 Connected to MySQL (from connection.js)');
});

module.exports = db;
