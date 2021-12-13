package com.myservers.hdindex;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.Collect;
import com.dao_.domain.Quotes;
import com.dao_.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Scyh", value = "/Scyh")
public class Scyh extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");
        //
        HttpSession session=request.getSession();
        BasicDAO<User> userBasicDAO = new BasicDAO<>();
        BasicDAO<Collect> collectBasicDAO = new BasicDAO<>();

        String userId =request.getParameter("userId");
        String currentPage =request.getParameter("currentPage");
        String sql= "select * from yxyy.user where userId=?";
        String sql1= "select * from yxyy.collect where userId=?";

        User user =userBasicDAO.querySingle(sql,User.class,userId);
        Collect  collect =collectBasicDAO.querySingle(sql1,Collect.class,userId);

        //留存一次
        if(user!=null&&collect==null){
            sql= "delete from yxyy.user  where userId=?";
            userBasicDAO.dml(sql,userId);
        }
        response.sendRedirect("/houduan/hdindex.jsp?yhpage="+currentPage+"#/user");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
