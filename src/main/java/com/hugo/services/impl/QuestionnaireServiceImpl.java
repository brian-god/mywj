package com.hugo.services.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.hugo.entity.Questionnaire;
import com.hugo.repository.childRepository.QuestionnaireRepository;
import com.hugo.services.QuestionnaireService;
import com.hugo.utils.DataUtils;
import com.hugo.utils.IDUtils;
import com.hugo.utils.QAResult;
import com.hugo.utils.page.childvo.QuestionnairePage;
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
        //主键
        Integer id =  questionnaire.getId();
        if(null == id) {//添加
            questionnaire.setDr(0);
            questionnaire.setCreatetime(DataUtils.getTodayTime());
            questionnaire.setDescribes(questionnaire.getDescribes());
            questionnaire.setModifier(userName);
            questionnaire.setName(questionnaire.getName());
            questionnaire.setUser(userId);
            questionnaire.setState(-1);
            questionnaire.setNumber(String.valueOf(IDUtils.genItemId()));
            Integer save = questionnaireRepository.save(questionnaire);
            if (save == 0) {
                return QAResult.ok(400);
            }
            return QAResult.build(200, "添加成功");
        }else{//修改
           try{
               questionnaire.setUpdatetime(DataUtils.getTodayTime());//修改时间
               questionnaireRepository.updateQt(questionnaire);//修改
               return QAResult.build(300, "修改成功");
           }catch (Exception e){
               QAResult.build(500, "修改失败");
           }
        }
        return QAResult.build(200, "添加成功");
    }


    /**
     * 获取问卷
     * @param questionnairePage
     * @return
     */
    @Override
    public List<Questionnaire> getQuestionnaire(QuestionnairePage questionnairePage){
        return  questionnaireRepository.getQuestionnaire(questionnairePage);
    }
    /**
     * 返回数据总数
     * @param questionnairePage
     * @return
     */
    @Override
    public Integer getQuestionnaireNum(QuestionnairePage questionnairePage){
        return questionnaireRepository.getQuestionnaireNum(questionnairePage);
    }

    /**
     * 删除数据
     * @param data
     * @return
     */
    @Override
    public QAResult deleteQt(String data) {
        try {
            //字符串数组转对象集合
            List<Questionnaire> list =  JSONArray.parseArray(data,Questionnaire.class);
            if(questionnaireRepository.deleteQt(list)){
                return QAResult.build(500,"删除数据失败");
            }
        }catch (Exception e){
            return QAResult.build(500,"删除数据失败");
        }
        return QAResult.build(200,"删除数据成功");
    }

    /**
     * 审批数据
     * @param data
     * @return
     */
    @Override
    public QAResult approvalQt(String data) {
        try {
            //字符串数组转对象集合
            List<Questionnaire> list =  JSONArray.parseArray(data,Questionnaire.class);
            for (int i= 0;i<list.size();i++){
                list.get(i).setState(2);
                list.get(i).setUpdatetime(DataUtils.getTodayTime());//修改时间
            }
            if(questionnaireRepository.updateQts(list)){
                return QAResult.build(500,"审批失败");
            }
        }catch (Exception e){
            return QAResult.build(500,"审批数据失败");
        }
        return QAResult.build(200,"审批成功");
    }

    /**
     * 提交数据
     * @param data
     * @return
     */
    @Override
    public QAResult submissionQT(String data) {
        try {
            //字符串数组转对象集合
            List<Questionnaire> list =  JSONArray.parseArray(data,Questionnaire.class);
            for (int i= 0;i<list.size();i++){
                list.get(i).setState(1);
                list.get(i).setUpdatetime(DataUtils.getTodayTime());//修改时间
            }
            if(questionnaireRepository.updateQts(list)){
                return QAResult.build(500,"提交失败");
            }
        }catch (Exception e){
            return QAResult.build(500,"提交失败");
        }
        return QAResult.build(200,"提交成功");
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
