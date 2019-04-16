package com.hugo.services.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hugo.entity.Option;
import com.hugo.entity.Questionnaire;
import com.hugo.entity.Subject;
import com.hugo.repository.childRepository.OptionRepository;
import com.hugo.repository.childRepository.QuestionnaireRepository;
import com.hugo.repository.childRepository.SubjectRepository;
import com.hugo.services.SubjectService;
import com.hugo.utils.DataUtils;
import com.hugo.utils.QAResult;
import com.hugo.utils.page.childvo.SubjectPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lxs on 2019/4/11.
 */
@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private OptionRepository optionRepository;
    @Autowired
    private QuestionnaireRepository questionnaireRepository;

    @Override
    public QAResult addSubject(Subject subject) {
        subject.setDr(0);
        subject.setChosetype(subject.getChosetype());
        subject.setSubjecttype(subject.getSubjecttype());
        subject.setQuestionnaire(subject.getQuestionnaire());
        subject.setSubject(subject.getSubject());
        subject.setNum(subject.getNum());
        Integer save = subjectRepository.save(subject);
        if (save == 0) {
            return QAResult.build(400, "添加失败");
        }
        return QAResult.build(200, "添加成功");
    }

    /**
     * 添加题目和选项
     *
     * @param data
     * @param subID
     * @return
     */
    @Override
    public QAResult subjectAndOptionAction(String data,String subID,String operation) {
        //将获取的数据转成json数组
        JSONArray jsonArray = JSON.parseArray(data);
        return SubjectAndOptionDtil(jsonArray,subID,operation);
    }

    @Override
    public Integer getSubjectPageNum(SubjectPage subjectPage) {
        return subjectRepository.getSubjectNum(subjectPage);
    }

    @Override
    public List<Subject> getSubject(SubjectPage subjectPage) {
        return subjectRepository.getSubject(subjectPage);
    }

    /**
     * 处理的事件
     *
     * @param jsonArray
     * @param subID
     * @return
     */
    private QAResult SubjectAndOptionDtil(JSONArray jsonArray, String subID,String operation) {
        if("delete".equals(operation.trim())){//删除数据
            return this.deleteSubjectAndOptionQT(jsonArray,subID);
        }else if("save".equals(operation.trim())){//修改
            return  this.operationubjectAndOptionQT(jsonArray,subID,true);
        }
       return QAResult.ok();
    }

    /**
     * 删除数据
     * @param jsonArray
     * @param subID
     * @return
     */
    private QAResult deleteSubjectAndOptionQT(JSONArray jsonArray, String subID){
            try {
                int row = questionnaireRepository.updateById(Integer.valueOf(subID));
                if(row>0) {
                    if (jsonArray.size() > 0) {
                        operationubjectAndOptionQT(jsonArray, subID, false);
                    }
                }else {
                    return QAResult.build(500, "删除失败");
                }
            }catch (Exception e){
                return QAResult.build(500, "删除失败");
            }
            return QAResult.build(200, "删除成功");
    }

    /**
     * 操作问卷
     * @param jsonArray
     * @param subID
     * @param isCheck 是否校验数据
     * @return
     */
    private QAResult operationubjectAndOptionQT(JSONArray jsonArray, String subID,boolean isCheck){
        //boolean iserror = false;
        if (jsonArray.size() > 0) {
            for (int i = 0; i < jsonArray.size(); i++) {
                JSONObject job = jsonArray.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                Object num = job.get("num"); //题号
                String subjecttype = job.getString("subjecttype");//题目类型
                String subject = job.getString("subject");//题目描述
                String chosetype = job.getString("chosetype");//单选还是多选
                String detailsofoptions = job.getString("detailsofoptions");//详细选项
                String suid = job.getString("id");//主键
                if ((null == subjecttype || "".equals(subjecttype))&&isCheck) {
                    //题目类型不能为空
                    //iserror = true;
                    return QAResult.build(500, "题目类型不能为空");
                }
                if ((null == subject || "".equals(subject))&&isCheck) {
                    //题目描述不能为空
                    //iserror = true;
                    return QAResult.build(500, "题目描述不能为空");
                }
                //创建为题对象
                Subject subject1 = new Subject();
                subject1.setNum(Integer.valueOf(num.toString()));//题号
                subject1.setSubjecttype(subjecttype);//题目类型
                subject1.setSubject(subject);//题目描述
                subject1.setQuestionnaire(Integer.valueOf(subID));//属于哪一张问卷
                subject1.setDetailsofoptions(detailsofoptions);
                if(isCheck){
                    subject1.setDr(0);//逻辑标志
                }else {
                    subject1.setDr(1);//逻辑标志
                }
                if ("选择题".equals(subjecttype.trim())) {//是否是选择题
                    if(isCheck) {
                        if ((null == chosetype || "".equals(chosetype)) && isCheck) {
                            //题目描述不能为空
                            return QAResult.build(500, "选择题的类型不能为空");
                        }
                        if ((null == detailsofoptions || "".equals(detailsofoptions)) && isCheck) {
                            //选项不能为空
                            return QAResult.build(500, "选项不能为空");
                        }
                        subject1.setChosetype(chosetype);//选择题类型
                        if(null != suid && !"".equals(suid)) {
                            subject1.setId(Integer.valueOf(suid));
                            subjectRepository.saveOrupdate(subject1);
                        }else {
                            Integer pk = subjectRepository.save(subject1);
                            if (null != pk) {
                                JSONArray jsonOptionArray = JSON.parseArray(detailsofoptions);//选项集合
                                if (jsonOptionArray.size() > 0) {//遍历选项
                                    List<Option> options = new ArrayList<>();//选项集合
                                    for (int j = 0; j < jsonOptionArray.size(); j++) {
                                        JSONObject jobop = jsonOptionArray.getJSONObject(j);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                                        String name = jobop.getString("name");//获取name
                                        String option = jobop.getString("subopt");//获取选项
                                        String subNum = jobop.getString("num");//获取选项//
                                        if ((null == name || "".equals(name)) && isCheck) {
                                            //选项为空
                                            return QAResult.build(500, "选项为空");
                                        } else {
                                            Option optionVO = new Option();
                                            optionVO.setName(name);
                                            optionVO.setSubopt(option);
                                            optionVO.setSubject(pk);
                                            optionVO.setNum(Integer.valueOf(subNum));//题号
                                            optionVO.setDr(0);
                                            options.add(optionVO);
                                        }
                                    }
                                    if (options.size() > 0) {
                                        if (optionRepository.saveOrupdateList(options)) {//保存选项
                                            return QAResult.build(500, "选项保存失败");
                                        }
                                    } else {
                                        return QAResult.build(500, "选项为空");
                                    }
                                }
                            } else {
                                return QAResult.build(500, "保存失败");
                            }
                        }
                    }

                } else {
                    if(null != suid && !"".equals(suid)) {
                        subject1.setId(Integer.valueOf(suid));
                        subjectRepository.saveOrupdate(subject1);
                    }else {
                        subjectRepository.save(subject1);
                    }
                }

            }
        } else {
            //数据为空
            return QAResult.build(500, "数据为空");
        }
        return QAResult.build(200, "保存成功");

    }
}
