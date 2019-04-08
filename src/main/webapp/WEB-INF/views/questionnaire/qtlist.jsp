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
    <div class="">
        <form class="form-inline">
            <div class="form-group">
                <label for="ksrq">开始日期</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="ksrq" onFocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'});" />&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="jsrq">结束日期</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="jsrq" onFocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'});" />&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-primary" id="search_btn" >查询</button>
            </div>
        </form>
        <br>
        <div id="result" class="alert alert-dismissable">
            <div class="btn-group">
                <button type="button" class="btn btn-primary">新增</button>
                <button type="button" class="btn btn-primary">修改</button>
                <button type="button" class="btn btn-primary">删除</button>
                <button type="button" class="btn btn-primary">审批</button>
            </div>
            <table id="mytab" class="table table-hover"></table>
        </div>
    </div>
</rapid:override>
<rapid:override name="pagescript">
    <script src='/js/bootstrap-table/bootstrap-table.min.js'></script>
    <script src='/js/bootstrap-table/bootstrap-table-zh-CN.min.js'></script>

    <script type="text/javascript">
        $(function(){
            $('#mytab').bootstrapTable({
                url:"paged-ata",//请求路径
                method: 'post',
                contentType:'application/x-www-form-urlencoded; charset=UTF-8',//post请求需设置
                striped: true, //是否显示行间隔色
                pageNumber: 1, //初始化加载第一页
                pagination:true,//是否分页
                clickToSelect: true,
                pageSize:10,//单页记录数
                pageList:[5,10,20,30],//可选择单页记录数
                showRefresh:true,//刷新按钮
                uniqueId: "id",
                queryParams : function (params) {//上传服务器的参数
                    var temp = {//如果是在服务器端实现分页，limit、offset这两个参数是必须的
                        limit : params.limit, // 每页显示数量
                        offset : params.offset, // SQL语句起始索引
                        ksrq : $('#ksrq').val(),
                        jsrq : $('#jsrq').val()
                    };
                    return temp;
                },
                columns:[
                    {
                        checkbox: true,
                        visible: true                  //是否显示复选框
                    },
                    {
                        title:'问卷名称',
                        field:'name',
                        align: 'center'
                    },
                    {
                        title:'问卷描述',
                        field:'describe',
                        align: 'center'
                    },
                    {
                        title:'创建人',
                        field:'user',
                        align: 'center',
                        formatter: function (value, row, index){
                            return '<a href="#" target="_black" >'+value+'</a>'
                        }
                    },
                    {
                        title:'创建时间',
                        field:'createtime',
                        align: 'center',
                    },
                    {
                        title:'问卷状态',
                        field:'qtstate',
                        align: 'center',
                    },
                    {
                        title:'最后修改时间',
                        field:'updatetime',
                        align: 'center',
                    }
                ]
            })
        })

        //查询按钮事件
        $('#search_btn').click(function(){
            $('#mytab').bootstrapTable('refresh');
        })

        //格式化日期
        Date.prototype.Format = function (fmt) {
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "H+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }
    </script>
</rapid:override>
<%@ include file="./../home/home.jsp"%>