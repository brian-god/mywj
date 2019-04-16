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
}
