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
                        min:6,
                        max: 18,
                        message: '用户名长度必须在6到18之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '用户名只能包含大写、小写、数字和下划线'
                    },
                    callback: {
                        message: '用户名已被注册',
                        callback: function (value, validator) {
                            if(value.length>5){
                                //校验用户名是否使用过
                                if (usernameChack(value)) {
                                    return false;
                                }
                            }
                            return true;
                        }
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: '邮箱地址不能为空'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/,
                        message: '邮箱格式不正确'
                    },
                    callback: {
                        message: '该邮箱已被注册',
                        callback: function (value, validator) {
                            //校验邮箱是否使用过
                             if (EmailChack(value)) {
                                return false;
                            }
                                return true;
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
                        min:2,
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
                    },
                    callback: {
                        message: '该手机号已被注册',
                        callback: function (value, validator) {
                            //校验手机号是否使用过
                            if (mobileChack(value)) {
                                return false;
                            }
                            return true;
                        }
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

/**
 * 校验邮箱是否已经存在
 * @param email
 * @returns {boolean}
 * @constructor
 */
function EmailChack(email) {
    //邮箱校验的正则表达式
    var myReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
    var iserror = false;
    if(myReg.test(email)){
        var  data = {"email":email};
        $.ajax({
            url:"/checkMsg",
            type:"POST",
            contentType: "application/json; charset=utf-8",
            data:JSON.stringify(data),
            success: function (data) {
                console.log(data)
                var  status = data["status"];
                if(400 == status){
                    iserror = true;
                }
            },
            error:function () {
                alert("请求异常")
            }
        });
    }
    return iserror;
}

/**
 * 用户名校验
 * @param username
 */
function usernameChack(username) {
    var  data = {"username":username};
    var iserror = false;
    $.ajax({
        url:"/checkMsg",
        type:"POST",
        contentType: "application/json; charset=utf-8",
        data:JSON.stringify(data),
        success: function (data) {
            console.log(data)
            var  status = data["status"];
            if(400 == status){
                iserror = true;
            }
        },
        error:function () {
            alert("请求异常")
        }
    });
    return iserror;
}

/**
 * 手机号校验
 * @param mobile
 */
function mobileChack(mobile) {
    //手机号校验的正则
    var myReg=/^1\d{10}$/
    var iserror = false;
    if(myReg.test(mobile)){
        var  data = {"mobile":mobile};
        $.ajax({
            url:"/checkMsg",
            type:"POST",
            contentType: "application/json; charset=utf-8",
            data:JSON.stringify(data),
            success: function (data) {
                console.log(data)
                var  status = data["status"];
                if(400 == status){
                    iserror = true;
                    alert(status)
                }
            },
            error:function () {
                alert("请求异常")
            }
        });
    }
    return iserror;
}
