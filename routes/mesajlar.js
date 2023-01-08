const express = require('express');
const { getMesajlar } = require('../actions/get');
const router = express.Router();

router.get('/', getMesajlar);

module.exports = router;
