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
<%
    //获取选中的问卷
    Questionnaire questionnaire = (Questionnaire) request.getAttribute("questionnaire");
    //问题列表
    Map<String,List<Subject>> subjihe = ( Map<String,List<Subject>>) request.getAttribute("subjihe");
    //是否填写
    boolean isedit = (boolean) request.getAttribute("isedit");
    List<Subject>  xzts = subjihe.get("xzts");//选择题
    List<Subject>  tkts = subjihe.get("tkts");//填空题
    List<Subject>  jdts = subjihe.get("jdts");//简答题
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
               <%
                   if(null != tkts && xzts.size()>0){
               %>
               <div>
                   <h4>一、选择题</h4>
               </div>
               <%
                for(int i=0;i<xzts.size();i++){
                    Subject  subject = xzts.get(i);
                    int num = subject.getNum();//题号
                    String  subname = subject.getSubject();//描述
                    String  option = subject.getOpdetail();
                    String  chosetype = subject.getChosetype();//单选还是多选
                    JSONArray  jsonArray = JSON.parseArray(option);
                    if(null!= jsonArray && jsonArray.size()>0){
               %>
               <div style="margin-bottom: 30px">
                  <h5> <%=subnum%>、 <%=subname%> <%="单选".equals(chosetype.trim())?"(单选)":"(多选)"%></h5>
                   <br/>
                   <%
                    if("单选".equals(chosetype.trim())){
                        for (Object jsonobj: jsonArray
                             ) {
                            JSONObject  option1 = (JSONObject) jsonobj;
                   %>
                       <div class="radio">
                           <label>
                               <input type="radio" name="optionsRadios" id="<%= option1.get("id")%>" value="<%=option1.get("subopt")%>" > <%=option1.get("subopt")%>&nbsp;&nbsp;<%=option1.get("name")%>
                           </label>
                       </div>
                   <%
                        }
                       }else {
                            for (Object jsonobj: jsonArray
                            ) {
                                JSONObject  option1 = (JSONObject) jsonobj;
                   %>
                       <div class="checkbox">
                           <label><input type="checkbox" value="<%=option1.get("subopt")%>" ><%=option1.get("subopt")%>&nbsp;&nbsp;<%=option1.get("name")%></label>
                       </div>
                   <%
                       }
                   %>
               </div>
               <%
                           }
                       }
                       subnum++;
                   }
                   }
               %>
           </div>
            <div>
                <!--填空题-->
                <%
                    if(null != tkts && tkts.size()>0){
                %>
                <div>
                    <h4>二、填空题</h4>
                </div>
                <%
                    for (Subject sub: tkts
                    ) {
                %>
                <div style="margin-bottom: 10px">
                    <h5> <%=subnum%>、 <%=sub.getSubject()%> </h5>
                </div>
                <%
                            subnum++;

                        }

                    }
                %>
            </div>
            <div style="width: 100%">
                <!--简答题-->
                <%
                    if(null != tkts && tkts.size()>0){
                %>
                <div>
                    <h4>三、简答题</h4>
                </div>
                <%
                    for (Subject sub: jdts
                    ) {
                %>
                <div style="margin-bottom: 10px">
                    <h5> <%=subnum%>、 <%=sub.getSubject()%> </h5>
                </div>
                <div style="width: 100%">
                    <div class="form-group">
                        <textarea class="form-control" id="content<%=sub.getId()%>" rows="10"  ></textarea>
                    </div>
                </div>
                <%
                            subnum++;

                        }

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
