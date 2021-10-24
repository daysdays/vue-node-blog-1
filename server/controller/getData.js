var Blog = require('../model/model')
const getData = require('../util/getDate')


// 登录
exports.login = (req, res, next) => {
    const username = req.body.username;
    const password = req.body.password;


    if (username == 'admin' && password == 'admin') {
        var reee = {
            data: {
                token: 'asxasd'
            },
            meta: {
                status: 200
            }
        }
        res.json(reee)
        return;
    } else {
        var ree = {
            meta: {
                status: 1
            }
        }
        res.json(ree)
        return;
    }


}


// 增加数据
exports.insert = (req, res, next) => {
    var data = {
        year: getData.getYear(),
        month: getData.getMonth(),
        date: getData.formatDate(),
        title: req.body.title,
        text: req.body.text,
        tags: req.body.tags
    }
    var blog = new Blog(data);
    console.log(blog.tags);

    Blog.insertMany(blog, function (err, res) {
        if (err) {
            console.log('Error:' + err);
        } else {
            console.log(res);
        }
    })
}


// 删除数据
exports.del = (req, res, next) => {
    var conditions = {title: req.body.title};
    console.log(conditions);

    Blog.remove(conditions, function (error) {
        if (error) {
            console.log(error);
        } else {
            console.log('Delete success!');
        }
    })
}


// 更新数据
exports.update = (req, res, next) => {
    var conditions = {title: req.body.title};
    var update = {
        $set: {
            text: req.body.text
        }
    };

    Blog.update(conditions, update, function (error) {
        if (error) {
            console.log(error);
        } else {
            console.log('Update success!');
        }
    });
}


// 查询所有文章
exports.find = (req, res, next) => {
    Blog.find({}, function (err, result) {
        res.json(result);
        // console.log("Res:" + result);
    })
}


// 根据title查询（用于打开文章）
exports.findOne = (req, res, next) => {
    // console.log(req.body);
    var wherestr = {'title': req.body.title};
    Blog.findOne(wherestr).then((data) => {
        console.log(data);
        res.json(data)
    })
}


// 根据 tag 查询
exports.findByTag = (req, res, next) => {
    console.log(req.body);
    var wherestr = {'tags': req.body.tag};

    Blog.find(wherestr).then((data) => {
        console.log(data);
        res.json(data)
    })
}
