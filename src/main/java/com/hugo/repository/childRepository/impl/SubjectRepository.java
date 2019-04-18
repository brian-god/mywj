package com.hugo.repository.childRepository.impl;

import com.hugo.entity.Subject;
import com.hugo.utils.MywjUtils;
import com.hugo.utils.page.childvo.SubjectPage;
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
        String sql = "select * from fa_subject  where questionnaire = "+questionnaireId +" and dr = 0  ORDER BY num";
        Session session = this.getCurrentSession();
        SQLQuery query = session.createSQLQuery(sql);
        query.addEntity(Subject.class);
        List<Subject> subject = query.list();
        session.clear();
        return subject;
    }

    /**
     * 查询总数
     * @param subjectPage
     * @return
     */
    @Override
    public Integer getSubjectNum(SubjectPage subjectPage) {
        String sql = "SELECT count(*) FROM fa_subject WHERE  dr = 0 and questionnaire="+subjectPage.getQtId();
        SQLQuery sqlQuery = MywjUtils.getSqlQuery(sql,subjectPage,false,this.getCurrentSession());
        sqlQuery.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);//返回map数据
        Object questionnaireLists = sqlQuery.list();
        List<Map<String, Object>> qts = (List<Map<String, Object>>) questionnaireLists;
        String count = qts.get(0).get("count(*)").toString();
        return Integer.valueOf(count);
    }

    /**
     * 获取分页
     * @param subjectPage
     * @return
     */
    @Override
    public List<Subject> getSubject(SubjectPage subjectPage) {
        String sql = "SELECT * FROM fa_subject WHERE dr = 0 and questionnaire='"+subjectPage.getQtId()+"'  ORDER BY num ";
        SQLQuery sqlQuery = MywjUtils.getSqlQuery(sql,subjectPage,true,this.getCurrentSession());
        sqlQuery.addEntity(Subject.class);
        Object sub = sqlQuery.list();
        List<Subject> subjects = (List<Subject>) sub;
        return subjects;
    }

    /**
     * 修改
     * @param list
     * @return
     */
    public boolean updateSubjects(List<Subject> list){
        boolean iserror = false;
        return iserror;
    }

    /**
     * 保存或修改
     * @param entity
     * @return
     */
    @Override
    public void saveOrupdate(Subject entity){
        Session session= this.getCurrentSession();
        Transaction tran=session.beginTransaction();
        session.saveOrUpdate(entity);
        session.clear();
        tran.commit();
    }

    /**
     * 界面删除的处理
     * @param list
     * @param questionnaireId
     * @return
     */
    public boolean deleteSubByids(List<Integer> list,Integer questionnaireId){
        int result =0 ;
        Session session = sessionFactory.openSession();
        if(list.size()>0) {
            StringBuffer sql = new StringBuffer("update  fa_subject set dr = 1 where questionnaire=");
            sql.append(questionnaireId);
            sql.append(" and id NOT IN (");
            for (int i = 0; i < list.size(); i++) {
                if (i == list.size() - 1) {
                    sql.append(","+list.get(i) + ")");
                } else if(i == 0){
                    sql.append(list.get(i));
                }else{
                    sql.append(","+list.get(i));
                }
            }
            SQLQuery query =session.createSQLQuery(sql.toString());
            result = query.executeUpdate();
            session.clear();
        }
        return result>0?true:false;
    }
    /**
     * 查询SQL拼接
     * @param oldsql
     * @param subjectPage
     * @param ispage 是否分页
     * @return
     *//*
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
    }*/
}
