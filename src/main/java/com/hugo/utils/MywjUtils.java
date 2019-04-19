package com.hugo.utils;

import com.hugo.entity.User;
import com.hugo.utils.page.Page;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 问卷项目工具类
 */
public class MywjUtils {
    /**
     * 获取当前登陆的用户
     * @param request
     * @return
     */
    public static User getLoginUser(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user1 = (User) session.getAttribute("user");
        return user1;
    }
    /**
     * 分页或者不分页
     * @param oldsql
     * @param page
     * @param ispage
     * @return
     */
    public static SQLQuery getSqlQuery(String oldsql, Page page, boolean ispage ,Session session){
        StringBuffer sql = new StringBuffer(oldsql);
        if(ispage) {
            if (0 != page.getLimit()) {
                //分页查询
                sql.append("  LIMIT " + page.getOffset() + "," + page.getLimit());
            }
        }
        SQLQuery sqlQuery = session.createSQLQuery(sql.toString());
        session.clear();
        return  sqlQuery;
    }
}
