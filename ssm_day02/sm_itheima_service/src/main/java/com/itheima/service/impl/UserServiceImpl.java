package com.itheima.service.impl;

import com.itheima.domain.Condition;
import com.itheima.domain.PageBean;
import com.itheima.domain.User;
import com.itheima.mapper.UserMapper;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    public User login(User user) {
        return userMapper.login(user);
    }

    public List<User> findAll(PageBean pageBean, User user) {
        pageBean.setPageStart((pageBean.getPageNum()-1)*pageBean.getRows());
        Condition condition=new Condition();
        condition.setName(user.getName());
        condition.setAddress(user.getAddress());
        condition.setEmail(user.getEmail());
        condition.setPageStart(pageBean.getPageStart());
        condition.setRows(pageBean.getRows());
        return userMapper.findAll(condition);

    }

    public void add(User user) {
        userMapper.add(user);
    }

    public void delUser(User user) {
        userMapper.delUser(user);
    }

    public void delAll(Integer[] uid) {
        User user=new User();
        for (Integer integer : uid) {
            user.setId(integer);
            userMapper.delUser(user);
        }
    }

    public User findUserById(User user) {
        return userMapper.findUserById(user);

    }

    public void update(User user) {
        userMapper.update(user);
    }

    public Integer findTotalCount(User user) {
        return userMapper.findTotalCount(user);
    }

}
