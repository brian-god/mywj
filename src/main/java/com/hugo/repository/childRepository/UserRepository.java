package com.hugo.repository.childRepository;

import com.hugo.entity.User;
import com.hugo.repository.DomainRepository;
import com.hugo.utils.page.childvo.UserPage;

import java.util.List;

/**
 * 用户数据库层实现
 */
public interface UserRepository extends DomainRepository<User,Integer> {

    User getUserByUsername(String username);

    User  getUserByEmail(String email);

    User  getUserByMobile(String mobile);

    List<User> getAllUser(UserPage userPage);

    Integer getUserNum(UserPage userPage);

    User  getUserByUserId(int id);

    boolean updateUsers(List<User> list);
}
