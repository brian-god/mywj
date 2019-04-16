package com.hugo.controller;

import com.hugo.entity.Option;
import com.hugo.services.OptionService;
import com.hugo.utils.QAResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by lxs on 2019/4/16.
 */
@Controller
public class OptionController {

    @Autowired
    private OptionService optionService;


    @PostMapping("/getOptionBySubject")
    @ResponseBody
    public QAResult  getOptionBySubject(int subjectId){
        List<Option> optionBySubject = optionService.getOptionBySubject(subjectId);
        if (optionBySubject.size() > 0){
            return QAResult.build(200,"查询成功",optionBySubject);
        }
        return QAResult.build(400,"该题目没有答案");
    }


}
