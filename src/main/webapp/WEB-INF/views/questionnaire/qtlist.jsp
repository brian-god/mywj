<%@ page import="com.hugo.utils.QAResult" %><%--
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/4
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="childcss">
    <link rel="stylesheet" href="/css/bootstrap-table/bootstrap-table.min.css">
</rapid:override>
<rapid:override name="childconment">
    <div class="">
        <form class="form-inline">
            <div class="form-group">
                <label for="ksrq">开始日期</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="ksrq"
                       onFocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'});"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <label for="jsrq">结束日期</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="jsrq"
                       onFocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'});"/>&nbsp;&nbsp;
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-primary" id="search_btn">查询</button>
            </div>
        </form>
        <br>
        <div id="result" class="alert alert-dismissable">
            <div class="btn-group">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#QtAddModal"><i
                        class="glyphicon glyphicon-plus"></i>&nbsp;&nbsp;新增
                </button>
                <button type="button" class="btn btn-primary" onclick="updateQT()"><i class="glyphicon glyphicon-pencil"></i>&nbsp;&nbsp;修改
                </button>
                <button type="button" class="btn btn-primary" onclick="deleteQt()"><i class="glyphicon glyphicon-trash"></i>&nbsp;&nbsp;删除
                </button>
                <button type="button" class="btn btn-primary" onclick="submissionQT()"><i class="glyphicon glyphicon-upload"></i>&nbsp;&nbsp;提交
                </button>
                <button type="button" class="btn btn-primary" onclick="approvalQT()"><i class="glyphicon glyphicon-lock"></i>&nbsp;&nbsp;审批
                </button>
            </div>
            <table id="mytab" class="table table-hover"></table>
        </div>
    </div>
    <!-- 新增弹框 -->
    <div class="modal fade" id="QtAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel">新增问卷</h4>
                </div>
                <form class="form-horizontal" role="form" action="addQtManage" method="post" id="form1">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">问卷名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" id="firstname"
                                       placeholder="请输入问卷名字">
                            </div>
                        </div>
                        <div class="form-group"  style="display:none">
                            <label for="qtID" class="col-sm-2 control-label">主键</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="id" id="qtID">
                            </div>
                        </div>
                        <div class="form-group"  style="display:none">
                            <label for="qtnumber" class="col-sm-2 control-label">问卷编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="number" id="qtnumber">
                            </div>
                        </div>
                        <div class="form-group"  style="display:none">
                            <label for="qtcreatetime" class="col-sm-2 control-label">创建时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="createtime" id="qtcreatetime">
                            </div>
                        </div>
                        <div class="form-group"  style="display:none">
                            <label for="qtstate" class="col-sm-2 control-label">问卷状态</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="state" id="qtstate">
                            </div>
                        </div>
                        <div class="form-group"  style="display:none">
                            <label for="qtmodifier" class="col-sm-2 control-label">创建人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="modifier" id="qtmodifier">
                            </div>
                        </div>
                        <div class="form-group"  style="display:none">
                            <label for="qtuser" class="col-sm-2 control-label">所属用户</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="user" id="qtuser">
                            </div>
                        </div>
                        <div class="form-group"  style="display:none">
                            <label for="qtstate" class="col-sm-2 control-label">所属用户</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="qtstate" id="qtstate1">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">描述</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="lastname" name="describes"
                                          placeholder="请输入问卷描述"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">提交更改</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</rapid:override>
