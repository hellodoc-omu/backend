const express = require('express');
const { getBildirimler } = require('../actions/bildirimler/get');
const router = express.Router();

router.get('/', getBildirimler);

module.exports = router;
