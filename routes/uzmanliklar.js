const express = require('express');
const { getUzmanliklar } = require('../actions/uzmanliklar/get');
const router = express.Router();

router.get('/', getUzmanliklar);

module.exports = router;
