package com.hugo.services;

import com.hugo.entity.User;

public interface UserService {
    String getUserBuID(int id);

    User getUserByUsername(String username);
}
