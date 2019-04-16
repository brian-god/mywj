package com.hugo.services.impl;

import com.hugo.entity.Option;
import com.hugo.repository.childRepository.OptionRepository;
import com.hugo.services.OptionService;
import com.hugo.utils.page.childvo.OptionPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lxs on 2019/4/16.
 */
@Service
public class OptionServiceImpl  implements OptionService {
    @Autowired
    private OptionRepository optionRepository;
    @Override
    public List<Option> getOptions(OptionPage optionPage) {
        return optionRepository.getOptions(optionPage);
    }

    @Override
    public Integer getOptionNum(OptionPage optionPage) {
        return optionRepository.getOptionNum(optionPage);
    }
}
