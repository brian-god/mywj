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
    //每页显示数量
    private String ksrq;
    //页码
    private String jsrq;

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
