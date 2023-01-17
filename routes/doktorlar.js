const express = require('express');
const { getDoktorlar, getDoktorById } = require('../actions/doktorlar/get');
const router = express.Router();

router.get('/', getDoktorlar);
router.get('/:id', getDoktorById);

module.exports = router;
