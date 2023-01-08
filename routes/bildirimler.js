const express = require('express');
const { getBildirimler } = require('../actions/get');
const router = express.Router();

router.get('/', getBildirimler);

module.exports = router;
