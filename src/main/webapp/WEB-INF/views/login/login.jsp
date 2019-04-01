<%--
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/1
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="./../../../img/logo.ico">
    <link rel="stylesheet" href="./../../../css/bootstrap-4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="./../../../css/bootstrap-4.0.0/css/floating-labels.css">
    <title>网上问卷调查系统</title>
</head>
<body>
    <form class="form-signin">
        <div class="text-center mb-4">
            <h1 class="h3 mb-3 font-weight-normal">网上问卷调查系统</h1>
            <p>本系统通过问卷调查的方式为，为企业收集数据并能够对数据进行分析</p>
        </div>

        <div class="form-label-group">
            <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">
            <label for="inputEmail">Email address</label>
        </div>

        <div class="form-label-group">
            <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
            <label for="inputPassword">Password</label>
        </div>

        <div class="checkbox mb-3">
            <label>

            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        <p class="mt-5 mb-3 text-muted text-center">© 2018-刘勤敏</p>
    </form>
</body>
<script src="./../../../js/jQuery/jquery-3.3.1.min.js"></script>
<script src="./../../../js/popper/popper.min.js"></script>
<script src="./../../../js/bootstrap-4.0.0/js/bootstrap.min.js"></script>
</html>
