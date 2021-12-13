package com.myservers.hdindex;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.Collect;
import com.dao_.domain.Quotes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Scsc", value = "/Scsc")
public class Scsc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");
        //
        HttpSession session=request.getSession();
        BasicDAO<Collect> collectBasicDAO = new BasicDAO<>();
        String userId =request.getParameter("userId");
        String quoteId = request.getParameter("quoteId");

        String currentPage =request.getParameter("currentPage");
        System.out.println(userId);
        String sql= "select * from yxyy.collect where userId=? and quoteId=?";
        Collect collect =collectBasicDAO.querySingle(sql,Collect.class,userId,quoteId);
        //留存一次
        if(collect!=null){
            sql= "delete from yxyy.collect  where userId=? and quoteId=?";
            collectBasicDAO.dml(sql,userId,quoteId);
        }
        response.sendRedirect("/houduan/hdindex.jsp?shoucang="+currentPage+"#/shoucang");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
