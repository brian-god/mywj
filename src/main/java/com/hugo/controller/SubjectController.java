package com.hugo.controller;

import com.hugo.entity.Subject;
import com.hugo.entity.User;
import com.hugo.services.SubjectService;
import com.hugo.utils.MywjUtils;
import com.hugo.utils.QAResult;
import com.hugo.utils.page.PageHelper;
import com.hugo.utils.page.childvo.SubjectPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lxs on 2019/4/11.
 */
@Controller
public class SubjectController {

    @Autowired
    private SubjectService subjectService;


    @PostMapping("/addSubject")
    @ResponseBody
    public QAResult addSubject(Subject subject){
        if (StringUtils.isEmpty(subject.getSubject())){
            return QAResult.build(400,"题目为空！！！");
        }
        return subjectService.addSubject(subject);
    }

    /**
     * 对问卷和明细进行操作
     * @param data
     * @param subID 问卷ID
     * @param operation 操作 delete--删除，save--保存
     * @return
     */
    @PostMapping("subjectAndOptionAction")
    @ResponseBody
    public QAResult subjectAndOptionAction(String data,String subID,String operation){
        System.out.print(operation);
        return subjectService.subjectAndOptionAction(data,subID,operation);
    }

    @PostMapping("getSubjectAndOption")
    @ResponseBody
    public PageHelper<Subject> getSubjectAndOption(HttpServletRequest httpServletRequest, SubjectPage subjectPage) {
        PageHelper<Subject> pageHelper = new PageHelper<Subject>();
        User user = MywjUtils.getLoginUser(httpServletRequest);
        subjectPage.setUserId(user.getId());
        pageHelper.setTotal(subjectService.getSubjectPageNum(subjectPage));
        pageHelper.setRows(subjectService.getSubject(subjectPage));
        return pageHelper;
    }
}
