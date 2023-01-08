const express = require('express');
const { getYardimlar } = require('../actions/get');
const router = express.Router();

router.get('/', getYardimlar);

module.exports = router;
