package com.hugo.utils.page.childvo;

import com.hugo.utils.Page;

/**
 * @ClassName: SubjectPage
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/11$ 9:57$
 * @Version: 1.0
 */
public class SubjectPage extends Page {
    //用户id
    private int userId;
    //问卷主键
    private int qtId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getQtId() {
        return qtId;
    }

    public void setQtId(int qtId) {
        this.qtId = qtId;
    }
}
