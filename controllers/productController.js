
const db = require('../db/connection');
//const db = require('../server');


// GET: ดึงสินค้าทั้งหมด
exports.getAllProducts = (req, res) => {
    db.query('SELECT * FROM Products', (err, results) => {
      if (err) return res.status(500).json(err);
      res.json(results);
    });
};


// POST: เพิ่มสินค้าใหม่
exports.createProduct = (req, res) => {
    const { product_name, product_description, category_id, product_quantity_in_stock, product_price } = req.body;
    const query = `
      INSERT INTO Products 
      (product_name, product_description, category_id, product_quantity_in_stock, product_price)
      VALUES (?, ?, ?, ?, ?)
    `;
    db.query(query, [product_name, product_description, category_id, product_quantity_in_stock, product_price], (err, result) => {
      if (err) return res.status(500).json(err);
      res.status(201).json({ id: result.insertId, message: '✅ Product added' });
    });
};


// DELETE: ลบสินค้า
exports.deleteProduct = (req, res) => {
    const productId = req.params.id;
    db.query('DELETE FROM Products WHERE product_id = ?', [productId], (err, result) => {
      if (err) return res.status(500).json(err);
      res.json({ message: '🗑️ Product deleted' });
    });
};
  


