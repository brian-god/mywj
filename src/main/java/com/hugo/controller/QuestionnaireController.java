package com.hugo.controller;

import com.hugo.entity.Questionnaire;
import com.hugo.entity.Subject;
import com.hugo.entity.User;
import com.hugo.myenum.ChoiceType;
import com.hugo.myenum.ProblemType;
import com.hugo.services.QuestionnaireService;
import com.hugo.services.SubjectService;
import com.hugo.utils.MywjUtils;
import com.hugo.utils.QAResult;
import com.hugo.utils.page.PageHelper;
import com.hugo.utils.page.childvo.QuestionnairePage;
import com.hugo.utils.page.childvo.SubjectPage;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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

    @Autowired
    private SubjectService subjectService;
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
    public PageHelper<Questionnaire> qtManage(HttpServletRequest request , QuestionnairePage questionnairePage) {
        User user = MywjUtils.getLoginUser(request);
        /*List<Map<String, Object>> list = questionnaireService.getPageQuestionnaireByUserResMap(user.getId());//根据业务查询库中数据
        return list;*/
        questionnairePage.setUserId(user.getId());
        PageHelper<Questionnaire> pageHelper = new PageHelper<Questionnaire>();
        // 统计总记录数;
        pageHelper.setTotal(questionnaireService.getQuestionnaireNum(questionnairePage));
        // 查询当前页实体对象
        List<Questionnaire> list = questionnaireService.getQuestionnaire(questionnairePage);
        pageHelper.setRows(list);
        return pageHelper;
    }

    /**
     * 删除数据
     * @param data
     * @return
     */
    @PostMapping("deleteQtManage")
    @ResponseBody
    public QAResult deleteQtManage(String data){
        return questionnaireService.deleteQt(data);
    }
    /**
     * 提交数据
     * @param data
     * @return
     */
    @PostMapping("submissionQTManage")
    @ResponseBody
    public QAResult submissionQTManage(String data){
        return questionnaireService.submissionQT(data);
    }
    /**
     * 审批数据
     * @param data
     * @return
     */
    @PostMapping("approvalQtManage")
    @ResponseBody
    public QAResult approvalQtManage(String data){
        return questionnaireService.approvalQt(data);
    }

    @PostMapping("addQtManage")
    @ResponseBody
    public QAResult addQtManage(HttpServletRequest request, Questionnaire questionnaire){
        User user = MywjUtils.getLoginUser(request);
        String name = questionnaire.getName();
        if (StringUtils.isEmpty(name)){
           return QAResult.build(400,"问卷名称为空！！！");
        }
        QAResult qaResult = questionnaireService.addQtManage(questionnaire, user.getId(), user.getUsername());
        return qaResult;
    }

    /**
     * 进入问卷详情的编辑页面
     * @param questionnaire
     * @return
     */
    @RequestMapping("tobill")
    @ResponseBody
    public ModelAndView toQTBillDatill(Questionnaire questionnaire){
        ModelAndView  modelAndView = new ModelAndView();
        modelAndView.addObject("row",questionnaire);
        modelAndView.addObject("ProblemType",ProblemType.values());
        modelAndView.addObject("ChoiceType",ChoiceType.values());
        modelAndView.setViewName("questionnaire/qtbilldatil");
        return  modelAndView;
    }
    @PostMapping("subject")
    public  PageHelper<Subject> subject( HttpServletRequest request, SubjectPage subjectPage){
        System.out.print(subjectPage.getQtId());
        return null;
    }

    /**
     * 问卷展示
     * @param request
     * @param qtid
     * @param isedit 预览或者编辑
     * @return
     */
    @RequestMapping("showQuestionnaire")
    @ResponseBody
    public ModelAndView showQuestionnaire(HttpServletRequest request, @RequestParam("qtid") String qtid,@RequestParam("isedit") boolean isedit){
        ModelAndView  modelAndView = new ModelAndView();
        modelAndView.addObject("isedit",isedit);//是否填写
        Questionnaire questionnaire =  questionnaireService.getQtById(Integer.valueOf(qtid));
        modelAndView.addObject("questionnaire",questionnaire);//问卷信息
        Map<String,List<Subject>> subjihe = subjectService.getSubjectAndOption(Integer.valueOf(qtid));
        modelAndView.addObject("subjihe",subjihe);//问卷信息
        modelAndView.setViewName("questionnaire/qtdisplay");
        return modelAndView;
    }
}
