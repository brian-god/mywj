package com.hugo.repository.childRepository;

import com.hugo.entity.User;
import com.hugo.repository.DomainRepository;

/**
 * 用户数据库层实现
 */
public interface UserRepository extends DomainRepository<User,Integer> {

    User getUserByUsername(String username);

    User  getUserByEmail(String email);
}
