/**
 * 存放一些处理时间的方法
 */

// 用来进行日期格式化
exports.formatDate = (req, res, next) => {
    let date = new Date();
    let year = date.getFullYear(); // 年
    let month = date.getMonth() + 1; // 月
    let day = date.getDate(); // 日
    var time = `${year}年${month}月${day}日`;

    return time;
}


// 获取年份
exports.getYear = (req, res, next) => {
    let date = new Date()
    let year = date.getFullYear()

    return year
}


// 获取月份并转换为汉字
exports.getMonth = (req, res, next) => {
    let date = new Date()
    let month = date.getMonth()

    switch (month) {
        case 1:
            x = "一月";
            break;
        case 2:
            x = "二月";
            break;
        case 3:
            x = "三月";
            break;
        case 4:
            x = "四月";
            break;
        case 5:
            x = "五月";
            break;
        case 6:
            x = "六月";
            break;
        case 7:
            x = "七月";
            break;
        case 8:
            x = "八月";
            break;
        case 9:
            x = "九月";
            break;
        case 10:
            x = "十月";
            break;
        case 11:
            x = "十一月";
            break;
        default:
            x = "十二月";
    }

    return x
}
