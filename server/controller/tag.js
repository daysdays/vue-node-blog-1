var Tag = require('../model/tag')


// 增加tag
exports.insert = (req, res, next) => {
    var data = {
        tag: 'test'
    }

    var tag = new Tag(data);

    Tag.insertMany(tag, function (err, res) {
        if (err) {
            console.log('Error:' + err);
        }
        else {
            console.log(res);
        }
    })
}


// 查询所有tag
exports.getTags = (req, res, next) => {

    Tag.find({}, function (err, result) {
        res.json(result);
        console.log("Res:" + result);
    })
}
