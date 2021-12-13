package com.filter.hdindex;

import com.dao_.domain.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

//@WebFilter(filterName = "Hdindex")
public class Hdindex implements Filter {

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
            req.getRequestDispatcher("/Login").forward(req,res);
        }else{
            User user = (User) session.getAttribute("User");
            String Id = String.valueOf(session.getAttribute("Id")) ;
            boolean state=(boolean) session.getAttribute("state");
            System.out.println("进入判断");
            System.out.println(user);
            if (user != null&&Id!=null&&!"0".equals(Id)&&state) {
                if("1".equals(user.getRoot())) {
                    chain.doFilter(request, response);
                }
                else {
                    System.out.println("进入1");
//                    PrintWriter out = response.getWriter();
//                    out.print("<script>alert('不是该系统用户！请重新登录');</script>");
//                    out.close();
//
////跳转到登陆页面 index.jsp在webRoot根目录下
//                    RequestDispatcher dispatcher = request.getRequestDispatcher("/assets/jsp/login.jsp");
//                    dispatcher.forward(request, response);
//                    return;

//                    req.getRequestDispatcher("/assets/jsp/login.jsp").forward(req, res);
                    req.getRequestDispatcher("/Login").forward(req,res);
                }
            } else {

//                PrintWriter out = response.getWriter();
//                out.print("<script>alert('不是该系统用户！请重新登录');</script>");
//                out.close();
//
////跳转到登陆页面 index.jsp在webRoot根目录下
//                RequestDispatcher dispatcher = request.getRequestDispatcher("/assets/jsp/login.jsp");
//                dispatcher.forward(request, response);
//                return;

                System.out.println("进入2");
//                req.getRequestDispatcher("/assets/jsp/login.jsp").forward(req,res);
                req.getRequestDispatcher("/Login").forward(req,res);
            }
        }

    }
}
