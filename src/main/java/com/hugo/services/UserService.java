package com.hugo.services;

import com.hugo.utils.QAResult;

public interface UserService {
    String getUserBuID(int id);
    QAResult login(String username,String password);
    QAResult register(String username,String email);
    QAResult addUser(String username, String password, String email);
}
