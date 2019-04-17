package com.hugo.repository.childRepository.impl;

import com.hugo.entity.User;
import com.hugo.repository.childRepository.UserRepository;
import com.hugo.utils.DataUtils;
import com.hugo.utils.page.childvo.UserPage;
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
 * 用户接口实现
 * @ClassName: UserRepositoryImpl
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/1$ 15:46$
 * @Version: 1.0
 */
@Repository
public class UserRepositoryImpl implements UserRepository {
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

    /**
     * h获取用户根据ID
     * @param id
     * @return
     */
    @Override
    public User load(Integer id) {
        return (User) getCurrentSession().load(User.class,id);
    }

    @Override
    public User get(Integer id) {
        return null;
    }

    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public void persist(User entity) {

    }

    @Override
    public Integer save(User entity) {
        return (Integer)getCurrentSession().save(entity);
    }

    @Override
    public void saveOrUpdate(User entity) {
    }

    @Override
    public void delete(Integer id) {

    }

    @Override
    public void flush() {

    }


    @Override
    public User getUserByUsername(String username) {
        String  sql = "SELECT  * from fa_user where username= '"+ username+"'";
        Session currentSession = sessionFactory.openSession();
        SQLQuery query = currentSession.createSQLQuery(sql);
        query.addEntity(User.class);
        User user = (User)query.uniqueResult();
        return user;
    }

    @Override
    public User getUserByEmail(String email) {
        String  sql = "SELECT  * from fa_user where email= '"+ email+"'";
        Session currentSession = sessionFactory.openSession();
        SQLQuery query = currentSession.createSQLQuery(sql);
        query.addEntity(User.class);
        User user = (User)query.uniqueResult();
        return user;
    }

    @Override
    public User getUserByMobile(String mobile) {
        String  sql = "SELECT  * from fa_user where mobile= '"+ mobile+"'";
        Session currentSession = sessionFactory.openSession();
        SQLQuery query = currentSession.createSQLQuery(sql);
        query.addEntity(User.class);
        User user = (User)query.uniqueResult();
        return user;
    }

    @Override
    public List<User> getAllUser(UserPage userPage) {
        String sql = "SELECT * FROM fa_subject WHERE dr = 0  and usertype=0";
        SQLQuery sqlQuery = getSqlQuery(sql,userPage,true);
        sqlQuery.addEntity(User.class);
        Object sub = sqlQuery.list();
        List<User> users = (List<User>) sub;
        return users;
    }

    @Override
    public Integer getUserNum(UserPage userPage) {
        String sql = "SELECT count(*) FROM fa_user WHERE  dr = 0 ";
        SQLQuery sqlQuery = getSqlQuery(sql,userPage,false);
        sqlQuery.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);//返回map数据
        Object list = sqlQuery.list();
        List<Map<String, Object>> userList = (List<Map<String, Object>>) list;
        String count = userList.get(0).get("count(*)").toString();
        return Integer.valueOf(count);
    }

    @Override
    public User getUserByUserId(int id) {
        String  sql = "SELECT  * from fa_user where id= "+ id+"";
        Session currentSession = sessionFactory.openSession();
        SQLQuery query = currentSession.createSQLQuery(sql);
        query.addEntity(User.class);
        User user = (User)query.uniqueResult();
        return user;
    }

    @Override
    public boolean updateUsers(List<User> list) {
        return BatchUser(list,1);
    }

    @Override
    public boolean doUpdateUser(User user) {
        String sql = "update fa_user set nickname='" + user.getNickname() + "',gender=" + user.getGender()
                + ",updatetime='" + DataUtils.getTodayTime()+ "' where id=" + user.getId() + ";";
        Session currentSession = sessionFactory.openSession();
        SQLQuery query = currentSession.createSQLQuery(sql);
        if (query.executeUpdate() > 0) {
            return true;
        }
        return false;
    }


    /**
     * 查询SQL拼接
     * @param oldsql
     * @param userPage
     * @param ispage 是否分页
     * @return
     */
    private SQLQuery getSqlQuery(String oldsql, UserPage userPage, boolean ispage){
        StringBuffer sql = new StringBuffer(oldsql);
        if (null != userPage.getUsername() && !"".equals(userPage.getUsername())) {
            sql.append(" and user=" + userPage.getUsername());
        }

        if (null != userPage.getMobile() && !"".equals(userPage.getMobile())) {
            sql.append(" and user=" + userPage.getMobile());
        }
        if(ispage) {
            if (0 != userPage.getLimit()) {
                //分页查询
                sql.append("  LIMIT " + userPage.getOffset() + "," + userPage.getLimit());
            }
        }
        Session session = sessionFactory.openSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql.toString());
        return  sqlQuery;
    }

    /**
     * 数据批量操作
     * @param list
     * @param in
     * @return
     */
    private boolean BatchUser(List<User> list ,int in){
        boolean iserror = false;
        Transaction tx = null;
        Session  session = getCurrentSession(); //获取session
        try {
            tx = session.beginTransaction();
            int i = 0;
            for (User c : list) {
                if(in ==0 ) {//删除
                    session.delete(c);
                }else if(in == 1){//修改
                    session.saveOrUpdate(c);
                }
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
