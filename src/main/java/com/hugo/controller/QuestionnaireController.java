package com.hugo.controller;

import com.hugo.entity.User;
import com.hugo.services.QuestionnaireService;
import com.hugo.utils.MywjUtils;
import com.hugo.utils.QAResult;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

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
        ModelAndView  modelAndView = new ModelAndView();
        modelAndView.setViewName("questionnaire/qtlist");
        return  modelAndView;
    }

    /**
     * 请求数据
     * @param request
     * @param ksrq
     * @param jsrq
     * @return
     */
    @PostMapping("paged-ata")
    @ResponseBody
    public List<Map<String, Object>> qtManage(HttpServletRequest request ,@RequestParam String ksrq, @RequestParam String jsrq) {
        User user = MywjUtils.getLoginUser(request);
        List<Map<String, Object>> list = questionnaireService.getPageQuestionnaireByUserResMap(user.getId());//根据业务查询库中数据
        return list;
    }
}
