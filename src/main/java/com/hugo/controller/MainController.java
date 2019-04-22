package com.hugo.controller;

import com.hugo.services.TestService;
import com.hugo.utils.QAResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ClassName: MainController
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/1$ 15:00$
 * @Version: 1.0
 */
@Controller
public class MainController {
    @Autowired
    private TestService test;
    @RequestMapping(value = "test", method = RequestMethod.GET)
    public String test(){
//        实际返回的是views/test.jsp ,spring-mvc.xml中配置过前后缀
        return "test";
    }
    @RequestMapping(value = "springtest", method = RequestMethod.GET)
    public String springTest(){
        return test.test();
    }

    /**
     * 登录页面
     * @return
     */
    @RequestMapping(value = "loginPage", method = RequestMethod.GET)
    public String Login(){
        return "login/login";
    }

    /**
     * 后台管理首页
     * @return
     */
    @RequestMapping(value = "home", method = RequestMethod.GET)
    public String home(){
        return "home/home";
    }

    /**
     * z注册
     * @return
     */
    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String register(){
        return "register/register";
    }

    /**
     * 提交问卷
     * @param data
     * @return
     */
    @RequestMapping("persionSubmitQt")
    @ResponseBody
    public QAResult submitQt(String data){
        return QAResult.ok();
    }
}
