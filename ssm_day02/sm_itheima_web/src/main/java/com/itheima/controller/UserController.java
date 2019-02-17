package com.itheima.controller;

import com.itheima.domain.PageBean;
import com.itheima.domain.User;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    /*登录验证账号密码*/
    /*cookie记住状态*/
    @RequestMapping("/login")
    public String login(User user, String ck, HttpServletResponse rep,HttpServletRequest req) {
        User user1 = userService.login(user);
        Cookie cookie = new Cookie("username", user.getUsername());
        Cookie cookie1 = new Cookie("password", user.getPassword());
        if (user1 == null) {
            return "login";
        }
        if (ck != null) {
            cookie.setMaxAge(7 * 24 * 60 * 60);
            cookie1.setMaxAge(7 * 24 * 60 * 60);
        } else {
            cookie.setMaxAge(0);
            cookie1.setMaxAge(0);
        }
        cookie.setPath("/");
        cookie1.setPath("/");
        rep.addCookie(cookie);
        rep.addCookie(cookie1);
        req.getSession().setAttribute("user",user1);

        return "index";
    }

    /*分页模糊查询*/
    @RequestMapping("/findAll")
    public String findAll(
            Model model,
            @RequestParam(value = "pageNum", defaultValue = "1", required = false) Integer pageNum,
            @RequestParam(value = "rows", defaultValue = "5", required = false) Integer rows,
            User user
    ) {

        PageBean pageBean = new PageBean();
        pageBean.setPageNum(pageNum);
        pageBean.setRows(rows);
        List<User> list = userService.findAll(pageBean, user);
        pageBean.setList(list);
        Integer totalCount = userService.findTotalCount(user);
        pageBean.setTotalCount(totalCount);
        Integer totalPage = (int) (Math.ceil(totalCount * 1.0 / rows));
        pageBean.setTotalPage(totalPage);
        model.addAttribute("pb", pageBean);
        model.addAttribute("user1", user);
        return "list";
    }

    /*页面跳转*/
    @RequestMapping("/pathName/{change}")
    public String change(@PathVariable("change") String pathName) {
        return pathName;
    }

    /*添加用户*/
    @RequestMapping("/add")
    public String add(User user, MultipartFile picName, HttpServletRequest req) throws Exception {
        /*判断上传的文件类型是否符合*/
        if(!"image/jpeg".equals(picName.getContentType())){
            throw new Exception("您上传的不是jpg文件");
        }
        /*获得文件上传的所在的真实路径*/
        String path = req.getSession().getServletContext().getRealPath("/pics/");
        File file=new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        String filename = UUID.randomUUID()+picName.getOriginalFilename();
        picName.transferTo(new File(path,filename));
        user.setPic(filename);
        userService.add(user);
        return "redirect:/user/findAll";
    }

    /*删除用户*/
    @RequestMapping("/delUser")
    public String delUser(User user) {
        userService.delUser(user);
        return "redirect:/user/findAll";
    }

    /*删除选中*/
    @RequestMapping("/delAll")
    public String delAll(Integer[] uid) {
        userService.delAll(uid);
        return "redirect:/user/findAll";
    }

    /*回显数据*/
    @RequestMapping("/findUserById")
    public String findUserById(User user, Model model) {
        User user1 = userService.findUserById(user);
        model.addAttribute("user", user1);
        return "update";
    }

    /*修改*/
    @RequestMapping("/update")
    public String update(User user) {
        userService.update(user);
        return "redirect:/user/findAll";
    }


    /*查看头像*/
    @RequestMapping("/findPhoto")
    public String findPhoto(User user,Model model){
        User user1 = userService.findUserById(user);
        String realpath="/pics/"+user1.getPic();
        user1.setPic(realpath);
        System.out.println(realpath);
        model.addAttribute("photo",user1);
        return "photo";
    }
}
