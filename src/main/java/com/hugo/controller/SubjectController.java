package com.hugo.controller;

import com.hugo.entity.Subject;
import com.hugo.services.SubjectService;
import com.hugo.utils.QAResult;
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
    @PostMapping("addSubjectAndOption")
    @ResponseBody
    public QAResult addSubjectAndOption(String data,String subID){
        return subjectService.addSubjectAndOption(data,subID);
    }
}
