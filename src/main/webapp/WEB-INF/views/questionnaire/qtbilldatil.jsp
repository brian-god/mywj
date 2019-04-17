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
    int state = questionnaire.getState();
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
<rapid:override name="childcss">
    <link rel="stylesheet" href="/css/bootstrap-table/bootstrap-table.min.css">
</rapid:override>
<rapid:override name="childconment">
    <div class="">
        <div class="bill-title">
            <div class="btn-group">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#QtAddModal"
                        id="retTableheader" ><i
                        class="glyphicon glyphicon-menu-left"></i>&nbsp;&nbsp;返回
                </button>
                <button type="button" class="btn btn-primary" id="saveTableBody"><i
                        class="glyphicon glyphicon-floppy-disk"></i>&nbsp;&nbsp;保存
                </button>
                <button type="button" class="btn btn-primary" id="editTableBody"><i
                        class="glyphicon glyphicon-pencil"></i>&nbsp;&nbsp;修改
                </button>
                <button type="button" class="btn btn-primary" id="deleteTable"><i class="glyphicon glyphicon-trash"></i>&nbsp;&nbsp;删除
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
                               readonly="readonly" style="width: 100%">${questionnaire.describes}</textarea>
                </div>
            </div>
        </form>
            <%--<div class="btn-group">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#QtAddModal"
                        onclick="javascrtpt:window.location.href='/qt-manage'"><i
                        class="glyphicon glyphicon-menu-left"></i>&nbsp;&nbsp;返回
                </button>
                <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-pencil"></i>&nbsp;&nbsp;修改
                </button>
                <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-trash"></i>&nbsp;&nbsp;删除
                </button>
                <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-lock"></i>&nbsp;&nbsp;审批
                </button>
            </div>
                <table id="mytab" class="table table-hover"></table>--%>
        <div class="btn-group btn-group-sm" style="text-align: right;">
            <button type="button" class="btn btn-success" id="addRowbtn"><i class="glyphicon glyphicon-plus"></i>&nbsp;&nbsp;增加
            </button>
            <button type="button" class="btn btn-danger" id="delRowbtn"><i class="glyphicon glyphicon-trash"></i>&nbsp;&nbsp;删除
            </button>
        </div>
        <div>
            <table class="table table-striped table-hover" id="reportTable"></table>
        </div>
        <!-- 模态框（Modal） -->
        <div id="modalTable" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">选择题选项</h5>
                        <button type="button" class="close" data-dismiss="modal" onclick="choseOptionModel()"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="btn-group btn-group-sm" style="text-align: right;">
                            <button type="button" class="btn btn-success" id="addOptionRowbtn"><i
                                    class="glyphicon glyphicon-plus"></i>&nbsp;&nbsp;增加
                            </button>
                            <button type="button" class="btn btn-danger" id="delOptionRowbtn"><i
                                    class="glyphicon glyphicon-trash"></i>&nbsp;&nbsp;删除
                            </button>
                        </div>
                        <table id="optionTable"
                            <%--  data-toggle="table"
                              data-height="299"
                              data-url="json/data1.json"--%>>
                                <%--<thead>
                                <tr>
                                    <th data-field="id">ID</th>
                                    <th data-field="name">Item Name</th>
                                    <th data-field="price">Item Price</th>
                                </tr>
                                </thead>--%>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                onclick="choseOptionModel()">确定
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</rapid:override>
<rapid:override name="pagescript">
    <script src='/js/bootstrap-table/bootstrap-table.min.js'></script>
    <script src='/js/bootstrap-table/bootstrap-table-zh-CN.min.js'></script>
    <script type="text/javascript">
        var $table = $('#optionTable')
        var $reportTable =  $('#reportTable');
        //控制表单能否编辑
        var isedter = false;
        //定义选项数字
        var choses = new Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J");
        //保存方法
        function saveSubAndOption(){
            var state = <%=state%>;
            if (state == -1 && isedter) {
                isedter = false;
                //获取表格数据
                var datas = $reportTable.bootstrapTable('getData');
                if (datas.length > 0) {
                    var json_data = JSON.stringify(datas);
                    console.log(json_data);
                    $.ajax({
                        url: "subjectAndOptionAction",
                        data: {"data": json_data, "subID":${questionnaire.id},"operation":"save"},
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
                } else {
                    toastr.error('保存失败表体不能为空');
                }
            } else {
                toastr.warning('问卷未修改');
            }
        }
        $(function () {
            initToastr();
            $("#retTableheader").click(function () {
                if(isedter){
                    $.confirm({
                        title: '确认',
                        content: '数据未保存是否保存数据',
                        type: 'green',
                        icon: 'glyphicon glyphicon-question-sign',
                        buttons: {
                            ok: {
                                text: '确认',
                                btnClass: 'btn-primary',
                                action: function() {
                                    saveSubAndOption();
                                    window.location.href = '/qt-manage';//指向下载资源（此处为目标文件的输出数据流）
                                }
                            },
                            cancel: {
                                text: '取消',
                                btnClass: 'btn-primary',
                                action: function() {
                                    window.location.href = '/qt-manage'; //指向下载资源（此处为目标文件的输出数据流）
                                }
                            }
                        }
                    });
                }else{//非编辑态直接返回
                    window.location.href='/qt-manage'
                }
            });
            //删除处理的方法
            $("#deleteTable").click(function () {
                //获取状态
                var state =  ${questionnaire.state};
                if(state != -1){
                    toastr.warning("无法删除非自由态的单据")
                }else {
                    //获取表格数据
                    var datas =$reportTable.bootstrapTable('getData');
                    var json_data = JSON.stringify(datas);
                    $.ajax({
                        url: "subjectAndOptionAction",
                        data: {"data": json_data, "subID":${questionnaire.id},"operation":"delete"},
                        dataType: "json",
                        type: "POST",
                        success: function (data) {
                            $reportTable.bootstrapTable('refresh');
                            if (data.status == 200) {//成功
                                toastr.success("删除成功")
                                window.location.href="qt-manage";
                            } else {
                                toastr.error(data.msg)
                            }
                        }
                    });
                }
            });
            //保存数据
            $("#saveTableBody").click(function () {
                saveSubAndOption();
            });
            //表体可编辑
            $("#editTableBody").click(function () {
                var state = <%=state%>;
                if (state == -1) {
                    isedter = true;
                    toastr.success('已进入编辑模式，请双击表体进行编辑');
                } else {
                    toastr.warning('问卷不是自由态不能够修改');
                }
            });
            var subRum = 0;
            //编辑表格
            $reportTable.bootstrapTable({
                //数据来源的网址
                url: 'getSubjectAndOption',
                method: 'post',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//post请求需设置
                striped: true, //是否显示行间隔色
                pageNumber: 1, //初始化加载第一页
                pagination: true,//是否分页
                clickToSelect: true,
                pageSize: 5,//单页记录数
                paginationShowPageGo: true,
                showRefresh: true,//刷新按钮
                sidePagination: 'server',
                uniqueId: "id",
                columns: [[
                    {field: "num", edit: false, title: "编号", align: "center"},
                    {field: "subject", edit: true, title: "题目", align: "center",},
                    {field: "questionnaire", edit: true, title: "所属问卷", align: "center", visible: false},
                    {field: "subjecttype", edit: true, title: "题目类型", align: "center"},
                    {field: "chosetype", edit: true, title: "选择题类型", align: "center"},
                    {field: "chosebutton", edit: true, title: "选项", align: "center"},
                    {field: "opdetail", edit: true, title: "内容", align: "center",visible: false},
                    {field: "id", edit: true, title: "主键", align: "center", visible: false},
                ]],
                queryParams: function (params) {
                    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                    var temp = {
                        limit: params.limit, // 每页显示数量
                        offset: params.offset, // SQL语句起始索引
                        page: (params.offset / params.limit) + 1,   //当前页码
                        qtId: ${questionnaire.id}
                    };
                    console.log(params)
                    return temp;
                },
                /**
                 * @param {点击列的 field 名称} field
                 * @param {点击列的 value 值} value
                 * @param {点击列的整行数据} row
                 * @param {td 元素} $element
                 */
                //onClickCell
                onDblClickCell: function (field, value, row, $element) {
                    if (isedter) {//控制表体编辑
                        cellOnClocke(field, value, row, $element);
                    }
                }
            });
            $('#addRowbtn').click(function () {
                if(isedter) {
                    var length = $reportTable.bootstrapTable('getData').length;
                    var data = {"num": length + 1, "subjecttype": '', "subject": '', "chosetype": ''};
                    $reportTable.bootstrapTable('append', data);
                }else {
                    toastr.warning("非编辑状态不能增行");
                    return;
                }
            });
            $('#delRowbtn').click(function () {
                if(isedter) {
                    var length = $reportTable.bootstrapTable('getData').length;
                    if (length > 0) {//保留一行数据
                        $reportTable.bootstrapTable('remove', {
                            field: 'num',
                            values: [parseInt(length)]
                        })
                    }
                }else {
                    toastr.warning("非编辑状态不能删除行");
                }
            });
            $('sava').onClickCell(function () {

            });
        });

        //题目类型
        function selectChange(select) {
            var index = select.getAttribute("data-rownum");
            var value = select.options[select.selectedIndex].value
            saveData(index, "subjecttype", value)
        }

        //选择题类型类型
        function selectChoseChange(select) {
            var index = select.getAttribute("data-rownum");
            var value = select.options[select.selectedIndex].value
            saveData(index, "chosetype", value)
        }

        /**
         * 单元格点击触发
         * @param field
         * @param value
         * @param row
         * @param $element
         */
        function cellOnClocke(field, value, row, $element) {
            var index = $element[0].parentElement.rowIndex;
            if ("subject" == field) {
                $element.attr('contenteditable', true);
                $element.attr('id', "subname");
                $element.blur(function () {
                    var vale = $("#subname")[0].innerHTML;
                    console.log(vale);
                    $element.attr('id', "");
                    $element.attr('contenteditable', false);
                    var tdValue = $element.html();
                    saveData(index, field, vale)
                })
            } else if ("subjecttype" == field) {//题目类型
                //var vale ='<button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-zoom-in"></i></button>';
                //var vale ='<button type="button" class="btn btn-primary " id="cell-but-'+index+'" onclick="btclock(this)"><i class="glyphicon glyphicon-zoom-in"></i></button>';
                var value = '<select class="form-control" data-rownum="' + index + '" onchange="selectChange(this)">\n' +
                    '      <option value="0"></option>\n' +
                    '      <option value="选择题">选择题</option>\n' +
                    '      <option value="填空题">填空题</option>\n' +
                    '      <option value="简答题">简答题</option>\n' +
                    '    </select>';
                saveData(index, field, value)
            } else if ("chosebutton" == field) {
                var subjecttype = row.subjecttype;
                if ( "选择题" != subjecttype) {
                    toastr.warning("只能给选择题增加选项")
                    return;
                }
                var subjectID = row.id;
                //alert("id:"+subjectID);
                /* var value = '<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">\n' +
                     '\t开始演示模态框\n' +
                     '</button>';*/
                <!--data-target="#modalTable"-->
                var vale = '<button type="button" class="btn btn-primary " data-toggle="modal" data-target="#modalTable" onclick="showOptionModel(' + index + ','+subjectID+');" data-subject="' + index + '"><i class="glyphicon glyphicon-plus"></i></button>'
                saveData(index, field, vale)
            } else if ("chosetype" == field) {
                var subjecttype = row.subjecttype
                console.log("题目类型" + subjecttype);
                if ("选择题" == subjecttype) {
                    var value = '<select class="form-control" data-rownum="' + index + '" onchange="selectChoseChange(this)">\n' +
                        '      <option value="0"></option>\n' +
                        '      <option value="单选">单选</option>\n' +
                        '      <option value="多选">多选</option>\n' +
                        '    </select>';
                    saveData(index, field, value)
                } else {
                    toastr.warning("该项只针对选择题！！");
                    return;
                }
            }
        }

        /**
         * 展示选项添加
         * @param index
         */
        function showOptionModel(index,subjectID) {
            subRum = index;
            //alert(subjectID);
            $('#modalTable').on('shown.bs.modal', function () {
                $table.bootstrapTable('resetView')
            })
            //编辑表格
            $table.bootstrapTable({
                //数据来源的网址
                url: 'getOptions',
                method: 'post',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//post请求需设置
                striped: true, //是否显示行间隔色
                pageNumber: 1, //初始化加载第一页
                pagination: true,//是否分页
                clickToSelect: true,
                pageSize: 8,//单页记录数
                paginationShowPageGo: true,
                showRefresh: true,//刷新按钮
                sidePagination: 'server',
                uniqueId: "id",
                columns: [[
                    {field: "rowNum", edit: false, title: "行号", align: "center", visible: false},
                    {field: "subopt", edit: false, title: "选项", align: "center"},
                    {field: "name", edit: true, title: "选项描述", align: "center",},
                    {field: "id", edit: true, title: "主键", align: "center", visible: false},
                    {field: "dr", edit: true, title: "逻辑", align: "center", visible: false},
                    {field: "subject", edit: true, title: "属于哪个题", align: "center", visible: false},
                    {field: "num", edit: true, title: "题号", align: "center", visible: true},
                ]],
                queryParams: function (params) {
                    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                    console.log(params)
                    var temp = {
                        limit: params.limit, // 每页显示数量
                        offset: params.offset, // SQL语句起始索引
                        page: (params.offset / params.limit) + 1,   //当前页码
                        subjectId:subjectID
                    };
                    console.log(temp);
                    return temp;
                },
                /**
                 * @param {点击列的 field 名称} field
                 * @param {点击列的 value 值} value
                 * @param {点击列的整行数据} row
                 * @param {td 元素} $element
                 */
                //onClickCell
                onDblClickCell: function (field, value, row, $element) {
                    console.log(row)
                    //获取index
                    var index = $element[0].parentElement.rowIndex;
                    //alert(index)
                    if ("name" == field) {//判断是否点击的是选项描述
                        $element.attr('contenteditable', true);
                        $element.attr('id', "option-name");
                        $element.blur(function () {
                            var vale = $("#option-name")[0].innerHTML;
                            console.log(vale);
                            $element.attr('id', "");
                            $element.attr('contenteditable', false);
                            saveOptionData(index,vale);
                        })
                    }
                },
            })
        }

        $('#addOptionRowbtn').click(function () {
            var length = $('#optionTable').bootstrapTable('getData').length;
            console.log("数据长度：" + length);
            if (length < 8) {
                //var data = {"option": '',"num":index,"rowNum":length+1,"option":choses[length]};
                var data = {"num": subRum, "rowNum": length + 1, "subopt": choses[length]};
                $('#optionTable').bootstrapTable('append', data);
            } else {
                toastr.warning("选项不能超过八项！！")
            }
        });
        $('#delOptionRowbtn').click(function () {
            var length = $('#optionTable').bootstrapTable('getData').length;
            if (length > 0) {//保留一行数据
                $('#optionTable').bootstrapTable('remove', {
                    field: 'rowNum',
                    values: [parseInt(length)]
                })
            }
        });//
        /**
         * 修改选项元素的值
         * @param index
         * @param field
         * @param value
         */
        function saveOptionData(index,value) {
            //alert(index)
            $table.bootstrapTable('updateCell', {
                index: index - 1,       //行索引
                field: "name",       //列名
                value: value        //cell值
            })
        }

        /**
         * 修改指定元素的值
         * @param index
         * @param field
         * @param value
         */
        function saveData(index, field, value) {
            $reportTable.bootstrapTable('updateCell', {
                index: index - 1,       //行索引
                field: field,       //列名
                value: value        //cell值
            })
        }
        //关闭选项弹框
        function choseOptionModel() {
            //alert("关闭选项弹框")
            //获取表格数据
            var datas = $('#optionTable').bootstrapTable('getData');
            if (datas.length > 0) {
                /*console.log("选项数据：" + datas[0]);
                console.log(datas);
                var cellvalue = JSON.stringify(datas);
                console.log("str:" + datas);*/
                //获取题题号
                var rowNum = datas[0].num;
                //alert(rowNum);
                //saveData(rowNum, "opdetail", cellvalue);
                    $reportTable.bootstrapTable('updateRow', {
                        index: rowNum-1,
                        row: {
                            opdetail: JSON.stringify(datas)
                        }
                    });
            } else {
                toastr.error("选项不能为空！！");
            }
            $('#optionTable').bootstrapTable('destroy');
        }
        function removeRow(row) {
            console.log(row);
        }

        function update() {
            var row = $reportTable.bootstrapTable('getSelections')
            console.log(row)
            location.href = "delete.action?uid=" + row.uid
            var row = $('#dg').datagrid('reload');
        }

        function sava() {
            var row = $reportTable.bootstrapTable('getSelections');
            if (row.length == 1) {
                console.log(a[0].id);
            } else {
                console.log(row.name);
                alert("请选中一行")
            }
        }
    </script>

</rapid:override>
<%@ include file="./../home/home.jsp" %>
