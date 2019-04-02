package com.hugo.services.impl;

import com.alibaba.fastjson.JSON;
import com.hugo.entity.User;
import com.hugo.repository.childRepository.UserRepository;
import com.hugo.services.UserService;
import com.hugo.utils.DataUtils;
import com.hugo.utils.QAResult;
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
    public QAResult login(String username,String password) {
        User userByUsername = getUserByUseremail(username);
        if (userByUsername != null){
            if (password.equals(userByUsername.getPassword())){
                return QAResult.build(200,"登录成功",userByUsername);
            }
            return QAResult.ok();
        }
        return QAResult.ok();
    }

   @Override
    public QAResult register(String username,String  email) {
       User userByUsername = getUserByUsername(username);
       if (userByUsername != null){
            return QAResult.build(400,"该用户名已被使用");
        }
       User userByEmail = userRepository.getUserByEmail(email);
       if (userByEmail != null){
           return QAResult.build(400,"该邮箱已被使用");
       }
       return QAResult.ok(200);
    }

    @Override
    public QAResult addUser(String username, String password, String email) {
        User user = new User();
        user.setId(null);
        user.setUsername(username);
        user.setNickname(null);
        user.setPassword(password);
        user.setEmail(email);
        user.setMobile(null);
        user.setAvatar(null);
        user.setGender(null);
        user.setBirthday(null);
        user.setJointime(DataUtils.getTodayTime());
        user.setCreatetime(DataUtils.getTodayTime());
        user.setUpdatetime(null);
        user.setStatus(null);
        user.setDr(0);
        Integer save = userRepository.save(user);
        if (save  < 0){
            return QAResult.ok(400);
        }
        return QAResult.build(200,"添加成功",save);
    }


    private User getUserByUsername(String username){
        User user = userRepository.getUserByUsername(username);
        if (null == user){
            return  null;
        }
        return  user;
    }
    private User getUserByUseremail(String email){
        User user = userRepository.getUserByEmail(email);
        if (null == user){
            return  null;
        }
        return  user;
    }



}
