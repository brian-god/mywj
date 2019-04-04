package com.hugo.repository.childRepository.impl;

import com.hugo.entity.Questionnaire;
import com.hugo.repository.childRepository.QuestionnaireRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lxs on 2019/4/4.
 */
@Repository
public class QuestionnaireRepositoryImpl implements QuestionnaireRepository {

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
        return null;
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
}