<rapid:override name="pagescript">
    <script src='/js/bootstrap-table/bootstrap-table.min.js'></script>
    <script src='/js/bootstrap-table/bootstrap-table-zh-CN.min.js'></script>

    <script type="text/javascript">
    /**
     * 提交的方法
     */
    function submissionQT() {
        //获取需要审批的数据
        var rows= $('#mytab').bootstrapTable('getSelections');
        console.log(rows)
        if(rows.length >0){
            for(i=0;i<rows.length;i++){//遍历并检查数据
                var row = rows[0];
                console.log(row)
                //获取单据状态
                var state = row.state;
                if(state != -1){
                    toastr.warning("不能够提交非自由态的数据");
                    return;
                }
            }
            $.ajax({
                url: "submissionQTManage",
                data: {"data":JSON.stringify(rows)},
                dataType: "json",
                type: "POST",
                success: function (data) {
                    $('#mytab').bootstrapTable('refresh');
                    if(data.status == 200){//成功
                        toastr.success(data.msg);
                    }else{
                        toastr.error(data.msg)
                    }
                }
            });
        }else{
            toastr.warning("请先选中要提交的数据");
            return;
        }
    }
        /**
         * 审批的方法
         */
        function approvalQT() {
            //获取需要审批的数据
            var rows= $('#mytab').bootstrapTable('getSelections');
            console.log(rows)
            if(rows.length >0){
                for(i=0;i<rows.length;i++){//遍历并检查数据
                    var row = rows[0];
                    console.log(row)
                    //获取单据状态
                    var state = row.state;
                    if(state != 1){
                        toastr.warning("不能够审批非提交的数据");
                        return;
                    }
                }
                $.ajax({
                    url: "approvalQtManage",
                    data: {"data":JSON.stringify(rows)},
                    dataType: "json",
                    type: "POST",
                    success: function (data) {
                        $('#mytab').bootstrapTable('refresh');
                        if(data.status == 200){//成功
                            toastr.success(data.msg);
                        }else{
                            toastr.error(data.msg)
                        }
                    }
                });
            }else{
                toastr.warning("请先选中要审批的数据");
                return;
            }
        }
        /**
         * 删除的方法
         */
        function deleteQt() {
            //获取需要删除的数据
            var rows= $('#mytab').bootstrapTable('getSelections');
            console.log(rows)
            if(rows.length >0){
                for(i=0;i<rows.length;i++){//遍历并检查数据
                    var row = rows[0];
                    console.log(row)
                    //获取单据状态
                    var state = row.state;
                    if(state != -1){
                        toastr.warning("不能够删除已提交的数据");
                        return;
                    }
                }
                $.ajax({
                    url: "deleteQtManage",
                    data: {"data":JSON.stringify(rows)},
                    dataType: "json",
                    type: "POST",
                    success: function (data) {
                        $('#mytab').bootstrapTable('refresh');
                        if(data.status == 200){//成功
                            toastr.success(data.msg);
                        }else{
                            toastr.error(data.msg)
                        }
                    }
                });
            }else{
                toastr.warning("请先选中要删除的数据");
                return;
            }
        }
        /**
         * 修改的方法
         */
        function updateQT(){
            var rows= $('#mytab').bootstrapTable('getSelections');
            if(rows.length >0){
                if(rows.length == 1){
                    if(rows[0].state == -1){
                        $('#QtAddModal').modal('show')
                    }else{
                        toastr.warning("单据已提交不能够修改");
                    }
                }else{
                    toastr.warning("一次只能修改一条数据");
                }
            }else{
                toastr.warning("请先选中一条数据");
            }
        }

        /**
         * 调用模态框的展示方法触发
         */
        $('#QtAddModal').on('show.bs.modal', function () {
            // 执行一些动作...
            var rows= $('#mytab').bootstrapTable('getSelections');
            if(rows.length>0){
                $("#firstname").val(rows[0].name);//名称
                $("#lastname").val(rows[0].describes);//描述
                $("#qtID").val(rows[0].id);//主键
                $("#qtnumber").val(rows[0].number);//问卷编号
                $("#qtcreatetime").val(rows[0].createtime);//创建时间qtuser
                $("#qtstate").val(rows[0].state);//问卷状态
                $("#qtmodifier").val(rows[0].modifier);//创建人
                $("#qtuser").val(rows[0].user);//所属用户
                $("#qtstate1").val(rows[0].qtstate);//状态
            }
        })
        $(function () {
           initToastr();
            $('#mytab').bootstrapTable({
                url: "paged-ata",//请求路径
                method: 'post',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//post请求需设置
                striped: true, //是否显示行间隔色
                pageNumber: 1, //初始化加载第一页
                pagination: true,//是否分页
                clickToSelect: true,
                pageSize: 3,//单页记录数
                paginationShowPageGo: true,
                showRefresh: true,//刷新按钮
                sidePagination: 'server',
                uniqueId: "id",
                onDblClickRow: function (row) {//双击触发
                    console.log(row);
                    $.ajax({
                        type:'post',
                        url:'/tobill',
                        data: row,
                        dataType:'html',
                        success:function(result){
                            console.log(result)
                            $("body").html(result);
                        }
                    });
                },
                queryParams: function (params) {
                    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                    var temp = {
                        limit: params.limit, // 每页显示数量
                        offset: params.offset, // SQL语句起始索引
                        page: (params.offset / params.limit) + 1,   //当前页码
                        ksrq: $('#ksrq').val(),
                        jsrq: $('#jsrq').val()
                    };
                    return temp;
                },
                columns: [
                    {
                        checkbox: true,
                        visible: true                  //是否显示复选框
                    },
                    {
                        title: '主键',
                        field: 'id',
                        align: 'center',
                        visible: false
                    },
                    {
                        title: '用户',
                        field: 'user',
                        align: 'center',
                        visible: false
                    },
                    {
                        title: '状态',
                        field: 'qtstate',
                        align: 'center',
                        visible: false
                    },
                    {
                        title: '问卷编号',
                        field: 'number',
                        align: 'center'
                    },
                    {
                        title: '问卷名称',
                        field: 'name',
                        align: 'center'
                    },
                    {
                        title: '问卷描述',
                        field: 'describes',
                        align: 'center'
                    },
                    {
                        title: '创建人',
                        field: 'modifier',
                        align: 'center',
                      /*  formatter: function (value, row, index) {
                            return '<a href="#" target="_black" >' + value + '</a>'
                        }*/
                    },
                    {
                        title: '创建时间',
                        field: 'createtime',
                        align: 'center',
                    },
                    {
                        title: '问卷状态',
                        field: 'state',
                        align: 'center',
                        formatter: stateFormatter
                    },
                    {
                        title: '最后修改时间',
                        field: 'updatetime',
                        align: 'center',
                    }
                ]
            })
            /** 验证数据是否添加成功  */
            $("#form1").ajaxForm(function(data){
                $('#mytab').bootstrapTable('refresh');
                $('#QtAddModal').modal('hide')
                if(data.status==200){
                    toastr.success('添加问卷成功请双击表中记录，添加问卷内容');
                }else if(data.status==300){
                    toastr.success(data.msg);
                }else{
                    toastr.error(data.msg);
                }
            });
        })
        /**
         * 格式化状态
         * @param value
         */
        var stateFormatter = function (value) {
            var restr = "";
            if (value == -1) {
                return "<span class=\"label label-info\">自由态</span>";
            }
            if (value == 1) {
                return "<span class=\"label label-warning\">提交状态</span>";
            }
            if (value == 2) {
                return "<span class=\"label label-success\">审批通过</span>";
            }
            if (value == 3) {
                return "<span class=\"label label-danger\">驳回</span>";
            }
            return null;
        }
        //查询按钮事件
        $('#search_btn').click(function () {
            $('#mytab').bootstrapTable('refresh');
        })
        //修改触发
        var update = function () {
            EditViewById(id, 'view');
        }
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
<%@ include file="./../home/home.jsp" %>