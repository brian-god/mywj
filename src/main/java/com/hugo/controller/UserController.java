package com.hugo.controller;

import com.alibaba.fastjson.JSONObject;
import com.hugo.entity.User;
import com.hugo.services.UserService;
import com.hugo.utils.QAResult;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * 用户控制类
 * @ClassName: UserController
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/1$ 16:02$
 * @Version: 1.0
 */
@Controller
public class UserController {
    private static Logger log = LogManager.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @GetMapping("/getUser")
    @ResponseBody
    public String getUserByID(){
        return  userService.getUserBuID(1);
    }

    @PostMapping("/login")
    @ResponseBody
    public ModelAndView login(HttpServletRequest request){
        HttpSession session = request.getSession();
        //创建一个数据模型
        ModelAndView modelAndView = new ModelAndView();
        //获取登陆验证
        String email = request.getParameter("email");
        //获取密码
        String password = request.getParameter("password");
        //给定默认视图
        modelAndView.setViewName("login/login");
        if(StringUtils.isEmpty(email)){
            modelAndView.addObject("responseData",QAResult.build(400,"请输入账号"));
        }else if(StringUtils.isEmpty(password)){
            modelAndView.addObject("responseData",QAResult.build(400,"请输入密码"));
        }
        QAResult login = userService.login(email,password);
        if (login != null && login.getStatus()==200 && login.getData()!=null) {
            User user = (User) login.getData();
            System.out.print("user===================" + user + "\n");
            session.setAttribute("user",user);
            User user1 = (User) session.getAttribute("user");
            System.out.print("getPassword===================" + user1.getPassword());
            modelAndView.setViewName("home/home");
            modelAndView.addObject("responseData",login);
        }else{
            modelAndView.addObject("responseData",QAResult.build(400,"请检查账号密码是否正确!"));
        }
        return modelAndView ;
    }

    @PostMapping("/register")
    @ResponseBody
    public ModelAndView register(User user){
        //创建一个数据模型
        ModelAndView modelAndView = new ModelAndView();
        //获取登陆验证
        String username = user.getUsername();
        //获取密码
        String password = user.getPassword();
        //获取邮箱
        String email = user.getEmail();
        //获取手机号码
        String mobile = user.getMobile();
        //给定默认视图
        modelAndView.setViewName("register/register");
        if (StringUtils.isEmpty(username)){
            modelAndView.addObject("responseData", QAResult.build(400,"用户名为空！！！"));
        }else if (StringUtils.isEmpty(password)){
            modelAndView.addObject("responseData", QAResult.build(400,"密码为空！！！"));
        }else if(StringUtils.isEmpty(email)){
            modelAndView.addObject("responseData", QAResult.build(400,"邮箱地址为空！！！"));
        }else if(StringUtils.isEmpty(mobile)){
            modelAndView.addObject("responseData", QAResult.build(400,"手机号码为空！！！"));
        }
/*        QAResult register = userService.register(username,email,mobile);
        if(register.getStatus() != 200){
            modelAndView.addObject("responseData",register.getMsg());
            modelAndView.setViewName("login/login");
        }*/
        QAResult qaResult = userService.addUser(user);
        if (qaResult.getStatus() == 200){
            modelAndView.addObject("responseData", QAResult.build(200,"注册成功,请登录"));
            modelAndView.setViewName("login/login");
        }else {
            modelAndView.addObject("responseData",  QAResult.build(400,"注册失败"));
        }
        return  modelAndView;
    }

    @PostMapping(value = "checkMsg")
    @ResponseBody
    public String checkMsg(@RequestBody String data){
        String username = null;
        String email = null;
        String mobile = null;
        String[] datas = data.split("=");
        if("username".equals(datas[0])){
            username = datas[1];
        }else if("email".equals(datas[0])){
            email = datas[1];
        }else if("mobile".equals(datas[0])){
            mobile = datas[1];
        }
        //返回数据
        JSONObject jsonObject = new JSONObject();
        jsonObject.fluentPut("valid",true);
        QAResult  qaResult = userService.register(username,email,mobile);
        if (qaResult.getStatus() == 400){
            jsonObject.fluentPut("valid",false);
        }
        return jsonObject.toJSONString();
    }

}
