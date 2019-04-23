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
        <form class="form-inline">
            <div class="form-group">
                <label for="ksrq">注册时间</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="ksrq"
                       onFocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'});"/>&nbsp;&nbsp;
                <input type="text" class="form-control" id="jsrq"
                       onFocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'});"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="ksrq">用户名</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="squsername"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="ksrq">手机号</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="sqmobile"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="ksrq">邮箱</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="sqemail"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="ksrq">状态</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="sqstatus"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-primary" id="search_btn">查询</button>
            </div>
        </form>
        <div id="result" class="alert alert-dismissable">
            <table id="userListTable" class="table table-hover"></table>
        </div>
    </div>
</rapid:override>
<rapid:override name="pagescript">
    <script src='/js/bootstrap-table/bootstrap-table.min.js'></script>
    <script src='/js/bootstrap-table/bootstrap-table-zh-CN.min.js'></script>
    <script type="text/javascript">
        $(function () {
            initToastr();
            $('#userListTable').bootstrapTable({
                url: "getAllUser",//请求路径
                method: 'post',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//post请求需设置
                striped: true, //是否显示行间隔色
                pageNumber: 1, //初始化加载第一页
                pagination: true,//是否分页
                //clickToSelect: true,
                pageSize: 3,//单页记录数
                paginationShowPageGo: true,
                showRefresh: true,//刷新按钮
                sidePagination: 'server',
                uniqueId: "id",
                queryParams: function (params) {
                    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                    var temp = {
                        limit: params.limit, // 每页显示数量
                        offset: params.offset, // SQL语句起始索引
                        page: (params.offset / params.limit) + 1,   //当前页码
                        ksrq: $('#ksrq').val(),
                        jsrq: $('#jsrq').val(),
                        username: $('#squsername').val(),//用户名
                        mobile:$('#sqmobile').val(),//手机号
                        email:$('#sqemail').val(),//邮箱
                        status:$('#sqstatus').val(),//状态
                    };
                    return temp;
                },
                columns: [
                    {
                        title: '主键',
                        field: 'id',
                        align: 'center',
                        visible: false
                    },
                    {
                        title: '用户名',
                        field: 'username',
                        align: 'center',
                    },
                    {
                        title: '昵称',
                        field: 'nickname',
                        align: 'center',
                    },
                    {
                        title: '邮箱',
                        field: 'email',
                        align: 'center',
                    },
                    {
                        title: '手机号',
                        field: 'mobile',
                        align: 'center'
                    },
                    {
                        title: '性别',
                        field: 'gender',
                        align: 'center',
                        formatter: function (value) {
                            if (value == 1) {
                                return "女";
                            }
                            return "男";
                        }
                    },
                    {
                        title: '生日',
                        field: 'birthday',
                        align: 'center'
                    },
                    {
                        title: '加入时间',
                        field: 'jointime',
                        align: 'center',
                    },
                    {
                        title: '用户状态',
                        field: 'status',
                        align: 'center',
                    },
                    {
                        title: '用户类型',
                        field: 'usertype',
                        align: 'center',
                    },
                    {
                        title: '修改时间',
                        field: 'updatetime',
                        align: 'center',
                    },
                ]
            })
        })
    </script>
</rapid:override>
<%@ include file="./../home/home.jsp" %>
