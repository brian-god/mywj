package com.hugo.repository.childRepository.impl;

import com.hugo.entity.Subject;
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
        return null;
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
