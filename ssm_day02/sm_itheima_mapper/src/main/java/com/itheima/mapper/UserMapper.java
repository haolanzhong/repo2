package com.itheima.mapper;

import com.itheima.domain.Condition;
import com.itheima.domain.PageBean;
import com.itheima.domain.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    User login(User user);

    List<User> findAll(Condition condition);

    void add(User user);

    void delUser(User user);

    User findUserById(User user);

    void update(User user);

    Integer findTotalCount(User user);
}
