package com.hugo.services;

import com.hugo.entity.User;
import com.hugo.utils.QAResult;
import com.hugo.utils.page.childvo.UserPage;

import java.util.List;

public interface UserService {
    String getUserBuID(int id);
    QAResult login(String username,String password);
    QAResult register(String username,String email,String mobile);
    QAResult addUser(User user);

    List<User> getAllUser(UserPage userPage);

    Integer getUserNum(UserPage userPage);

    User getUserByUserId(int id);

    QAResult deleteUser(String data);

    QAResult doUpdateUser(User user);

    QAResult updatePassword(String password, int id);
}
