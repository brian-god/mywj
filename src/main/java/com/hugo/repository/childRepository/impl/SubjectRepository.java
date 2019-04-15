package com.hugo.repository.childRepository.impl;

import com.hugo.entity.Subject;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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

}
