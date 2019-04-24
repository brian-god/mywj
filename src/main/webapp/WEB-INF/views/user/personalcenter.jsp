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
        <div class="row personal-center-title-chard">
            <h3>个人资料</h3>
        </div>
        <div class="row  personal-center-page">
            <ul class="nav nav-tabs nav-justified">
                <li  class="active" id="nav-tab1"><a href="javascript:navTabClick(1);">基本资料</a></li>
                <li  id="nav-tab2"><a href="javascript:navTabClick(2);">更新资料</a></li>
                <li id="nav-tab3"><a href="javascript:navTabClick(3);" >修改密码</a></li>
            </ul>
        </div>
        <div class="row  personal-center-page" id="personal-center-page1">
            <ul class="list-group">
                <li class="list-group-item" style="text-align: center;padding-top: 30px;padding-bottom: 20px; ">
                    <div>
                        <img src="http://img5.imgtn.bdimg.com/it/u=3300305952,1328708913&fm=26&gp=0.jpg" class="img-circle" style="width: 110px;height: 90px">
                    </div>
                </li>
                <li class="list-group-item">
                    <div  class="user-details">
                        <div class="user-details-left">
                            昵称
                        </div>
                        <div class="user-details-right">
                            ${user.nickname}
                        </div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div  class="user-details">
                        <div class="user-details-left">
                            用户名
                        </div>
                        <div class="user-details-right">
                                ${user.username}
                        </div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div  class="user-details">
                        <div class="user-details-left">
                            邮箱
                        </div>
                        <div class="user-details-right">
                                ${user.email}
                        </div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div  class="user-details">
                        <div class="user-details-left">
                            手机号
                        </div>
                        <div class="user-details-right">
                                ${user.mobile}
                        </div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div  class="user-details">
                        <div class="user-details-left">
                            生日
                        </div>
                        <div class="user-details-right">
                                ${user.birthday}
                        </div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div  class="user-details">
                        <div class="user-details-left">
                            加入时间
                        </div>
                        <div class="user-details-right">
                                ${user.jointime}
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="row  personal-center-page" id="personal-center-page2" style="display: none">
            <div class="form ">
                <div class="col-md-6">
                    <form class="form-horizontal" role="form">  <
                        <div class="form-group">
                            <label for="inputPassword1" class="col-sm-2 control-label">头像</label>
                            <div class="col-sm-10" id="inputPassword1">
                                <img src="http://img5.imgtn.bdimg.com/it/u=3300305952,1328708913&fm=26&gp=0.jpg" class="img-circle" style="width: 110px;height: 90px">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword1" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword1" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword2" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword2" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword3" placeholder="请输入密码">
                            </div>
                        </div> <div class="form-group">
                        <label for="inputPassword4" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword4" placeholder="请输入密码">
                        </div>
                    </div>
                        <div class="form-group">
                            <label for="inputPassword5" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword5" placeholder="请输入密码">
                            </div>
                        </div> <div class="form-group">
                        <label for="inputPassword6" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword6" placeholder="请输入密码">
                        </div>
                    </div>
                        <div class="form-group col-md-offset-6">
                            <div class="row">
                                <button type="button" class="btn btn-success btn-lg btn-block" style="margin-top: 25px;padding: 0px;">确认</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row  personal-center-page" id="personal-center-page3" style="display: none">
            <div class="form row">
                <div class="form-horizontal col-md-offset-3" id="login_form">
                    <div class="col-md-6" style="margin-top: 80px;padding: 40px;background-color: #318f4596;">
                        <div class="form-group">
                            <div class="row">
                                <div  class="col-md-2">
                                    <i>密码</i>
                                </div>
                                <div class="col-md-8">
                                    <input class="form-control required" type="password" placeholder="请输入密码" id="password" name="password" autofocus="autofocus" maxlength="20" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 40px;">
                            <div class="row">
                                <div  class="col-md-2">
                                    <i>确认密码</i>
                                </div>
                                <div class="col-md-8">
                                    <input class="form-control required" type="password" placeholder="请确认密码" id="password1" name="password1" maxlength="8" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-offset-6">
                            <div class="row">
                                <button type="button" class="btn btn-success btn-lg btn-block" style="margin-top: 25px;padding: 0px;">确认</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</rapid:override>
<rapid:override name="pagescript">
    <script type="text/javascript">
        /**
         * 导航点击
         * @param value
         */
       function navTabClick(value){
           //基本资料
           var nav_tab1 = $("#nav-tab1");
           //更新资料
            var nav_tab2 = $("#nav-tab2");
            //修改密码
            var nav_tab3 = $("#nav-tab3");
            //基本资料页面
            var personal_center_page1 = $("#personal-center-page1");
            //更新资料页面
            var personal_center_page2 = $("#personal-center-page2");
            //修改密码页面
            var personal_center_page3 = $("#personal-center-page3");
            console.log(value);
            if(value ==1){
                nav_tab1.attr("class","active");
                nav_tab2.removeAttr("class");
                nav_tab3.removeAttr("class");
                personal_center_page1.css("display","");
                personal_center_page2.css("display","none");
                personal_center_page3.css("display","none");
            }else if(value ==2){
                nav_tab1.removeAttr("class");
                nav_tab2.attr("class","active");
                nav_tab3.removeAttr("class");
                personal_center_page1.css("display","none");
                personal_center_page2.css("display","");
                personal_center_page3.css("display","none");
            }else if(value ==3){
                nav_tab1.removeAttr("class");
                nav_tab2.removeAttr("class");
                nav_tab3.attr("class","active");
                personal_center_page1.css("display","none");
                personal_center_page2.css("display","none");
                personal_center_page3.css("display","");
            }
            return;
        }
    </script>
</rapid:override>
<%@ include file="./../home/home.jsp" %>
