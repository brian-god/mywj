package com.hugo.repository.childRepository;

import com.hugo.entity.Option;
import com.hugo.repository.DomainRepository;

import java.util.List;

public interface OptionRepository extends DomainRepository<Option,Integer> {
    /**
     * 批量保存
     * @param list
     * @return
     */
    boolean saveList(List<Option> list);

    List<Option> getOptionBySubject(int subjectId);
}
