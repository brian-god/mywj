<%--
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/4
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>网上问卷后台管理</title>
    <link rel="icon" href="/img/logo.ico">
    <link rel="stylesheet" href="/css/bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/dashboard.css">
    <link rel="stylesheet" href="/css/bootstrapValidator/bootstrapValidator.min.css">
    <rapid:block name="pagecss">

    </rapid:block>
</rapid:override>
<rapid:override name="script">
    <script src="/js/jQuery/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script src='/js/bootstrapValidator/bootstrapValidator.min.js'></script>
    <rapid:block name="pagescript">
        <!--各个页面不同的js-->
    </rapid:block>
</rapid:override>
<!--继承sys模板-->
<%@include file="base_template.jsp"%>

