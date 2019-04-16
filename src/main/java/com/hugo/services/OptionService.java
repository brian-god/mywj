package com.hugo.services;

import com.hugo.entity.Option;

import java.util.List;

/**
 * Created by lxs on 2019/4/16.
 */
public interface OptionService {
    List<Option> getOptionBySubject(int subjectId);
}
