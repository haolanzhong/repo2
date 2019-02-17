package com.itheima.utils;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.resource.DefaultServletHttpRequestHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Handler;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        /*释放静态资源*/
        if (handler instanceof DefaultServletHttpRequestHandler){
            return true;
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("user")!=null){
            return true;
        }
        response.sendRedirect(request.getContextPath()+"/index.jsp");
        return false;
    }
}
