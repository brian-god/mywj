<%--
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/23
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="childcss">
    <link rel="stylesheet" href="/css/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" href="/css/my-index.css">
</rapid:override>
<rapid:override name="childconment">
    <div style="padding-top: 20px;">
        <div class="row personal-center-title-chard">
            <h3>个人资料</h3>
        </div>
        <div class="row  personal-center-page">
            <ul class="nav nav-tabs nav-justified">
                <li><a href="#">基本资料</a></li>
                <li class="active"><a href="#">更新资料</a></li>
                <li><a href="#">修改密码</a></li>
            </ul>
        </div>
    </div>
</rapid:override>
<rapid:override name="pagescript">
</rapid:override>
<%@ include file="./../home/home.jsp" %>
