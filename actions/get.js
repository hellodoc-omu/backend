const { connection } = require('../db/connection');
connection.connect();

module.exports.selectAllColumns = (entity, res) => {
  const SQL = `SELECT * FROM ${entity};`;

  connection.query(SQL, (err, result) => {
    if (err) {
      res.status(400).json({
        status: 'error',
        error: err,
      });

      return;
    }

    res.json({
      status: 'success',
      data: result,
    });
  });
};
