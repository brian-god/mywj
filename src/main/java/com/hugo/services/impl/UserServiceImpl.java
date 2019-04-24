package com.hugo.services.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.hugo.entity.User;
import com.hugo.repository.childRepository.UserRepository;
import com.hugo.services.UserService;
import com.hugo.utils.DataUtils;
import com.hugo.utils.QAResult;
import com.hugo.utils.page.childvo.UserPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public QAResult register(String username,String  email,String mobile) {
       if (username != null){
           User userByUsername = getUserByUsername(username);
           if(null != userByUsername) {
               return QAResult.build(400, "该用户名已被使用");
           }
        }
       if (email != null) {
           User userByEmail = userRepository.getUserByEmail(email);
           if ( null != userByEmail) {
               return QAResult.build(400, "该邮箱已被使用");
           }
       }
       if (mobile != null) {
           User userByMobile = userRepository.getUserByMobile(mobile);
           if (userByMobile != null) {
               return QAResult.build(400, "该手机号码已被使用");
           }
       }
       return QAResult.build(200, "ok");
    }

    @Override
    public QAResult addUser(User user) {
        user.setJointime(DataUtils.getTodayTime());
        user.setCreatetime(DataUtils.getTodayTime());
        user.setStatus(1);
        user.setDr(0);
        Integer save = userRepository.save(user);
        if (save  < 0){
            return QAResult.ok(400);
        }
        return QAResult.build(200,"添加成功",save);
    }

    @Override
    public List<User> getAllUser(UserPage userPage) {
        return userRepository.getAllUser(userPage);
    }

    @Override
    public Integer getUserNum(UserPage userPage) {
        return userRepository.getUserNum(userPage);
    }

    @Override
    public User getUserByUserId(int id) {
        return userRepository.getUserByUserId(id);
    }

    @Override
    public QAResult deleteUser(String data) {
        try {
            //字符串数组转对象集合
            List<User> list =  JSONArray.parseArray(data,User.class);
            for (int i= 0;i<list.size();i++){
                list.get(i).setDr(1);//删除
                list.get(i).setUpdatetime(DataUtils.getTodayTime());//修改时间
            }
            if(userRepository.updateUsers(list)){
                return QAResult.build(500,"删除失败");
            }
        }catch (Exception e){
            return QAResult.build(500,"删除数据失败");
        }
        return QAResult.build(200,"删除数据成功");
    }

    @Override
    public QAResult doUpdateUser(User user) {
        if( userRepository.doUpdateUser(user)){
            return QAResult.build(400,"修改失败");
        }
        return QAResult.build(200,"修改成功");
    }

    @Override
    public QAResult updatePassword(String password, int id) {
        if( userRepository.updatePassword(password,id)){
            return QAResult.build(400,"修改失败");
        }
        return QAResult.build(200,"修改成功");
    }


    private User getUserByUsername(String username){
       User user = userRepository.getUserByUsername(username);
        if (null == user){
            return  null;
        }
        return  user;
    }
    private User getUserByMobile(String mobile){
        User user = userRepository.getUserByMobile(mobile);
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
