<%@ page import="com.hugo.entity.Questionnaire" %>
<%@ page import="com.hugo.entity.Subject" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="com.hugo.entity.Option" %>
<%--
  问卷展示
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/18
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    //获取选中的问卷
    Questionnaire questionnaire = (Questionnaire) request.getAttribute("questionnaire");
    //问题列表
    //Map<String,List<Subject>> subjihe = ( Map<String,List<Subject>>) request.getAttribute("subjihe");
    //是否填写
    boolean isedit = (boolean) request.getAttribute("isedit");
    //List<Subject>  tkts = subjihe.get("tkts");//填空题
   // List<Subject>  jdts = subjihe.get("jdts");//简答题
    int subnum =1;
%>
<html>
<head>
    <title>问卷</title>
    <link rel="icon" href="/img/logo.ico">
    <link rel="stylesheet" href="/css/bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/dashboard.css">
    <link rel="stylesheet" href="/css/wj.main.css">
    <link rel="stylesheet" href="/css/bootstrapValidator/bootstrapValidator.min.css">
</head>
<body>
<div class="container-fluid" style="<%=isedit?"padding-top: 20px":"padding-top: 0px"%>">
    <div class="row" style="background-color: #1b248529;">
        <div class="col-md-2" style="background-color: #1c7430"></div>
        <div class="col-md-8  container-min" style="background-color: #eee">
           <div style="text-align: center">
               <h2>${questionnaire.name}</h2>
               <br/>
               <h4>${questionnaire.describes}</h4>
               <br />
           </div>
           <div>
               <!--选择题-->
               <c:if test="${fn:length(xzts)>0}">
               <div>
                   <h4>一、选择题</h4>
               </div>
                   <c:forEach var="sub" items="${xzts}">
                       <div style="margin-bottom: 30px">
                           <h4> <c:out value="<%=subnum%>"/>、 <c:out value="${sub.subject}"/> <c:out value="${'单选' eq sub.chosetype?'(单选)':'(多选)'}" /></h4>
                           <br/>
                           <c:out value="${'单选' eq sub.chosetype}"/>
                           <c:if test="${'单选' eq xz}">
                                <c:forEach var="QToption" items="${sub.opdetail}">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="${QToption.id}" value="${QToption.subopt}" > ${QToption.subopt}&nbsp;&nbsp;${QToption.name}
                                        </label>
                                    </div>
                                </c:forEach>
                           </c:if>
                           <c:if test="${'多选' eq xz} ">
                               <c:forEach var="QToption" items="${sub.opdetail}">
                                   <div class="checkbox">
                                       <label><input type="checkbox" value="${QToption.subopt}" > ${QToption.subopt}&nbsp;&nbsp;${QToption.name}</label>
                                   </div>
                               </c:forEach>
                           </c:if>
                       </div>
                       <%
                            subnum++;
                       %>
                   </c:forEach>
               </c:if>
           </div>
        </div>
        <div class="col-md-2" style="background-color: salmon"></div>
    </div>
</div>
<script src="/js/jQuery/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src='/js/bootstrapValidator/bootstrapValidator.min.js'></script>
<script src="/js/custom/user-min.js"></script></body>
</html>
