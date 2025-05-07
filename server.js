const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const productRoutes = require('./routes/products'); 

const app = express();
const port = 3000;

// เชื่อมต่อ MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '1234',   
    database: 'inventory_project'    
});

db.connect((err) => {
    if (err) throw err;
    console.log('📦 Connected to MySQL');
});


app.use(cors());
app.use(express.json());
app.use(express.static('public'));  // Show index.html
app.use('/products', productRoutes); /// Use routes


app.listen(port, () => {
    console.log(`🚀 Server running at http://localhost:${port}`);
});


//แชร์ db connection
module.exports = db;
