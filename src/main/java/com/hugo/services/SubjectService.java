package com.hugo.services;

import com.hugo.entity.Subject;
import com.hugo.utils.QAResult;
import com.hugo.utils.page.childvo.SubjectPage;

import java.util.List;

/**
 * Created by lxs on 2019/4/11.
 */
public interface SubjectService {
    /**
     * 添加问卷
     * @param subject
     * @return
     */
    QAResult addSubject(Subject subject);

    /**
     * 添加问题和选项
     * @param data
     * @param subID
     * @return
     */
    QAResult addSubjectAndOption(String data,String subID);


    Integer getSubjectPageNum(SubjectPage subjectPage);

    List<Subject> getSubject(SubjectPage subjectPage);
}
