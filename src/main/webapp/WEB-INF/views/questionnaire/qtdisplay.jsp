<%@ page import="com.hugo.entity.Questionnaire" %>
<%@ page import="com.hugo.entity.Subject" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%--
  问卷展示
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/18
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取选中的问卷
    Questionnaire questionnaire = (Questionnaire) request.getAttribute("questionnaire");
    //问题列表
    Map<String,List<Subject>> subjihe = ( Map<String,List<Subject>>) request.getAttribute("subjihe");
    List<Subject>  xzts = subjihe.get("xzts");//选择题
    List<Subject>  tkts = subjihe.get("tkts");//填空题
    List<Subject>  jdts = subjihe.get("jdts");//简答题
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
<div class="container-fluid" style="background-color: #1b248529;padding-top: 20px">
    <div class="row">
        <div class="col-md-2" style="background-color: #1c7430"></div>
        <div class="col-md-8  container-min" style="background-color: #eee">
           <div style="text-align: center">
               <h2>${questionnaire.name}</h2>
               <br/>
               <h4>${questionnaire.describes}</h4>
               <hr/>
           </div>
           <div>
               <%
                for(int i=0;i<xzts.size();i++){
                    Subject  subject = xzts.get(i);
                    int num = subject.getNum();//题号
                    String  subname = subject.getSubject();//描述
                    String  option = subject.getOpdetail();
               %>
               <div>
                   <%=num%>、 <%=subname%>
                   <br/>
                   <%= option%>
               </div>
               <%
                   }
               %>
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
