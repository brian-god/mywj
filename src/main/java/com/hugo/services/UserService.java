package com.hugo.services;

import com.hugo.entity.User;
import com.hugo.utils.QAResult;

public interface UserService {
    String getUserBuID(int id);
    QAResult login(String username,String password);
    QAResult register(String username,String email,String mobile);
    QAResult addUser(User user);
}
