package com.hugo.utils;

import com.hugo.entity.User;

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
}
