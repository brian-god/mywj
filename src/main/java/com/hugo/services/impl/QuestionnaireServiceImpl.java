package com.hugo.services.impl;

import com.hugo.entity.Questionnaire;
import com.hugo.repository.childRepository.QuestionnaireRepository;
import com.hugo.services.QuestionnaireService;
import com.hugo.utils.Page;
import com.hugo.utils.QAResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lxs on 2019/4/4.
 */
@Service
public class QuestionnaireServiceImpl implements QuestionnaireService {
    @Autowired
    private QuestionnaireRepository questionnaireRepository;

    @Override
    public QAResult getQuestionnaireByUser(int id, Page page) {
        List<Questionnaire> list = questionnaireRepository.getQuestionnaireByUser(id, page);
        if (list.size()  == 0){
            return QAResult.build(400,"未查询到信息");
        }
        return QAResult.build(200,"查询成功",list);
    }
}
