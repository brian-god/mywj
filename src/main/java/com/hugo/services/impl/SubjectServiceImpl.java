package com.hugo.services.impl;

import com.hugo.entity.Subject;
import com.hugo.repository.childRepository.SubjectRepository;
import com.hugo.services.SubjectService;
import com.hugo.utils.QAResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lxs on 2019/4/11.
 */
@Service
public class SubjectServiceImpl implements SubjectService{

    @Autowired
    private SubjectRepository subjectRepository;

    @Override
    public QAResult addSubject(Subject subject) {
        subject.setDr(0);
        subject.setChosetype(subject.getChosetype());
        subject.setSubjecttype(subject.getSubjecttype());
        subject.setQuestionnaire(subject.getQuestionnaire());
        subject.setSubject(subject.getSubject());
        subject.setNum(subject.getNum());
        Integer save = subjectRepository.save(subject);
        if (save == 0){
            return QAResult.build(400,"添加失败");
        }
        return QAResult.build(200,"添加成功");
    }
}
