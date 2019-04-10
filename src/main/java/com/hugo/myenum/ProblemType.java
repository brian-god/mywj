package com.hugo.myenum;

/**
 * 问卷题目类型
 */
public enum ProblemType {
    XZT(1, "单选题"),
    TKT(2, "多选题"),
    JDT(2, "多选题");
    private int code;
    private String desc;

    private ProblemType(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static ChoiceType getCode(int code) {
        for (ChoiceType type : ChoiceType.values()) {
            if (type.getCode() == code) {
                return type;
            }
        }
        return null;
    }

    /**
     * @return the code
     */
    public int getCode() {
        return code;
    }

    /**
     * @param code the code to set
     */
    public void setCode(int code) {
        this.code = code;
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }
}
