package com.myservers.signup;

import com.dao_.JdbcUtils.JDBCutils;
import com.dao_.dao.BasicDAO;
import com.dao_.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Signup", value = "/Signup")
public class Signup extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        String sql = "select * from yxyy.user where userName=?";
        BasicDAO<User> userBasicDAO = new BasicDAO<>();
        List<User> users = userBasicDAO.queryMultiply(sql, User.class, userName);
        HttpSession session = request.getSession();
        if (users.isEmpty()) {
            sql = "select max(userId) as userId from yxyy.user";
            users=userBasicDAO.queryMultiply(sql, User.class);
            String max=String.valueOf(Integer.parseInt(users.get(0).getUserId())+1);
            sql= "insert into yxyy.user" +
                    "(userId,userName,password,sex,age,email,phoneNum,signature,nickName,address,head,visits)" +
                    " values(?,?,?,?,?,?,?,?,?,?,?,?)";
            BasicDAO<User> basicDAO = new BasicDAO();
          int i=  basicDAO.dml(sql,max,userName,password,null,null,email,null,null,null,null,null,0);
            if(i==1){
                session.setAttribute("errorInfo", "注册成功！");
                session.setAttribute("Login", new User(max,userName,password,null,null,email,null,null,null,null,null));
                session.setAttribute("Id",0);
                response.sendRedirect("assets/jsp/login.jsp");
            }else {
                session.setAttribute("errorInfo", "注册失败！");
                response.sendRedirect("assets/jsp/signup.jsp");
            }
        }else{
            session.setAttribute("Id", 0);
            session.setAttribute("errorInfo", "注册失败！");
            session.setAttribute("Login", new User(userName,password,email));
            response.sendRedirect("assets/jsp/signup.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
