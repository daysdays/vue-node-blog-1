var express = require('express');
var router = express.Router();
var getMongo = require('../controller/getData')
var getTag = require('../controller/tag')

router.post('/login', getMongo.login)
router.get('/getHome', getMongo.find)
router.get('/getArchives', getMongo.find)
router.post('/getDetails', getMongo.findOne)
router.post('/edit', getMongo.insert)
router.get('/getTags', getTag.getTags)
router.post('/findByTag', getMongo.findByTag)
router.post('/del', getMongo.del)
router.post('/update', getMongo.update)


module.exports = router;
