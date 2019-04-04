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
                    remote: {//（应该是所以的验证通过才）发送AJAX请求到后台
                        type: "post",
                        url: '/checkMsg',
                        message: '用户名已被注册',
                        delay: 2000,
                        contentType: "application/json; charset=utf-8",
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
                    remote: {//（应该是所以的验证通过才）发送AJAX请求到后台
                        type: "post",
                        url: '/checkMsg',
                        message: '此邮箱已注册。',
                        delay: 2000,
                        contentType: "application/json; charset=utf-8",
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
            password1:{
                validators: {
                    notEmpty: {
                        message: '验证密码不能为空'
                    },callback: {
                        message: '密码不一致',
                        callback: function (value, validator) {
                            return passwordChack(value);
                        }
                    }
                },
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
                    remote: {//（应该是所以的验证通过才）发送AJAX请求到后台
                        type: "post",
                        url: '/checkMsg',
                        message: '用户名已被注册',
                        delay: 2000,
                        contentType: "application/json; charset=utf-8",
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
 *
 * @param password1
 * @returns {boolean}
 */
function passwordChack(password1) {
    //获取密码
    var password = $("#password").val()
    //验证密码是否一致
    if(password==password1){
        return true;
    }
    return false;
}

/**
 * 校验邮箱是否已经存在
 * @param email
 * @returns {boolean}
 * @constructor
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

/!**
 * 用户名校验
 * @param username
 *!/
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

/!**
 * 手机号校验
 * @param mobile
 *!/
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
}*/
