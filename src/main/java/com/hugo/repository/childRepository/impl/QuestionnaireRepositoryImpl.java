package com.hugo.repository.childRepository.impl;

import com.hugo.entity.Questionnaire;
import com.hugo.repository.childRepository.QuestionnaireRepository;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
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
     *
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
        return (Integer)getCurrentSession().save(entity);
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
     *
     * @param userid
     * @return
     */

    @Override
    public List<Map<String, Object>> getQuestionnaireByiUserIdResMap(Integer userid) {
        String sql = "SELECT * FROM fa_questionnaire WHERE user = " + userid + " and dr = 0 ";
        Session session = sessionFactory.openSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql);
        sqlQuery.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);//返回map数据
        Object questionnaireLists = sqlQuery.list();
        List<Map<String, Object>> qts = (List<Map<String, Object>>) questionnaireLists;
        return qts;
    }

    /**
     * 分页加条件查询
     *
     * @param questionnaire
     * @return
     */
    @Override
    public List<Questionnaire> getQuestionnaire(Questionnaire questionnaire) {
        String sql = "SELECT * FROM fa_questionnaire WHERE dr = 0 ";
        SQLQuery sqlQuery = getSqlQuery(sql,questionnaire,true);
        sqlQuery.addEntity(Questionnaire.class);
        Object questionnaireLists = sqlQuery.list();
        List<Questionnaire> qts = (List<Questionnaire>) questionnaireLists;
        return qts;
    }

    /**
     * 返回数量
     *
     * @param questionnaire
     * @return
     */
    @Override
    public Integer getQuestionnaireNum(Questionnaire questionnaire) {
        String sql = "SELECT count(user) FROM fa_questionnaire WHERE  dr = 0 ";
        SQLQuery sqlQuery = getSqlQuery(sql,questionnaire,false);
        sqlQuery.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);//返回map数据
        Object questionnaireLists = sqlQuery.list();
        List<Map<String, Object>> qts = (List<Map<String, Object>>) questionnaireLists;
        String count = qts.get(0).get("count(user)").toString();
        return Integer.valueOf(count);
    }

    /**
     * 查询SQL拼接
     * @param oldsql
     * @param questionnaire
     * @param ispage 是否分页
     * @return
     */
    private SQLQuery getSqlQuery(String oldsql,Questionnaire questionnaire,boolean ispage){
        StringBuffer sql = new StringBuffer(oldsql);
        if (0 != questionnaire.getUserId() && !"".equals(questionnaire.getUserId())) {
            sql.append(" and user=" + questionnaire.getUserId());
        }
        //开始时间
        if (null != questionnaire.getKsrq() && !"".equals(questionnaire.getKsrq())) {
            sql.append(" and createtime > '" + questionnaire.getKsrq()+"'");
        }
        //结束时间
        if (null != questionnaire.getJsrq() && !"".equals(questionnaire.getJsrq())) {
            sql.append(" and createtime < '" + questionnaire.getJsrq()+"'");
        }
        //排序
        sql.append(" ORDER BY createtime DESC");
        if(ispage) {
            if (0 != questionnaire.getLimit()) {
                //分页查询
                sql.append("  LIMIT " + questionnaire.getOffset() + "," + questionnaire.getLimit());
            }
        }
        Session session = sessionFactory.openSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql.toString());
        return  sqlQuery;
    }

}
