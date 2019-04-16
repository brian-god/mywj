package com.hugo.repository.childRepository;

import com.hugo.entity.Questionnaire;
import com.hugo.repository.DomainRepository;
import com.hugo.utils.page.childvo.QuestionnairePage;

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
    /**
     * 返回对象集合数据
     * @param questionnairePage
     * @return
     */
    List<Questionnaire> getQuestionnaire(QuestionnairePage questionnairePage);

    /**
     * 返回数据总数
     * @param questionnairePage
     * @return
     */
    Integer getQuestionnaireNum(QuestionnairePage questionnairePage);

    /**
     * 修改数据
     * @param questionnaire
     * @return
     */
    void updateQt(Questionnaire questionnaire);
    /**
     * 批量xiugai
     * @param list
     */
    boolean updateQts(List<Questionnaire> list);

    Integer updateById(Integer id);
}
