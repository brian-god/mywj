package com.hugo.repository.childRepository.impl;

import com.hugo.entity.Questionnaire;
import com.hugo.repository.childRepository.QuestionnaireRepository;
import com.hugo.utils.DataUtils;
import com.hugo.utils.page.childvo.QuestionnairePage;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
    public Integer updateById(Integer id){
        String sql = "update fa_questionnaire set dr = 1,updatetime='"+DataUtils.getTodayTime()+"' where id="+id;
        int result ;
        Session session = sessionFactory.openSession();
        SQLQuery query = session.createSQLQuery(sql);
        result = query.executeUpdate();
        session.clear();
        return result;
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
        session.clear();
        return qts;
    }

    /**
     * 分页加条件查询
     *
     * @param questionnairePage
     * @return
     */
    @Override
    public List<Questionnaire> getQuestionnaire(QuestionnairePage questionnairePage) {
        String sql = "SELECT * FROM fa_questionnaire WHERE dr = 0 ";
        SQLQuery sqlQuery = getSqlQuery(sql,questionnairePage,true);
        sqlQuery.addEntity(Questionnaire.class);
        Object questionnaireLists = sqlQuery.list();
        List<Questionnaire> qts = (List<Questionnaire>) questionnaireLists;
        return qts;
    }

    /**
     * 返回数量
     *
     * @param questionnairePage
     * @return
     */
    @Override
    public Integer getQuestionnaireNum(QuestionnairePage questionnairePage) {
        String sql = "SELECT count(user) FROM fa_questionnaire WHERE  dr = 0 ";
        SQLQuery sqlQuery = getSqlQuery(sql,questionnairePage,false);
        sqlQuery.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);//返回map数据
        Object questionnaireLists = sqlQuery.list();
        List<Map<String, Object>> qts = (List<Map<String, Object>>) questionnaireLists;
        String count = qts.get(0).get("count(user)").toString();
        return Integer.valueOf(count);
    }

    /**
     * 查询SQL拼接
     * @param oldsql
     * @param questionnairePage
     * @param ispage 是否分页
     * @return
     */
    private SQLQuery getSqlQuery(String oldsql,QuestionnairePage questionnairePage,boolean ispage){
        StringBuffer sql = new StringBuffer(oldsql);
        if (0 != questionnairePage.getUserId() && !"".equals(questionnairePage.getUserId())) {
            sql.append(" and user=" + questionnairePage.getUserId());
        }
        //开始时间
        if (null != questionnairePage.getKsrq() && !"".equals(questionnairePage.getKsrq())) {
            sql.append(" and createtime > '" + questionnairePage.getKsrq()+"'");
        }
        //结束时间
        if (null != questionnairePage.getJsrq() && !"".equals(questionnairePage.getJsrq())) {
            sql.append(" and createtime < '" + questionnairePage.getJsrq()+"'");
        }
        //排序
        sql.append(" ORDER BY createtime DESC");
        if(ispage) {
            if (0 != questionnairePage.getLimit()) {
                //分页查询
                sql.append("  LIMIT " + questionnairePage.getOffset() + "," + questionnairePage.getLimit());
            }
        }
        Session session = sessionFactory.openSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql.toString());
        session.clear();
        return  sqlQuery;
    }

    /**
     * 修改数据
     * @param questionnaire
     */
    @Override
    public  void updateQt(Questionnaire questionnaire){
        Session session= this.getCurrentSession();
        Transaction tran=session.beginTransaction();
        session.saveOrUpdate(questionnaire);
        tran.commit();
        session.clear();
    }
    /**
     * 批量修改
     * @param list
     * @return
     */
    @Override
    public boolean updateQts(List<Questionnaire> list) {
        return  BatchOperation(list);
    }

    /**
     * 数据批量操作
     * @param list
     * @return
     */
    private boolean BatchOperation(List<Questionnaire> list){
        boolean iserror = false;
        Transaction tx = null;
        Session  session = getCurrentSession(); //获取session
        try {
            tx = session.beginTransaction();
            int i = 0;
            for (Questionnaire c : list) {
                session.saveOrUpdate(c);
                i++;
                if (i % 100 == 0) {
                    session.flush();
                    session.clear();
                }
                session.flush();
            }
        } catch (Exception e) {
            iserror = true;
        } finally {
            if (session != null)
                session.clear();
        }
        tx.commit();
        return iserror;
    }

}
