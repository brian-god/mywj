package com.hugo.repository.childRepository.impl;

import com.hugo.entity.Questionnaire;
import com.hugo.repository.childRepository.QuestionnaireRepository;
import com.hugo.utils.Page;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lxs on 2019/4/4.
 */
@Repository
public class QuestionnaireRepositoryImpl implements QuestionnaireRepository {

    //注入session工厂
    @Autowired
    private SessionFactory sessionFactory;

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


    @Override
    public List<Questionnaire> getQuestionnaireByUser(int userId, Page page) {
        String  sql = "SELECT  * from fa_questionnaire where user = ? ORDER BY updatetime DESC";
        Session currentSession = sessionFactory.openSession();
        SQLQuery query = currentSession.createSQLQuery(sql);
        query.setInteger(1,userId);
        query.setFirstResult(page.getStart());
        query.setMaxResults(page.getEnd());
        query.addEntity(Questionnaire.class);
        List<Questionnaire> list = query.list();
        return list;
    }
}
