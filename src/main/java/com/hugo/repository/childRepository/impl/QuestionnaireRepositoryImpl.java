package com.hugo.repository.childRepository.impl;

import com.hugo.entity.Questionnaire;
import com.hugo.repository.childRepository.QuestionnaireRepository;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.transform.ResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by lxs on 2019/4/4.
 */
@Repository
public class QuestionnaireRepositoryImpl implements QuestionnaireRepository {
    //注入session工厂
    @Autowired
    private SessionFactory sessionFactory;

    /**
     * 打开session
     * @return
     */
    private Session getCurrentSession() {
        return this.sessionFactory.openSession();
    }

    @Override
    public Questionnaire load(Integer id) {
        return null;
    }

    @Override
    public Questionnaire get(Integer id) {
        return null;
    }

    @Override
    public List<Questionnaire> findAll() {
        return null;
    }

    @Override
    public void persist(Questionnaire entity) {

    }

    @Override
    public Integer save(Questionnaire entity) {
        return null;
    }

    @Override
    public void saveOrUpdate(Questionnaire entity) {

    }

    @Override
    public void delete(Integer id) {

    }

    @Override
    public void flush() {

    }
    /**
     * 返回map数据
     * @param userid
     * @return
     */

    @Override
    public List<Map<String,Object>> getQuestionnaireByiUserIdResMap(Integer userid){
        String  sql = "SELECT * FROM fa_questionnaire WHERE user = "+userid+" and dr = 0 ";
        Session   session =  sessionFactory.openSession();
        SQLQuery  sqlQuery =  session.createSQLQuery(sql);
        sqlQuery.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);//返回map数据
        Object questionnaireLists = sqlQuery.list();
        List<Map<String,Object>> qts = (List<Map<String,Object>>)questionnaireLists;
        return qts;
    }
}
