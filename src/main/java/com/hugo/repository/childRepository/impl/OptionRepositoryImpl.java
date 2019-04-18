package com.hugo.repository.childRepository.impl;

import com.hugo.entity.Option;
import com.hugo.repository.childRepository.OptionRepository;
import com.hugo.utils.MywjUtils;
import com.hugo.utils.page.childvo.OptionPage;
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
 * @ClassName: OptionRepositoryImpl
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/15$ 16:43$
 * @Version: 1.0
 */
@Repository
public class OptionRepositoryImpl  implements OptionRepository {
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
    public Option load(Integer id) {
        return null;
    }

    @Override
    public Option get(Integer id) {
        return null;
    }

    @Override
    public List<Option> findAll() {
        return null;
    }

    @Override
    public void persist(Option entity) {

    }

    @Override
    public Integer save(Option entity) {
        return (Integer)getCurrentSession().save(entity);
    }

    @Override
    public void saveOrUpdate(Option entity) {

    }

    @Override
    public void delete(Integer id) {

    }

    @Override
    public void flush() {

    }

    /**
     * 批量保存
     * @param list
     * @return
     */
    @Override
    public boolean saveOrupdateList(List<Option> list) {
            boolean iserror = false;
             Session  session = getCurrentSession(); //获取session
            try {
                int i = 0;
                for (Option c : list) {
                    session.saveOrUpdate(c);
                    i++;
                    if (i % 100 == 0) {
                        session.flush();
                        session.clear();
                    }
                    session.flush();
                }
            } catch (Exception e) {
                e.printStackTrace();
                iserror = true;
            } finally {
                if (session != null)
                    session.clear();
            }
        return iserror;
    }

    /**
     * 获取分页数据
     * @param optionPage
     * @return
     */
    @Override
    public List<Option> getOptions(OptionPage optionPage) {
        String sql = "select * from fa_option  where dr =0 and subject = "+optionPage.getSubjectId();
        SQLQuery  sqlQuery = MywjUtils.getSqlQuery(sql,optionPage,true,getCurrentSession());
        sqlQuery.addEntity(Option.class);
        Object sub = sqlQuery.list();
        List<Option> option = (List<Option>) sub;
        return option;
    }

    /**
     * 数量查询
     * @param optionPage
     * @return
     */
    @Override
    public Integer getOptionNum(OptionPage optionPage) {
        String sql = "select count(*) from fa_option  where dr =0 and subject = "+optionPage.getSubjectId();
        SQLQuery sqlQuery =MywjUtils.getSqlQuery(sql,optionPage,false,getCurrentSession());
        sqlQuery.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);//返回map数据
        Object questionnaireLists = sqlQuery.list();
        List<Map<String, Object>> qts = (List<Map<String, Object>>) questionnaireLists;
        String count = qts.get(0).get("count(*)").toString();
        return Integer.valueOf(count);
    }

    @Override
    public List<Option> getOptionsBySubId(Integer subId) {
        String sql = "select * from fa_option  where subject = "+subId +" and dr = 0  ORDER BY id";
        Session session = this.getCurrentSession();
        SQLQuery query = session.createSQLQuery(sql);
        query.addEntity(Option.class);
        List<Option> subject = query.list();
        session.clear();
        return subject;
    }
}
