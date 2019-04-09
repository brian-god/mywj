package com.hugo.services.impl;

import com.alibaba.fastjson.JSONArray;
import com.hugo.entity.Questionnaire;
import com.hugo.repository.childRepository.QuestionnaireRepository;
import com.hugo.services.QuestionnaireService;
import com.hugo.utils.DataUtils;
import com.hugo.utils.Page;
import com.hugo.utils.QAResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by lxs on 2019/4/4.
 */
@Service
public class QuestionnaireServiceImpl implements QuestionnaireService {
    @Autowired
    private QuestionnaireRepository questionnaireRepository;
    /**
     * 返回map数据
     * @param id
     * @return
     */
    public List<Map<String,Object>> getPageQuestionnaireByUserResMap(int id){
        return  questionnaireRepository.getQuestionnaireByiUserIdResMap(id);
    }

    @Override
    public QAResult addQtManage(Questionnaire questionnaire,int userId,String userName) {
        questionnaire.setDr(0);
        questionnaire.setCreatetime(DataUtils.getTodayTime());
        questionnaire.setUpdatetime(null);
        questionnaire.setDescribe(questionnaire.getCreatetime());
        questionnaire.setModifier(userName);
        questionnaire.setName(questionnaire.getName());
        questionnaire.setQtstate(0);
        questionnaire.setUser(userId);
        questionnaire.setState(-1);
        Integer save = questionnaireRepository.save(questionnaire);
        if (save == 0){
            return QAResult.ok(400);
        }
        return QAResult.build(200,"添加成功");
    }

    @Override
    public QAResult getQuestionnaireByUser(int id, Page page) {

        return  null;
    }

    /**
     * 集合转json数组
     * @param list
     * @return
     */
    public static String   ListToJson( List<Questionnaire> list){
        JSONArray  jsonArray = new JSONArray();
        for(int i =0 ;i<list.size();i++){
            jsonArray.add(list.get(i));
        }
        return  jsonArray.toString();
    }
}
