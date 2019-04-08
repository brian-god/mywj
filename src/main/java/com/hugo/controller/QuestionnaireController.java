package com.hugo.controller;

import com.hugo.entity.User;
import com.hugo.services.QuestionnaireService;
import com.hugo.utils.QAResult;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by lxs on 2019/4/4.
 */
@Controller
public class QuestionnaireController {

    private static Logger log = LogManager.getLogger(QuestionnaireController.class);

    @Autowired
    private QuestionnaireService questionnaireService;

    public QAResult getQuestionnaireByUser(int id){

        return QAResult.build(200,"");
    }
    @GetMapping("qt-manage")
    public ModelAndView Qtmanage(HttpServletRequest request){
        HttpSession  session =  request.getSession();
        Object object =  session.getAttribute("user");
        User  user = (User) object;
        QAResult  qaResult = questionnaireService.getQuestionnaireByUser(user.getId());
        ModelAndView  modelAndView =   new ModelAndView();
        modelAndView.setViewName("questionnaire/qtlist");
        modelAndView.addObject("qaResult",qaResult);
        return modelAndView;
    }

}
