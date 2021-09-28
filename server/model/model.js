/**
 * 存放mongoo模型
 */

var mongoose = require('../config/db')
Schema = mongoose.Schema;

var BlogSchema = new Schema({
    year: String,
    month: String,
    date: String,
    title: String,
    text: String,
    tags: []
})

module.exports = mongoose.model('blog', BlogSchema)