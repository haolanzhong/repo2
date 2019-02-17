package com.itheima.service.impl;

import com.itheima.domain.User;
import com.itheima.mapper.CityMapper;
import com.itheima.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CityServiceImpl implements CityService {
@Autowired
    private CityMapper cityMapper;
    public List<User> findCity() {
        return cityMapper.findCity();
    }
}
