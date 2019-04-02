<%--
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/1
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--  头部信息 -->
<%@ include file="./../communal/publicCss.jsp"%>
<!-- /头部信息 -->
<nav class="navbar navbar-default navbar-fixed-top navber-header">
    <div class="header-container">
            <div class="header-view">
                <div class="header-left-view"><img src="/img/logo.png"></div>
                <div class="header-right-view">
                  <div class="btn-group">
                      <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <img class="img-circle headers-img-circle" src="/img/blog.jpeg" alt="头像"/>
                             <span class="user-name">刘勤敏</span>
                      </a>
                      <!-- Single button -->
                      <ul class="dropdown-menu">
                          <li><a href="#">个人中心</a></li>
                          <li><a href="#">Another</a></li>
                          <li role="separator" class="divider"></li>
                          <li><a href="#">退出</a></li>
                      </ul>
                  </div>
                </div>
            </div>
        </div>
</nav>
<div class="container-fluid">
    <div class="left">
        <div class="panel-heading">
            <a class="left-menu-item" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp&nbsp&nbsp&nbsp用户管理
            </a>
        </div>
        <div id="collapseOne" class="panel-collapse collapse">
            <div class="child-menu">
                <a class="left-child-item" href="#">用户注册</a>
            </div>
            <div class="child-menu">
                <a class="left-child-item" href="#">用户登录</a>
            </div>
            <div class="child-menu">
                <a class="left-child-item" href="#">增删改查</a>
            </div>
        </div>
        <div class="panel-heading">
            <a class="left-menu-item" data-toggle="collapse"data-parent="#accordion"href="#collapseTow">
                <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>&nbsp&nbsp&nbsp&nbsp问卷管理</a>
        </div>
        <div id="collapseTow" class="panel-collapse collapse">
            <div class="child-menu">
                <a class="left-child-item" href="#">收集问卷</a>
            </div>
            <div class="child-menu">
                <a class="left-child-item" href="#">管理问卷</a>
            </div>
            <div class="child-menu">
                <a class="left-child-item" href="#">回收问卷</a>
            </div>
        </div>
        <div class="panel-heading">
            <a class="left-menu-item" data-toggle="collapse"data-parent="#accordion"href="#collapseThree">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp&nbsp&nbsp&nbsp系统管理</a>
        </div>
        <div id="collapseThree" class="panel-collapse collapse">
            <div class="child-menu">
                <a class="left-child-item" href="#">操作日志</a>
            </div>
            <div class="child-menu">
                <a class="left-child-item" href="#">增删改查</a>
            </div>
            <div class="child-menu">
                <a class="left-child-item" href="#">系统维护</a>
            </div>
        </div>
    </div>
    <div class="center">
        <iframe class="page-view" src="https://www.baidu.com/"></iframe>
    </div>
</div>
</div>
<%@ include file="./../communal/publicJs.jsp" %>
