package com.hugo.repository.childRepository;

import com.hugo.entity.Questionnaire;
import com.hugo.repository.DomainRepository;

import java.util.List;

/**
 * Created by lxs on 2019/4/4.
 */
public interface QuestionnaireRepository extends DomainRepository<Questionnaire,Integer> {
    /**
     *
     * @param userid
     * @return
     */
    List<Questionnaire> getQuestionnaireByiUserId(Integer userid);
}
