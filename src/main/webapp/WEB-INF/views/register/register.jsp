<%--
  Created by IntelliJ IDEA.
  User: Txk
  Date: 2019/4/2
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 头部信息 -->
<%@ include file="./../communal/publicCss.jsp" %>
<div class="container-fluid" style="background-color: #1b248529;padding-top: 20px">
    <div class="row">
        <div class="col-md-4" style="background-color: #1c7430"></div>
        <div class="col-md-4  container-min" style="background-color: #eee">
            <h4 style="margin-bottom: 60px;">新用户注册</h4>
            <form id="defaultForm" method="post" class="form-horizontal user-form" >
                <div class="form-group">
                    <label class="col-lg-3 control-label">姓名</label>
                    <div class="col-lg-8">
                        <input type="text" class="form-control" name="nickname" placeholder="请输入姓名" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">用户名</label>
                    <div class="col-lg-8">
                        <input type="text" class="form-control" name="username" placeholder="请输入用户名" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">密码</label>
                    <div class="col-lg-8">
                        <input type="password" class="form-control" name="password" placeholder="请输入密码" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">确认密码</label>
                    <div class="col-lg-8">
                        <input type="password1" class="form-control" name="password1"  placeholder="请再次输入密码"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">邮箱</label>
                    <div class="col-lg-8">
                        <input type="text" class="form-control" name="email" placeholder="请输入邮箱"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">手机号</label>
                    <div class="col-lg-8">
                        <input type="text" class="form-control" name="mobile" placeholder="请输入手机号"  maxlength="11" type="text"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">生日</label>
                    <div class="col-lg-8">
                        <input type="date"  id="data1" class="form-control" name="birthday"  />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">性别</label>
                    <div class="col-lg-8">
                        <div class="radio">
                            <label>
                                <input type="radio" name="gender" id="optionsRadios1" value="0" checked> 男
                            </label>
                            <label>
                                <input type="radio" name="gender" id="optionsRadios2" value="1">女
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input class="form-control btn btn-primary" id="submit"
                           value="立&nbsp;&nbsp;即&nbsp;&nbsp;注&nbsp;&nbsp;册" type="submit" name="submit">
                </div>

                <div class="form-group">
                    <input value="重置" id="reset" class="form-control btn btn-danger" type="reset">
                </div>
            </form>
        </div>
        <div class="col-md-4" style="background-color: salmon"></div>
    </div>
</div>
</body>
<script src="/js/jQuery/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="/js/custom/user-min.js"></script>
<script src="/js/laydate/laydate.js"></script>
<script type="text/javascript">
    $(function () {
        //执行一个laydate实例
        laydate.render({
            elem: '#date1', //指定元素
            format:'yyyy-MM-dd'
        })
        FormValidation();
    });
</script>
</html>
