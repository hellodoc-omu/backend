const express = require('express');
const { getDoktorlar } = require('../actions/get');
const router = express.Router();

router.get('/', getDoktorlar);

module.exports = router;
