const express = require('express');
const { getAnaBilimDallari } = require('../actions/anaBilimDallari/get');
const router = express.Router();

router.get('/', getAnaBilimDallari);

module.exports = router;
