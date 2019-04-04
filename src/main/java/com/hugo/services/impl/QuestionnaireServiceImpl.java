package com.hugo.services.impl;

import com.hugo.repository.childRepository.QuestionnaireRepository;
import com.hugo.services.QuestionnaireService;
import com.hugo.utils.QAResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lxs on 2019/4/4.
 */
@Service
public class QuestionnaireServiceImpl implements QuestionnaireService {
    @Autowired
    private QuestionnaireRepository questionnaireRepository;

    @Override
    public QAResult getQuestionnaireByUser(int id) {

        return null;
    }
}
