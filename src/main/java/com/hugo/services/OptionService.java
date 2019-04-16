package com.hugo.services;

import com.hugo.entity.Option;
import com.hugo.utils.page.childvo.OptionPage;

import java.util.List;

/**
 * Created by lxs on 2019/4/16.
 */
public interface OptionService {
    /**
     * 获取分页数据
     * @param subjectId
     * @return
     */
    List<Option> getOptions(OptionPage subjectId);
    /**
     * 获取总数
     * @param optionPage
     * @return
     */
    Integer getOptionNum(OptionPage optionPage);
}
