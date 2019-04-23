<%@ page import="com.hugo.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/1
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+
            request.getServerPort()+request.getContextPath()+"/";
    //获取用户
    User  user = (User)session.getAttribute("user");
%>
<rapid:override name="pagecss">
    <rapid:block name="childcss">
        <link rel="stylesheet" href="/css/my-index.css">
        <!--子页面的CSS-->
    </rapid:block>
</rapid:override>
<rapid:override name="content">
    <!-- /头部信息 -->
    <nav class="navbar navbar-default navbar-fixed-top navber-header">
        <div class="header-container">
            <div class="header-view">
                <div class="header-left-view"><img src="/img/logo.png"></div>
                <div class="header-right-view">
                    <div class="btn-group">
                        <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="img-circle headers-img-circle" src="/img/blog.jpeg" alt="头像"/>
                            <span class="user-name">${user.username}</span>
                        </a>
                        <!-- Single button -->
                        <ul class="dropdown-menu">
                            <li><a href="#">个人中心</a></li>
                            <li><a href="#">Another</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">退出</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="left" style="height: 100%;background-color: #00000040;">
            <div class="panel-heading">
                <a class="left-menu-item" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp&nbsp&nbsp&nbsp用户管理
                </a>
            </div>
            <div id="collapseOne" class="panel-collapse collapse">
                <div class="child-menu">
                    <a class="left-child-item" href="<%=basePath%>userList">用户管理</a>
                </div>
                <div class="child-menu">
                    <a class="left-child-item" href="<%=basePath%>personalCenter">个人中心</a>
                </div>
            </div>
            <div class="panel-heading">
                <a class="left-menu-item" data-toggle="collapse"data-parent="#accordion"href="#collapseTow">
                    <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>&nbsp&nbsp&nbsp&nbsp问卷管理</a>
            </div>
            <div id="collapseTow" class="panel-collapse collapse">
                <div class="child-menu">
                    <a class="left-child-item" href="#">收集问卷</a>
                </div>
                <div class="child-menu">
                    <a class="left-child-item" href="<%=basePath%>qt-manage">管理问卷</a>
                </div>
                <div class="child-menu">
                    <a class="left-child-item" href="#">回收问卷</a>
                </div>
            </div>
            <div class="panel-heading">
                <a class="left-menu-item" data-toggle="collapse"data-parent="#accordion"href="#collapseThree">
                    <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp&nbsp&nbsp&nbsp系统管理</a>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="child-menu">
                    <a class="left-child-item" href="#">操作日志</a>
                </div>
                <div class="child-menu">
                    <a class="left-child-item" href="#">增删改查</a>
                </div>
                <div class="child-menu">
                    <a class="left-child-item" href="#">系统维护</a>
                </div>
            </div>
        </div>
        <div class="center" style="background-color: #f5f5f5;">
            <rapid:block name="childconment">
                <!--子页面--->
                <div class="row" style="    margin-left: 6px;margin-right: 9px;padding-top: 6px;" >
                    <div class="col-xs-6 col-sm-3">
                        <div class="hundred-percent-col">
                            <div style="background-color: rgba(247,145,34,0.64);" class="home-col-title">
                                <p>问卷数量</p>
                            </div>
                            <div class="home-col-right">

                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-3">
                        <div class="hundred-percent-col">
                            <div style="background-color: rgba(66,247,50,0.7);" class="home-col-title">
                                <p>问卷数量</p>
                            </div>
                            <div class="home-col-right">

                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-3">
                        <div class="hundred-percent-col">
                            <div style="background-color: rgba(164,49,247,0.64);" class="home-col-title">
                                <p>待审核</p>
                            </div>
                            <div class="home-col-right">

                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-3">
                        <div class="hundred-percent-col">
                            <div style="background-color: rgba(78,166,247,0.75);" class="home-col-title">
                                <p>可汇总</p>
                            </div>
                            <div class="home-col-right">

                            </div>
                        </div>
                    </div>
                </div>
                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                <div id="myCarousel" class="carousel slide" style="height: 260px;margin: 20px">
                    <!-- 轮播（Carousel）指标 -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- 轮播（Carousel）项目 -->
                    <div class="carousel-inner" style="height: 260px;">
                        <div class="item active" style="height: 260px;">
                            <img src="/img/qont.jpeg" alt="First slide" style="height: 100%;width: 100%">
                            <div class="carousel-caption">问卷</div>
                        </div>
                        <div class="item" style="height: 260px;">
                            <img src="/img/sp.jpeg" alt="Second slide" style="height: 100%;width: 100%">
                            <div class="carousel-caption">审批</div>
                        </div>
                        <div class="item" style="height: 260px;">
                            <img src="/img/hz.jpeg" alt="Third slide" style="height: 100%;width: 100%">
                            <div class="carousel-caption">汇总</div>
                        </div>
                    </div>
                    <!-- 轮播（Carousel）导航 -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="row" style="margin-left: 13px;margin-right: 12px;padding-top: 50px" >
                    <div class="col-xs-12 col-sm-12">
                        <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                        <div id="echartsmain" style="height:400px"></div>
                    </div>
                </div>
            </rapid:block>
        </div>
    </div>
    </div>
</rapid:override>
<rapid:override name="pagescript">
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('echartsmain'));

        var option = {
            title : {
                text: '未来一周气温变化',
                subtext: '纯属虚构'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['最高气温','最低气温']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : ['周一','周二','周三','周四','周五','周六','周日']
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value} °C'
                    }
                }
            ],
            series : [
                {
                    name:'最高气温',
                    type:'line',
                    data:[11, 11, 15, 13, 12, 13, 10],
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                },
                {
                    name:'最低气温',
                    type:'line',
                    data:[1, -2, 2, 5, 3, 2, 0],
                    markPoint : {
                        data : [
                            {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name : '平均值'}
                        ]
                    }
                }
            ]
        };
        // 为echarts对象加载数据
        myChart.setOption(option);
    </script>
</rapid:override>
<%@ include file="./../communal/sys_template.jsp" %>
