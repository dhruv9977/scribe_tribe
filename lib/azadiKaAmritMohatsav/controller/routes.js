const express = require('express');
const router = express.Router();
const {registerBlindFolk,registerWriter,getBlindFolks,selectTheFolk,showWriters} = require('../services/services');

router.post('/blind-folk-register',registerBlindFolk);
router.post('/writer-register',registerWriter);
router.get('/blind-folk',getBlindFolks);
router.put('/select-folk',selectTheFolk);
router.get('/show-writer-list/:folkid',showWriters);

module.exports = router;
