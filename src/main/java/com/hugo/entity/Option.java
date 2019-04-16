package com.hugo.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 选择题的选项
 * @ClassName: Option
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/11$ 9:26$
 * @Version: 1.0
 */
@Entity
//创建的数据库表名称
@Table(name = "fa_option")
public class Option {
    @Id
    @GeneratedValue
    private Integer id;
    /**
     * 选项
     */
    private String subopt;
    /**
     * 选项描述
     */
    private String name;
    /**
     * 所属题目
     */
    private Integer subject;
    private Integer dr;
    /**
     * 题号
     */
    private  Integer num;

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getSubopt() {
        return subopt;
    }

    public void setSubopt(String subopt) {
        this.subopt = subopt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSubject() {
        return subject;
    }

    public void setSubject(Integer subject) {
        this.subject = subject;
    }

    public Integer getDr() {
        return dr;
    }

    public void setDr(Integer dr) {
        this.dr = dr;
    }
}
