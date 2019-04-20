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
<%@ taglib uri="mobai.com/el-common" prefix="el" %>
<%
    int subnum =1;
    //多选题
    List<Subject> dxts = (List<Subject> )request.getAttribute("dxts");
    JSONArray jsonArray = JSON.parseArray(JSON.toJSONString(dxts));
    //获取选中的问卷
    Questionnaire questionnaire = (Questionnaire) request.getAttribute("questionnaire");

    JSONObject  jsonObject = JSON.parseObject(JSON.toJSONString(questionnaire));

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
<div class="container-fluid" style="padding-top: 0px">
    <div class="row" style="background-color: #1b248529;">
        <div class="col-md-2" style="background-color: #1c7430"></div>
        <div class="col-md-8  container-min" style="background-color: #eee">
            <form class="form-horizontal" role="form">
                <div style="text-align: center">
                    <h2>${questionnaire.name}</h2>
                    <br/>
                    <h4>${questionnaire.describes}</h4>
                    <br />
                </div>
                <div>
                        <div>
                            <h4>一、选择题</h4>
                        </div>
                        <c:forEach var="sub" items="${dxxzts}">
                            <div style="margin-bottom: 10px">
                                <p><h5> <c:out value="<%=subnum%>"/>、 <c:out value="${sub.subject}"/> <c:out value="${'单选' eq sub.chosetype?'(单选)':'(多选)'}" /></h5></p>
                                <div style="color: #777;font-size: 13px;">
                                        <!--单选题-->
                                        <c:forEach var="QToption" items="${el:toJsonArray(sub.opdetail)}">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="${el:fromatElementName(questionnaire.id, sub.id)}" id="${QToption.id}" value="${QToption.subopt}" > ${QToption.subopt}&nbsp;&nbsp;${QToption.name}
                                                </label>
                                            </div>
                                        </c:forEach>
                                </div>
                            </div>
                            <%
                                subnum++;
                            %>
                        </c:forEach>
                    <c:forEach var="sub" items="${dxts}">
                        <div style="margin-bottom: 10px">
                            <p><h5> <c:out value="<%=subnum%>"/>、 <c:out value="${sub.subject}"/> <c:out value="${'单选' eq sub.chosetype?'(单选)':'(多选)'}" /></h5></p>
                            <div style="color: #777;font-size: 13px;">
                                <!--多选题-->
                                <c:forEach var="QToption" items="${el:toJsonArray(sub.opdetail)}">
                                    <div class="checkbox">
                                        <label><input type="checkbox" name="${el:fromatElementName(questionnaire.id, sub.id)}" value="${QToption.subopt}" > ${QToption.subopt}&nbsp;&nbsp;${QToption.name}</label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <%
                            subnum++;
                        %>
                    </c:forEach>
                </div>
                <div>
                    <!--填空题-->
                    <c:if test="${fn:length(tkts)>0}">
                        <div>
                            <h4>二、填空题</h4>
                        </div>
                        <c:forEach var="sub" items="${tkts}">
                            <p><h5> <c:out value="<%=subnum%>"/>、 <c:out value="${sub.subject}"/></h5></p>
                            <%
                                subnum++;
                            %>
                        </c:forEach>
                    </c:if>
                </div>
                <div>
                    <!--简答题-->
                    <c:if test="${fn:length(jdts)>0}">
                        <div>
                            <h4>三、简答题</h4>
                        </div>
                        <c:forEach var="sub" items="${jdts}">
                            <p><h5> <c:out value="<%=subnum%>"/>、 <c:out value="${sub.subject}"/></h5></p>
                            <textarea class="form-control" name="${el:fromatElementName(questionnaire.id, sub.id)}"></textarea>
                            <%
                                subnum++;
                            %>
                        </c:forEach>
                    </c:if>
                </div>
                <c:if test="${isedit}">
                    <div class="form-group" style="padding-top: 20px">
                        <button type="button" id="submit-from" class="btn btn-primary btn-lg btn-block">提交</button>
                    </div>
                </c:if>
            </form>
        </div>
        <div class="col-md-2" style="background-color: salmon"></div>
    </div>
</div>
<script src="/js/jQuery/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src='/js/bootstrapValidator/bootstrapValidator.min.js'></script>
<script src="/js/custom/user-min.js"></script>
<script type="text/javascript">
    $(function() {
        $('#submit-from').click(function() {
            var questionnaire1 =  <%=jsonObject%>
            var duoxuan = <%=jsonArray%>
            console.log(duoxuan);
            //获取除多选题外的题
            var d = {};
            var t = $('form').serializeArray();
            $.each(t, function() {
                d[this.name] = this.value;
            });
            for(var i=0;i<duoxuan.length;i++){
                var  jsonobject = duoxuan[i];
                var suname = 'subject-'+questionnaire1.id+'-'+jsonobject.id;
                //js获取复选框值
                var obj = document.getElementsByName(suname);//选择所有name="interest"的对象，返回数组
                var s='';//如果这样定义var s;变量s中会默认被赋个null值
                for(var i=0;i<obj.length;i++){
                    if(obj[i].checked) //取到对象数组后，我们来循环检测它是不是被选中
                        s+=obj[i].value+',';   //如果选中，将value添加到变量s中
                }
                var basic = s.substr(0, s.length - 1);
                d[suname] =basic;
            }
            $.ajax({
                url: "persionSubmitQt",
                data: {"data": JSON.stringify(d)},
                dataType: "json",
                type: "POST",
                success: function (data) {
                    $reportTable.bootstrapTable('refresh');
                    if (data.status == 200) {//成功
                        toastr.success(data.msg);
                    } else {
                        toastr.error(data.msg)
                    }
                }
            });
        });
    });
</script>
</body>
</html>
