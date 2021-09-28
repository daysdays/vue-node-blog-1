/**
 * 存放一些通用的方法或验证内容
 */

let util = {}


// 转换数据格式 => json
util.getReturnData = (code, message = '', data = []) => {
    // 保证数据格式
    if (!data) {
        data = []
    }
    return { code: code, message: message, data: data }
}


module.exports = util;