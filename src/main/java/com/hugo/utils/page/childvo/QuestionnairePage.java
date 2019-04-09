package com.hugo.utils.page.childvo;

import com.hugo.utils.page.Page;

/**
 * 问卷查询分页实体
 * @ClassName: Userpage
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/9$ 11:38$
 * @Version: 1.0
 */
public class QuestionnairePage extends Page {
    //开始时间
    private String ksrq;
    //结束时间
    private String jsrq;
    //用户id
    private int userId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getKsrq() {
        return ksrq;
    }

    public void setKsrq(String ksrq) {
        this.ksrq = ksrq;
    }

    public String getJsrq() {
        return jsrq;
    }

    public void setJsrq(String jsrq) {
        this.jsrq = jsrq;
    }
}
