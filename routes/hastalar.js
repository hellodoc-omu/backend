const express = require('express');
const { getHastalar } = require('../actions/get');
const router = express.Router();

router.get('/', getHastalar);

module.exports = router;
