package com.hugo.utils.page;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: PageHelper
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/9$ 11:33$
 * @Version: 1.0
 */
public class PageHelper<T> {
    //实体类集合
    private List<T> rows = new ArrayList<T>();
    //数据总条数
    private int total;

    public PageHelper() {
        super();
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

}
