package com.hugo.repository.childRepository;

import com.hugo.entity.Questionnaire;
import com.hugo.repository.DomainRepository;
import com.hugo.utils.Page;

import java.util.List;

/**
 * Created by lxs on 2019/4/4.
 */
public interface QuestionnaireRepository extends DomainRepository<Questionnaire,Integer> {
    List<Questionnaire> getQuestionnaireByUser(int userId, Page page);
}
