package com.hugo.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用户实体
 * @ClassName: User
 * @Description:
 * @Author: Hugo
 * @CreateDate: 2019/3/23$ 13:33$
 * @Version: 1.0
 */
@Data
@Entity
//创建的数据库表名称
@Table(name = "fa_user")
public class User {
    @Id
    @GeneratedValue
    private Integer id;
    private String username;
    private String nickname;
    private String password;
    private String email;
    private String mobile;
    private String avatar;
    private Integer gender=0;
    private String birthday;
    private String jointime;
    private String createtime;
    private String updatetime;
    private Integer status=0;
    private Integer dr =0;
    private Integer usertype;
}

