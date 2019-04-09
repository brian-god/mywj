package com.hugo.controller;

import com.hugo.entity.Questionnaire;
import com.hugo.entity.User;
import com.hugo.services.QuestionnaireService;
import com.hugo.utils.MywjUtils;
import com.hugo.utils.QAResult;
import com.hugo.utils.page.PageHelper;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by lxs on 2019/4/4.
 */
@Controller
public class QuestionnaireController {

    private static Logger log = LogManager.getLogger(QuestionnaireController.class);

    @Autowired
    private QuestionnaireService questionnaireService;

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
     */
    @PostMapping("paged-ata")
    @ResponseBody
    public PageHelper<Questionnaire> qtManage(HttpServletRequest request , Questionnaire questionnaire) {
        User user = MywjUtils.getLoginUser(request);
        /*List<Map<String, Object>> list = questionnaireService.getPageQuestionnaireByUserResMap(user.getId());//根据业务查询库中数据
        return list;*/
        questionnaire.setUserId(user.getId());
        PageHelper<Questionnaire> pageHelper = new PageHelper<Questionnaire>();
        // 统计总记录数;
        pageHelper.setTotal(questionnaireService.getQuestionnaireNum(questionnaire));
        // 查询当前页实体对象
        List<Questionnaire> list = questionnaireService.getQuestionnaire(questionnaire);
        pageHelper.setRows(list);
        return pageHelper;
    }

    @PostMapping("addQtManage")
    @ResponseBody
    public ModelAndView addQtManage(HttpServletRequest request, Questionnaire questionnaire){
        User user = MywjUtils.getLoginUser(request);
        //创建一个数据模型
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("");//添加页面
        String name = questionnaire.getName();
        if (StringUtils.isEmpty(name)){
            modelAndView.addObject("responseData", QAResult.build(400,"问卷名称为空！！！"));
        }
        QAResult qaResult = questionnaireService.addQtManage(questionnaire, user.getId(), user.getUsername());
        if (qaResult.getStatus() == 200){
            modelAndView.addObject("responseData", QAResult.build(200,"添加成功"));
            modelAndView.setViewName("questionnaire/qtlist");
        }
        modelAndView.addObject("responseData",  QAResult.build(400,"添加失败"));
        return modelAndView;
    }
}
