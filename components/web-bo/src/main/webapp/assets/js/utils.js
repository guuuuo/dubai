if (typeof utils == 'undefined' || !utils) {
    utils = {};
}
utils.reloadCaptcha = function (baseURL) {
    $("#captchaImg").attr("src", baseURL + "/captcha?data=" + new Date() + Math.floor(Math.random() * 24));
}

utils.highLight = function (fields, message) {
    if (fields) {
        var field_array = fields.split(",");
        for (var i = 0; i < field_array.length; i++) {
            var key = field_array[i];
            var input = $byName(key);
            if (!input) {
                input = $byId(key);
            }
            $(input).parent().parents("div:first").addClass("error");
        }
    }
};

var $byName = function (name) {
    return document.getElementsByName(name)[0];
};
var $byId = function (id, frame) {
    if (frame) {
        return frame.document.getElementById(id);
    } else {
        return document.getElementById(id);
    }
};