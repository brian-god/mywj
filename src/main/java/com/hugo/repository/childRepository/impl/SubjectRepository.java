package com.hugo.repository.childRepository.impl;

import com.hugo.entity.Subject;
import com.hugo.utils.page.childvo.SubjectPage;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: SubjectRepository
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/11$ 9:53$
 * @Version: 1.0
 */
@Repository
public class SubjectRepository implements com.hugo.repository.childRepository.SubjectRepository {
    //注入session工厂
    @Autowired
    private SessionFactory sessionFactory;

    /**
     * 打开session
     *
     * @return
     */
    private Session getCurrentSession() {
        return this.sessionFactory.openSession();
    }

    @Override
    public Subject load(Integer id) {
        return null;
    }

    @Override
    public Subject get(Integer id) {
        return null;
    }

    @Override
    public List<Subject> findAll() {
        return null;
    }

    @Override
    public void persist(Subject entity) {

    }

    @Override
    public Integer save(Subject entity) {
        return (Integer)getCurrentSession().save(entity);
    }

    @Override
    public void saveOrUpdate(Subject entity) {

    }

    @Override
    public void delete(Integer id) {

    }

    @Override
    public void flush() {

    }

    @Override
    public List<Subject> getSubjectAndOption(int questionnaireId) {
        String sql = "select * from fa_subject  where questionnaire = "+questionnaireId+ "";
        Session session = sessionFactory.getCurrentSession();
        SQLQuery query = session.createSQLQuery(sql);
        query.addEntity(Subject.class);
        List<Subject> subject = query.list();
        session.clear();
        return subject;
    }

    @Override
    public Integer getSubjectNum(SubjectPage subjectPage) {
        String sql = "SELECT count(user) FROM fa_subject WHERE  dr = 0 ";
        SQLQuery sqlQuery = getSqlQuery(sql,subjectPage,false);
        sqlQuery.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);//返回map数据
        Object questionnaireLists = sqlQuery.list();
        List<Map<String, Object>> qts = (List<Map<String, Object>>) questionnaireLists;
        String count = qts.get(0).get("count(user)").toString();
        return Integer.valueOf(count);
    }

    @Override
    public List<Subject> getSubject(SubjectPage subjectPage) {
        String sql = "SELECT * FROM fa_subject WHERE dr = 0 ";
        SQLQuery sqlQuery = getSqlQuery(sql,subjectPage,true);
        sqlQuery.addEntity(Subject.class);
        Object sub = sqlQuery.list();
        List<Subject> subjects = (List<Subject>) sub;
        return subjects;
    }

    /**
     * 查询SQL拼接
     * @param oldsql
     * @param subjectPage
     * @param ispage 是否分页
     * @return
     */
    private SQLQuery getSqlQuery(String oldsql,SubjectPage subjectPage,boolean ispage){
        StringBuffer sql = new StringBuffer(oldsql);
        if(ispage) {
            if (0 != subjectPage.getLimit()) {
                //分页查询
                sql.append("  LIMIT " + subjectPage.getOffset() + "," + subjectPage.getLimit());
            }
        }
        Session session = sessionFactory.openSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql.toString());
        return  sqlQuery;
    }
}
