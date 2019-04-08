package com.hugo.repository.childRepository;

import com.hugo.entity.Questionnaire;
import com.hugo.repository.DomainRepository;

import java.util.List;
import java.util.Map;

/**
 * Created by lxs on 2019/4/4.
 */
public interface QuestionnaireRepository extends DomainRepository<Questionnaire,Integer> {

    /**
     * 返回map数据
     * @param userid
     * @return
     */
    List<Map<String,Object>> getQuestionnaireByiUserIdResMap(Integer userid);
}
