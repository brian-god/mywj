package com.hugo.controller;

import com.alibaba.fastjson.JSON;
import com.hugo.entity.User;
import com.hugo.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @Autowired
    private UserService userService;
    @GetMapping("/getUser")
    @ResponseBody
    public String getUserByID(){
        return  userService.getUserBuID(1);
    }

    @PostMapping("/login")
    @ResponseBody
    public String login(String username , String password, HttpServletRequest request){
        HttpSession session = request.getSession();
        if (StringUtils.isEmpty(username)){
            return "账号不能为空！！！";
        }else if (StringUtils.isEmpty(password)){

            return "密码不能为空！！！";
        }
        User user = userService.getUserByUsername(username);
        if (StringUtils.isEmpty(user)){
            return "账号密码错误！！！";
        }
        if(!password.equals(user.getPassword())){
            return "账号密码错误！！！";
        }
        session.setAttribute("username",user);
        return  JSON.toJSONString(user);
    }

    @PostMapping("/register")
    @ResponseBody
    public String register(String username , String password,String email, HttpServletRequest request){
        if (StringUtils.isEmpty(username)){
            return "用户名为空";
        }else if (StringUtils.isEmpty(password)){
            return "密码为空";
        }else if(StringUtils.isEmpty(email)){
            return "邮箱地址为空";
        }
        User user = userService.getUserByUsername(username);
        if(null != user){
            return "该用户名已经被使用";
        }
        Integer integer = userService.addUser(username, password, email);
        if (integer == -1){
            return "注册失败";
        }
        return "注册成功";
    }

}
