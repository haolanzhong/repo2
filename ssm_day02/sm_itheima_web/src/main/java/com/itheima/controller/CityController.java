package com.itheima.controller;

import com.itheima.domain.User;
import com.itheima.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/city")
public class CityController {
    @Autowired
    private CityService cityService;
@RequestMapping("/findCity")
/*AJAX异步传输中返回值需用 @Responsebody 直接使用return对值进行返回  如果是用model.addtributte则 返回不了*/
    public @ResponseBody List<User> findCity(Model model){
    List<User> list=cityService.findCity();
    System.out.println(list);
    return list;
    }
}
