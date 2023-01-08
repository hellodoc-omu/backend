const express = require('express');
const { getKisiler } = require('../actions/get');
const router = express.Router();

router.get('/', getKisiler);

module.exports = router;
