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
                <li ><a href="javascript:navTabClick(this);">基本资料</a></li>
                <li class="active"><a href="#">更新资料</a></li>
                <li><a href="#">修改密码</a></li>
            </ul>
        </div>
        <div class="row  personal-center-page">
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
    </div>
</rapid:override>
<rapid:override name="pagescript">
    <script type="text/javascript">
        /**
         * 导航点击
         * @param value
         */
       function navTabClick(value){
            console.log(value);
        }
    </script>
</rapid:override>
<%@ include file="./../home/home.jsp" %>
