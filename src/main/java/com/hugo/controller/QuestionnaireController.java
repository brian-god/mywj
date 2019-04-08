package com.hugo.controller;

import com.hugo.entity.User;
import com.hugo.services.QuestionnaireService;
import com.hugo.utils.QAResult;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

    /**
     * 问卷管理节点
     * @return
     */
    @GetMapping("qt-manage")
    @ResponseBody
    public ModelAndView qtManage(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user1 = (User) session.getAttribute("user");
        ModelAndView  modelAndView = new ModelAndView();
        QAResult qaResult = questionnaireService.getQuestionnaireByUser(user1.getId());
        modelAndView.addObject("qaResult",qaResult);
        modelAndView.setViewName("questionnaire/qtlist");
        return  modelAndView;
    }

}
