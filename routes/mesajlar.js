const express = require('express');
const { getMesajlar, getMesajByID } = require('../actions/mesajlar/get');
const { mesajGonder } = require('../actions/mesajlar/post');
const router = express.Router();

router.get('/', getMesajlar);
router.get('/:id', getMesajByID);
router.post('/gonder', mesajGonder);

module.exports = router;
