package com.hugo.controller;

import com.hugo.services.QuestionnaireService;
import com.hugo.utils.Page;
import com.hugo.utils.QAResult;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by lxs on 2019/4/4.
 */
@Controller
public class QuestionnaireController {

    private static Logger log = LogManager.getLogger(QuestionnaireController.class);

    @Autowired
    private QuestionnaireService questionnaireService;

    @GetMapping("/getQuestionnaireByUser")
    @ResponseBody
    public QAResult getQuestionnaireByUser(Integer userId, @RequestParam(value = "pageNum") Integer pageNum,
                                                        @RequestParam(value = "pageSize") Integer pageSize){
        Page page = new Page();
        page.setStart(page.getStartSize(pageNum, pageSize));
        page.setEnd(pageSize);
        QAResult qAResult = questionnaireService.getQuestionnaireByUser(userId, page);
        return QAResult.build(200,qAResult.getMsg(),qAResult);
    }

}
