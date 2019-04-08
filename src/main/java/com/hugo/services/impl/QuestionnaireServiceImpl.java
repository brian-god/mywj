package com.hugo.services.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.hugo.entity.Questionnaire;
import com.hugo.repository.childRepository.QuestionnaireRepository;
import com.hugo.services.QuestionnaireService;
import com.hugo.utils.Page;
import com.hugo.utils.QAResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lxs on 2019/4/4.
 */
@Service
public class QuestionnaireServiceImpl implements QuestionnaireService {
    @Autowired
    private QuestionnaireRepository questionnaireRepository;

    @Override
    public QAResult getQuestionnaireByUser(int id) {
        try{
            List<Questionnaire> qts = questionnaireRepository.getQuestionnaireByiUserId(id);
            if(null != qts && qts.size() > 0) {
                // List 转 JSONArray
                String jsonString = JSON.toJSONString(qts);
                System.out.print(jsonString);
                return QAResult.build(200,"获取成功",jsonString);
            }
        }catch (Exception e){
            return QAResult.build(500,"获取数据失败");
        }
        return QAResult.ok();
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
