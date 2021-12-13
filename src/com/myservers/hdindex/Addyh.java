package com.myservers.hdindex;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Addyh", value = "/Addyh")
public class Addyh extends HttpServlet {
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

        }
        response.sendRedirect("/houduan/hdindex.jsp#/user");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
