package com.hugo.controller;

import com.hugo.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    @RequestMapping(value = "loginPage", method = RequestMethod.GET)
    public String Login(){
        return "login/login";
    }
    @RequestMapping(value = "home", method = RequestMethod.GET)
    public String home(){
        return "home/home";
    }
}
