const express = require('express');
const { getMesajlar } = require('../actions/mesajlar/get');
const { mesajGonder } = require('../actions/mesajlar/post');
const router = express.Router();

router.get('/', getMesajlar);
router.post('/gonder', mesajGonder);

module.exports = router;
