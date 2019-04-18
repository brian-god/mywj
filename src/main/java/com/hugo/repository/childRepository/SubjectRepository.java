package com.hugo.repository.childRepository;

import com.hugo.entity.Subject;
import com.hugo.repository.DomainRepository;
import com.hugo.utils.page.childvo.SubjectPage;

import java.util.List;

/**
 * 问题
 */
public interface SubjectRepository extends DomainRepository<Subject,Integer> {

    List<Subject> getSubjectAndOption(int questionnaireId);

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

    /**
     * 执行前台删除的题
     * @param list
     * @param subId
     * @return
     */
    boolean deleteSubByids(List<Integer> list,Integer subId);
}
