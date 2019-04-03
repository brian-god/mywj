//引入外部js
document.write("<script language=javascript src='/js/bootstrapValidator/bootstrapValidator.min.js'></script>");

/**
 * 注册界面表单验证
 * @constructor
 */
function FormValidation() {
    $('.user-form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: '用户名验证失败',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength:{
                        min:4,
                        message: '用户名长度必须大于4个字符'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: '邮箱地址不能为空'
                    },
                    callback: {
                        message: '该邮箱已被注册',
                        callback: function (value, validator) {
                            //校验邮箱是否使用过
                             if (EmilChack(value)) {
                                return true;
                            }
                                return false;
                        }
                    }
                }
            },
            nickname: {
                validators: {
                    notEmpty: {
                        message: '姓名不能为空'
                    },
                    stringLength:{
                        min:4,
                        message: '姓名长度必须大于2个字符'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    }
                }
            },
            mobile: {
                validators: {
                    notEmpty: {
                        message: '手机号不能为空'
                    },
                    regexp: {
                        regexp: /^1\d{10}$/,
                        message: '手机号格式错误'
                    }
                }
            },
            birthday: {
                validators: {
                    notEmpty: {
                        message: '生日不能为空'
                    }
                }
            }
        }
    });
}
function EmilChack(emil) {
    $.ajax(

    )
}
