const express = require('express');
const { getFakulteler } = require('../actions/get');
const router = express.Router();

router.get('/', getFakulteler);

module.exports = router;
