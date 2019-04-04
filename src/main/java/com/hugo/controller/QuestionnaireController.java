package com.hugo.controller;

import com.hugo.services.QuestionnaireService;
import com.hugo.utils.QAResult;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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

}
