package com.filter.space;

import com.dao_.domain.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//@WebFilter(filterName = "Space")
public class Space implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    public void destroy() {
    }
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();

//        session.setAttribute("User", new User(user));
//        session.setAttribute("Login", new User(user));
//
//        session.setAttribute("Id", user.getUserId());
//        session.setAttribute("state",true);

        if(session.getAttribute("state")==null){
            System.out.println("判断失败返回");
            req.getRequestDispatcher("/assets/jsp/login.jsp").forward(req,res);
        }else{
            User user = (User) session.getAttribute("User");
            String Id = String.valueOf(session.getAttribute("Id")) ;
            boolean state=(boolean) session.getAttribute("state");
            System.out.println("进入判断");
            if (user != null&&Id!=null&&!"0".equals(Id)&&state) {
                System.out.println("判断成功");
                chain.doFilter(request, response);
            } else {
                System.out.println("判断失败返回");
                req.getRequestDispatcher("/assets/jsp/login.jsp").forward(req,res);
            }
        }

    }
}
