<%--
  Created by IntelliJ IDEA.
  User: hugotang
  Date: 2019-04-09
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.hugo.utils.QAResult" %>
<%@ page import="com.hugo.entity.Questionnaire" %>
<%@ page import="com.hugo.myenum.ProblemType" %>
<%@ page import="com.hugo.myenum.ChoiceType" %><%--
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/4
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%
    //获取选中的问卷
    Questionnaire questionnaire = (Questionnaire) request.getAttribute("row");
    //获取选中的问卷
    ChoiceType[] choiceType = (ChoiceType[]) request.getAttribute("ChoiceType");
    String zt = "自由态";
    int state  = questionnaire.getState();
    if (state == -1) {
        zt = "自由态";
    }
    if (state == 1) {
        zt = "提交状态";
    }
    if (state == 2) {
        zt = "审批通过";
    }
    if (state == 3) {
        zt = "驳回";
    }
%>
<c:set var="problemTypes" value="<%= problemType%>"/>
<rapid:override name="childcss">
    <link rel="stylesheet" href="/css/bootstrap-table/bootstrap-table.min.css">
</rapid:override>
<rapid:override name="childconment">
    <div class="">
        <div class="bill-title">
            <div class="btn-group">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#QtAddModal" onclick="javascrtpt:window.location.href='/qt-manage'"><i
                        class="glyphicon glyphicon-menu-left"></i>&nbsp;&nbsp;返回
                </button>
                <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-pencil" ></i>&nbsp;&nbsp;修改
                </button>
                <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-trash"></i>&nbsp;&nbsp;删除
                </button>
                <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-lock"></i>&nbsp;&nbsp;审批
                </button>
            </div>
        </div>
        <form class="form-inline header-bill">
            <div class="form-group">
                <label for="number">问卷编号</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="number" value="${questionnaire.number}"
                       readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="name">问卷名称</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="name" value="${questionnaire.name}" readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="modifier">创建人</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="modifier" value="${questionnaire.modifier}"
                       readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="createtime">创建时间</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="createtime" value="${questionnaire.createtime}"
                       readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="state">问卷状态</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="state" value="<%=zt%>" readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="updatetime">最后修改时间</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="updatetime" value="${questionnaire.updatetime}"
                       readonly="readonly"/>&nbsp;&nbsp;
            </div>
            <br>
            <div class="one-line-div">
                <div class="one-line-left-div"><label for="describes">问卷描述</label>&nbsp;&nbsp;</div>
                <div class="one-line-right-div">
                     <textarea class="form-control" rows="2" id="describes" name="describes" value="这是问卷描述"
                               readonly="readonly" style="width: 100%" >${questionnaire.describes}</textarea>
                </div>
            </div>
        </form>
        <br>
        <c:forEach var="problemType" items="${problemTypes}">
            <h2>${problemType.code}|${problemType.desc}</h2>
        </c:forEach>
    </div>
</rapid:override>
<rapid:override name="pagescript">
    <script src='/js/bootstrap-table/bootstrap-table.min.js'></script>
    <script src='/js/bootstrap-table/bootstrap-table-zh-CN.min.js'></script>

    <script type="text/javascript">
    </script>
</rapid:override>
<%@ include file="./../home/home.jsp" %>
