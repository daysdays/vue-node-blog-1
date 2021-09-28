/**
 * 存放tag模型
 */
 var mongoose = require('../config/db')
 Schema = mongoose.Schema;
 
 var TagSchema = new Schema({
     tag: String
 })
 
 module.exports = mongoose.model('tag', TagSchema)