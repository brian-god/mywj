<%@ page import="com.hugo.utils.QAResult" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+
            request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
    <link rel="icon" href="/img/logo.ico">
    <title>网上问卷调查系统</title>
    <link rel="stylesheet" href="/css/bootstrap-3.3.7/css/bootstrap.min.css">
    <link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/loginstyle.css">
</head>
<body class="background-body">
    <%
        //判断是否有数据绑定
        Object result = request.getAttribute("responseData");
        if(result != null){
            //强制类型转换
            QAResult qaResult = (QAResult)result;
            //获取错误信息
            String  msg =  qaResult.getMsg();
            //获取状态
            int status = qaResult.getStatus();
            if(status==200){
    %>
    <div class="alert alert-success" style="position: fixed;top:40px;">
        <strong>成功</strong> <%= msg%>
    </div>
    <%
        }else {
    %>
    <div class="alert alert-danger" style="position: fixed;top:40px;">
        <strong>错误!</strong> <%= msg%>
    </div>
    <%
            }
        }
    %>
    <div class="container">
       <!--<div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 class="form-title">LOGIN</h3>
                <div class="col-md-9">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input type="text" id="inputEmail" name="email" class="form-control" placeholder="请输入邮箱/用户名/手机号" required="" autofocus="">
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="请输入密码" required="">
                    </div>
                    <div class="form-group">
                        <label class="checkbox">
                            <input type="checkbox" name="remember" value="1"/>记住我
                        </label>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right" name="submit">登录</button>
                    </div>
                </div>
            </div>
        </div>-->
        <form class="form form-signin" rel="form" action="<%=basePath%>login" method="post">
            <div class="text-center mb-4">
                <h1 class="h3 mb-3 font-weight-normal">网上问卷调查系统</h1>
                <p>本系统通过问卷调查的方式为，为企业收集数据并能够对数据进行分析</p>
            </div>

            <div class="form-label-group" style="margin-bottom: 40px">
                <i class="fa fa-user fa-lg"></i>
                <input type="email" id="inputEmail" name="email" class="form-control" placeholder="请输入邮箱" required="" autofocus="">
            </div>

            <div class="form-label-group">
                <i class="fa fa-lock fa-lg"></i>
                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="请输入密码" required="">
            </div>

            <div class="checkbox mb-3" style="text-align:justify;">
                <a href="register"><label>
                    注册用户
                </label></a>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        </form>
    </div>
</body>
<script src="/js/jQuery/jquery-3.3.1.min.js" />
<script src="/js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</html>
