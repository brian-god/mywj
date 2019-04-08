<%@ page import="com.hugo.utils.QAResult" %><%--
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/4
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%
    //获取返回数据
    QAResult qaResult =  (QAResult) request.getAttribute("qaResult");
%>
<rapid:override name="childcss">
    <link rel="stylesheet" href="/css/bootstrap-table/bootstrap-table.min.css">
</rapid:override>
<rapid:override name="childconment">
    <div class="btn-group">
        <button type="button" class="btn btn-primary">新增</button>
        <button type="button" class="btn btn-primary">修改</button>
        <button type="button" class="btn btn-primary">删除</button>
        <button type="button" class="btn btn-primary">审批</button>
    </div>
    <table id="table">
        <thead>
        <tr>
            <th data-field="name">问卷名称</th>
            <th data-field="describe">问卷描述</th>
            <th data-field="user">创建人</th>
            <th data-field="createtime">创建时间</th>
            <th data-field="qtstate">问卷状态</th>
            <th data-field="updatetime">最后修改时间</th>
        </tr>
        </thead>
    </table>
</rapid:override>
<rapid:override name="pagescript">
    <script src='/js/bootstrap-table/bootstrap-table.min.js'></script>
    <script src='/js/bootstrap-table/bootstrap-table-zh-CN.min.js'></script>
    <script>
        var $table = $('#table')
        $(function() {
            <%
                Object data = null;
                if(200 == qaResult.getStatus()){
                    data = qaResult.getData();
                }
            %>
            $table.bootstrapTable({data: <%= data%>})
        })
    </script>
</rapid:override>
<%@ include file="./../home/home.jsp"%>