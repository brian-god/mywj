package com.hugo.services.impl;

import com.alibaba.fastjson.JSON;
import com.hugo.entity.User;
import com.hugo.repository.childRepository.UserRepository;
import com.hugo.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *用户服务层
 * @ClassName: UserServiceImpl
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/4/1$ 15:52$
 * @Version: 1.0
 */
@Service
public class UserServiceImpl  implements UserService {
    //注入用户dao
    @Autowired
    private UserRepository userRepository;
    @Override
    public String getUserBuID(int id) {
        return JSON.toJSONString(userRepository.load(id));
    }

    @Override
    public User getUserByUsername(String username) {
        return  userRepository.select(username);
    }
}
