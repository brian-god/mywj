package com.hugo.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 题目实体
 * @ClassName: Subject
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/11$ 9:20$
 * @Version: 1.0
 */
@Entity
//创建的数据库表名称
@Table(name = "fa_subject")
public class Subject {
    @Id
    @GeneratedValue
    private Integer id;
    /**
     * 题号
     */
    private Integer num;
    /**
     * 题目
     */
    private String subject;
    /**
     * 所属问卷
     */
    private Integer questionnaire;
    /**
     * 题目类型
     */
    private String subjecttype;
    /**
     * 选项类型
     */
    private String chosetype;
    /**
     * 选项详情
     */
    private String opdetail;

    private Integer dr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Integer getQuestionnaire() {
        return questionnaire;
    }

    public void setQuestionnaire(Integer questionnaire) {
        this.questionnaire = questionnaire;
    }

    public String getSubjecttype() {
        return subjecttype;
    }

    public void setSubjecttype(String subjecttype) {
        this.subjecttype = subjecttype;
    }

    public String getChosetype() {
        return chosetype;
    }

    public void setChosetype(String chosetype) {
        this.chosetype = chosetype;
    }

    public String getOpdetail() {
        return opdetail;
    }

    public void setOpdetail(String opdetail) {
        this.opdetail = opdetail;
    }

    public Integer getDr() {
        return dr;
    }

    public void setDr(Integer dr) {
        this.dr = dr;
    }
}
