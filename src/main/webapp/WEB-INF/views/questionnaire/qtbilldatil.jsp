<%--
  Created by IntelliJ IDEA.
  User: hugotang
  Date: 2019-04-09
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.hugo.utils.QAResult" %>
<%@ page import="com.hugo.entity.Questionnaire" %><%--
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/4
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%
    //获取选中的问卷
    Questionnaire questionnaire = (Questionnaire)session.getAttribute("row");
%>
<rapid:override name="childcss">
    <link rel="stylesheet" href="/css/bootstrap-table/bootstrap-table.min.css">
</rapid:override>
<rapid:override name="childconment">
    <div class="">
        <div class="bill-title"><h4>${questionnaire.name}</h4></div>
        <form class="form-inline header-bill">
            <div class="form-group">
                <label for="number">问卷编号</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="number" value="${questionnaire.number}" readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="name">问卷名称</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="name" value="${questionnaire.name}" readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="modifier">创建人</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="modifier" value="${questionnaire.modifier}" readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="createtime">创建时间</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="createtime" value="${questionnaire.createtime}" readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="state">问卷状态</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="state" value="${questionnaire.state}" readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="updatetime">最后修改时间</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="updatetime" value="${questionnaire.updatetime}" readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <br>
            <div class="form-group">
                <label for="describes">问卷描述</label>&nbsp;&nbsp;
                <textarea class="form-control" rows="5" id="describes" name="describes" value="这是问卷描述" readonly="readonly"> </textarea>
            </div>
        </form>
        <br>
        <div id="result" class="alert alert-dismissable">
            <div class="btn-group">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#QtAddModal"><i
                        class="glyphicon glyphicon-menu-left"></i>&nbsp;&nbsp;返回
                </button>
                <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-pencil"></i>&nbsp;&nbsp;修改
                </button>
                <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-trash"></i>&nbsp;&nbsp;删除
                </button>
                <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-lock"></i>&nbsp;&nbsp;审批
                </button>
            </div>
            <table id="mytab" class="table table-hover"></table>
        </div>
    </div>
</rapid:override>
<rapid:override name="pagescript">
    <script src='/js/bootstrap-table/bootstrap-table.min.js'></script>
    <script src='/js/bootstrap-table/bootstrap-table-zh-CN.min.js'></script>

    <script type="text/javascript">
    </script>
</rapid:override>
<%@ include file="./../home/home.jsp" %>
