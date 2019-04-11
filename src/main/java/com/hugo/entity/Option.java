package com.hugo.entity;

/**
 * 选择题的选项
 * @ClassName: Option
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/11$ 9:26$
 * @Version: 1.0
 */
public class Option {
    private Integer id;
    /**
     * 选项
     */
    private String option;
    /**
     * 选项描述
     */
    private String name;
    /**
     * 所属题目
     */
    private Integer subject;
    private Integer dr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
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
