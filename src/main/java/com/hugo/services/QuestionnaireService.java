package com.hugo.services;

import com.hugo.utils.Page;
import com.hugo.utils.QAResult;

import java.util.List;
import java.util.Map;

/**
 * Created by lxs on 2019/4/4.
 */

public interface QuestionnaireService {

    QAResult getQuestionnaireByUser(int id, Page page);

    /**
     * 查询返回map数据
     * @param id
     * @return
     */
    List<Map<String,Object>> getPageQuestionnaireByUserResMap(int id);
}
