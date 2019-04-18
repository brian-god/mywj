package com.hugo.repository.childRepository;

import com.hugo.entity.Option;
import com.hugo.repository.DomainRepository;
import com.hugo.utils.page.childvo.OptionPage;

import java.util.List;

public interface OptionRepository extends DomainRepository<Option,Integer> {
    /**
     * 批量保存
     * @param list
     * @return
     */
    boolean saveOrupdateList(List<Option> list);

    /**
     * 获取分页数据
     * @param optionPage
     * @return
     */
    List<Option> getOptions(OptionPage optionPage);

    /**
     * 获取总数
     * @param optionPage
     * @return
     */
    Integer getOptionNum(OptionPage optionPage);

    /**
     * 根据题的id查选项
     * @param subId
     * @return
     */
    List<Option> getOptionsBySubId(Integer subId);
}
