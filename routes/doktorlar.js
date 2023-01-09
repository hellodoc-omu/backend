const express = require('express');
const { getDoktorlar } = require('../actions/doktorlar/get');
const router = express.Router();

router.get('/', getDoktorlar);

module.exports = router;
