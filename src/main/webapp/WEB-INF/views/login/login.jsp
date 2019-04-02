<%@ page import="com.hugo.utils.QAResult" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+
            request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
    <link rel="icon" href="/img/logo.ico">
    <link rel="stylesheet" href="/css/bootstrap-4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap-4.0.0/css/floating-labels.css">
    <title>网上问卷调查系统</title>
</head>
<body>
    <%
        //判断是否有数据绑定
        Object result = request.getAttribute("responseData");
        if(result != null){
            //强制类型转换
            QAResult qaResult = (QAResult)result;
            //获取错误信息
            String  msg =  qaResult.getMsg();
    %>
    <div class="alert alert-danger" style="position: fixed;top:40px;">
        <strong>错误!</strong> <%= msg%>
    </div>
    <%
        }
    %>
    <form class="form-signin" rel="form" action="<%=basePath%>login" method="post">
        <div class="text-center mb-4">
            <h1 class="h3 mb-3 font-weight-normal">网上问卷调查系统</h1>
            <p>本系统通过问卷调查的方式为，为企业收集数据并能够对数据进行分析</p>
        </div>

        <div class="form-label-group">
            <input type="email" id="inputEmail" name="email" class="form-control" placeholder="请输入邮箱" required="" autofocus="">
            <label for="inputEmail">Email address</label>
        </div>

        <div class="form-label-group">
            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="请输入密码" required="">
            <label for="inputPassword">Password</label>
        </div>

        <div class="checkbox mb-3" style="text-align:justify;">
            <a><label>
                注册用户
            </label></a>
            <a><label>忘记密码</label></a>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        <p class="mt-5 mb-3 text-muted text-center">© 2018-刘勤敏</p>
    </form>
</body>
<script src="/js/jQuery/jquery-3.3.1.min.js" />
<script src="/js/popper/popper.min.js" />
<script src="/js/bootstrap-4.0.0/js/bootstrap.min.js" />
</html>
