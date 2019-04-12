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
    </div>
</rapid:override>
<rapid:override name="pagescript">
    <script src='/js/bootstrap-table/bootstrap-table.min.js'></script>
    <script src='/js/bootstrap-table/bootstrap-table-zh-CN.min.js'></script>
    <script type="text/javascript">
        /*$(function () {
            initToastr();
            $('#mytab').bootstrapTable({
                url: "subject",//请求路径
                method: 'post',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//post请求需设置
                striped: true, //是否显示行间隔色
                pageNumber: 1, //初始化加载第一页
                pagination: true,//是否分页
                clickToSelect: true,
                pageSize: 3,//单页记录数
                paginationShowPageGo: true,
                pageList: [5, 10, 20, 30],//可选择单页记录数
                showRefresh: true,//刷新按钮
                sidePagination: 'server',
                uniqueId: "id",
                queryParams: function (params) {
                    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                    var temp = {
                        limit: params.limit, // 每页显示数量
                        offset: params.offset, // SQL语句起始索引
                        page: (params.offset / params.limit) + 1,   //当前页码
                        qtId: questionnaire.number,//问卷编号
                    };
                    return temp;
                },
                columns: [
                    {
                        checkbox: true,
                        visible: true                  //是否显示复选框
                    },
                    {
                        title: '题号',
                        field: 'num',
                        align: 'center'
                    },
                    {
                        title: '题目',
                        field: 'subject',
                        align: 'center'
                    },
                    {
                        title: '题目类型',
                        field: 'subjecttype',
                        align: 'center'
                    },
                    {
                        title: '选项类型',
                        field: 'chosetype',
                        align: 'center',
                        /!*  formatter: function (value, row, index) {
                              return '<a href="#" target="_black" >' + value + '</a>'
                          }*!/
                    }
                ]
            })
        })*/
        $(function () {
            //编辑表格
            $('#reportTable').bootstrapTable({
                //数据来源的网址
                url: '/index.xhtml',
                method: 'post',
                editable: true,//开启编辑模式
                clickToSelect: true,
                showPaginationSwitch: true, //显示分页切换按钮
                search: true,  //显示检索框
                showRefresh: true,  //显示刷新按钮
                showToggle: true, //显示切换按钮来切换列表/卡片视图
                pagination: true,
                pageList: [5, 25],
                pageSize: 5,
                pageNumber: 1,
                columns: [[
                    {field: "num", edit: false, title: "编号", align: "center"},
                    {field: "subject", edit: true, title: "题目", align: "center",},
                    {field: "subjecttype", edit: true, title: "题目类型", align: "center"
                    },
                    {field: "chosetype", edit: true, title: "选项", align: "center"},
                ]],
                /**
                 * @param {点击列的 field 名称} field
                 * @param {点击列的 value 值} value
                 * @param {点击列的整行数据} row
                 * @param {td 元素} $element
                 */
                //onClickCell
                onDblClickCell:function(field, value, row, $element){
                    cellOnClocke(field, value, row, $element);
                }
            });
            $('#addRowbtn').click(function () {
                var length = $('#reportTable').bootstrapTable('getData').length;
                var data = {"num": length + 1, "subjecttype": '', "subject": '', "chosetype": ''};
                $('#reportTable').bootstrapTable('append', data);
            });
            $('#delRowbtn').click(function () {
                var length = $('#reportTable').bootstrapTable('getData').length;
                if (length > 0) {//保留一行数据
                    $('#reportTable').bootstrapTable('remove', {
                        field: 'num',
                        values: [parseInt(length)]
                    })
                }
            });
            $('sava').onClickCell(function () {

            });
            $("[data-toggle='popover']").popover();
        });
        //按钮点击事件but按钮本身,index编号
        var btclock = function (but) {
            console.log(but);
            var index = but.id.split("-")[2]; //字符分割
            var value = '<select class="form-control" data-rownum="'+index+'" onchange="selectChange(this)">\n' +
                '      <option value="0"></option>\n' +
                '      <option value="选择题">选择题</option>\n' +
                '      <option value="选择题">填空题</option>\n' +
                '      <option value="选择题">简答题</option>\n' +
                '    </select>';
                saveData(index, "subjecttype", value)
        }
        function selectChange(select) {
            var index = select.getAttribute("data-rownum");
            var value =  select.options[select.selectedIndex].value
            saveData(index, "subjecttype", value)
        }
        /**
         * 单元格点击触发
         * @param field
         * @param value
         * @param row
         * @param $element
         */
        function cellOnClocke(field, value, row, $element) {
            var index = row.num;
            if ("subject" == field) {
                $element.attr('contenteditable', true);
                $element.attr('id', field);
                $element.blur(function () {
                    var elid = "#" + field;
                    var vale = $(elid)[0].innerHTML;
                    console.log(vale);
                    $element.attr('id', "");
                    $element.attr('contenteditable', false);
                    var tdValue = $element.html();
                    saveData(index, field, vale)
                })
            }else if("subjecttype" == field){//题目类型
                //var vale ='<button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-zoom-in"></i></button>';
                var vale ='<button type="button" class="btn btn-primary " id="cell-but-'+index+'" onclick="btclock(this)"><i class="glyphicon glyphicon-zoom-in"></i></button>';
                saveData(index, field, vale)
            }else if("chosetype" == field){
                var subjecttype = row.subjecttype;
                if(null==subjecttype||""==subjecttype){
                    alert("只能给选择题增加选项")
                    return;
                }
            }
        }

        /**
         * 修改指定元素的值
         * @param index
         * @param field
         * @param value
         */
        function saveData(index, field, value) {
            $('#reportTable').bootstrapTable('updateCell', {
                index: index - 1,       //行索引
                field: field,       //列名
                value: value        //cell值
            })
        }

        function removeRow(row) {
            console.log(row);
        }

        function update() {
            var row = $('#reportTable').bootstrapTable('getSelections')
            console.log(row)
            location.href = "delete.action?uid=" + row.uid
            var row = $('#dg').datagrid('reload');
        }

        function sava() {
            var row = $('#reportTable').bootstrapTable('getSelections');
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
