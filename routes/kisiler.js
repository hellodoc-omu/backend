const express = require('express');
const { getKisiler } = require('../actions/kisiler/get');
const router = express.Router();

router.get('/', getKisiler);

module.exports = router;
