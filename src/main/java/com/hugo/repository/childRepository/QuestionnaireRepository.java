package com.hugo.repository.childRepository;

import com.hugo.entity.Questionnaire;
import com.hugo.repository.DomainRepository;

import java.util.List;

/**
 * Created by lxs on 2019/4/4.
 */
public interface QuestionnaireRepository extends DomainRepository<Questionnaire,Integer> {
    /**
     * 查询用户的问卷
     * @param userid
     * @return
     */
    List<Questionnaire> getQuestionnaireByiUserId(Integer userid);
}
