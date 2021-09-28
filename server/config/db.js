/**
 * 连接MongoDB
 */

var mongoose = require('mongoose')

DB_URL = 'mongodb://localhost:27017/test'
mongoose.connect(DB_URL)

mongoose.connection.on('connected', function () {
    console.log('连接成功');
})

mongoose.connection.on('error', function () {
    console.log('连接失败');
})

mongoose.connection.on('disconnected', function () {
    console.log('连接中断');
})

module.exports = mongoose;