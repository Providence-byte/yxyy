package com.myservers.ajax;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "UserCheck", value = "/UserCheck")
public class UserCheck extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname=request.getParameter("username");
        System.out.println("#"+uname+"#" );
        String sql = "select * from yxyy.user where userName=?";
        BasicDAO<User> userBasicDAO = new BasicDAO<>();
        List<User> user = userBasicDAO.queryMultiply(sql, User.class,uname);
        System.out.println("#"+user+"#");
        PrintWriter out = response.getWriter();
        if(!user.isEmpty()){
            out.print("<p style=\"color: #f00;padding-left: 60px\">用户名被占用</p>");
        }else{
            out.print("<p style=\"color: #0f0;padding-left: 60px\">恭喜您，该用户名可以使用</p>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
