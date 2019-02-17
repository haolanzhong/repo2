package com.itheima.service;

import com.itheima.domain.PageBean;
import com.itheima.domain.User;

import java.util.List;

public interface UserService {
    User login(User user);

    List<User> findAll(PageBean pageBean, User user);

    void add(User user);

    void delUser(User user);

    void delAll(Integer[] uid);

    User findUserById(User user);

    void update(User user);

    Integer findTotalCount(User user);
}
