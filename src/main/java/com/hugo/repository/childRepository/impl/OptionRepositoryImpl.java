package com.hugo.repository.childRepository.impl;

import com.hugo.entity.Option;
import com.hugo.repository.childRepository.OptionRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    public boolean saveList(List<Option> list) {
            boolean iserror = false;
            Transaction tx = null;
             Session  session = getCurrentSession(); //获取session
            try {
                tx = session.beginTransaction();
                int i = 0;
                for (Option c : list) {
                    session.save(c);
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
                    session.close();
            }
            tx.commit();
        return iserror;
    }
    /* @Override
    public boolean saveList(List<Option> list) {
        boolean iserror = false;
        try {
            for (Option c : list) {
                save(c);
            }
        }catch (Exception e){
            iserror = true;
        }
        return iserror;
    }*/
}