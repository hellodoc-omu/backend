const express = require('express');
const { selectAllColumns } = require('../actions/get');
const { connection } = require('../db/connection');
const router = express.Router();

router.get('/', (_, res) => {
    selectAllColumns('Yardim', res);
});
router.get('/:id', (req, res) => {
    connection.query('SELECT * FROM Yardim WHERE yNo = ?', [req.params.id], (err, rows) => {
        if (!err)
            res.send(rows);
        else
            console.log(err);
    })
});

module.exports = router;
