package com.hugo.utils.page.childvo;


import com.hugo.utils.page.Page;

/**
 * UserPage
 */
public class UserPage extends Page {
    //用户名
    private String username;

    //手机号
    private String mobile;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
