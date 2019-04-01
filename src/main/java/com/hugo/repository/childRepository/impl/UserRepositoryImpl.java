package com.hugo.repository.childRepository.impl;

import com.hugo.entity.User;
import com.hugo.repository.childRepository.UserRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
        return null;
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
    public User select(String username) {
            return (User) getCurrentSession().load(User.class,username);
    }


}
