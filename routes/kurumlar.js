const express = require('express');
const { getKurumlar } = require('../actions/kurumlar/get');
const router = express.Router();

router.get('/', getKurumlar);

module.exports = router;
