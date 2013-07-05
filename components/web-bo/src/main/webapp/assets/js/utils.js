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

utils.hidePopover = function(domId) {
    $('#'+domId).popover('hide');
}

utils.addDelConfirmListener = function() {
    $("[rel='popover-del']").each(function (index, item) {
        $(item).popover({
            placement: 'bottom',
            title: '<div style="text-align:center;color:red;"> 确认删除？</div>',
            html: 'true',
            content: '<div id="popOverBox"><a class="btn btn-small btn-primary" href="' + $(item).attr('href') + '">Yes</a>' +
                '&nbsp;<a class="btn btn-small" href="javascript:void(0);" onclick="utils.hidePopover(\'' + $(item).attr('id') + '\');">Cancel</a></div>'
        });
    }).click(function () {
            return false;
        });
}