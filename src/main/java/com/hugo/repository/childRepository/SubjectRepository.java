package com.hugo.repository.childRepository;

import com.hugo.entity.Subject;
import com.hugo.repository.DomainRepository;
import com.hugo.utils.page.childvo.SubjectPage;

import java.util.List;

/**
 * 问题
 */
public interface SubjectRepository extends DomainRepository<Subject,Integer> {

    List<Subject> getSubjectAndOption(int userId);

    Integer getSubjectNum(SubjectPage subjectPage);

    List<Subject> getSubject(SubjectPage subjectPage);

    /**
     * 修改数据
     * @param list
     * @return
     */
    boolean updateSubjects(List<Subject> list);

    /**
     * 保存或修改
     * @param subject
     * @return
     */
    void saveOrupdate(Subject subject);
}
