package com.myservers.login;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
//登录功能
@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        if(userName==null){
            userName="";
        }
        if(password==null){
            password="";
        }

        String sql = "select * from yxyy.user where userName=? and password=?";
        BasicDAO<User> userBasicDAO = new BasicDAO<>();
        List<User> users = userBasicDAO.queryMultiply(sql, User.class, userName, password);
        HttpSession session = request.getSession();
        System.out.println("登录判断");
        if (!users.isEmpty()) {
            User user = users.get(0);
            session.setAttribute("User", new User(user));
            session.setAttribute("Login", new User(user));

            session.setAttribute("Id", user.getUserId());
            session.setAttribute("state",true);
            if("1".equals(user.getRoot())){
                System.out.println("root判断1");
                response.sendRedirect("/houduan/hdindex.jsp");
            }else {
                System.out.println("root判断2");
                response.sendRedirect("/index.jsp");
            }

        }else{
            session.setAttribute("Id", 0);
            session.setAttribute("errorInfo", "账号或密码错误！");
            session.setAttribute("Login", new User(userName, password));
            session.setAttribute("state",false);
            System.out.println("失败");
            response.sendRedirect("/assets/jsp/login.jsp");
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
