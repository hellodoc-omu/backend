const express = require('express');
const { getDegerlendirmeler } = require('../actions/degerlendirmeler/get');
const router = express.Router();

router.get('/', getDegerlendirmeler);

module.exports = router;
