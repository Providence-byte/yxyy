package com.myservers.hdindex;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.Collect;
import com.dao_.domain.Quotes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Scyl", value = "/Scyl")
public class Scyl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");
        //
        HttpSession session=request.getSession();
        BasicDAO<Quotes> quotesBasicDAO = new BasicDAO<>();
        BasicDAO<Collect> collectBasicDAO = new BasicDAO<>();
        String userId =request.getParameter("userId");
        String quoteId = request.getParameter("quoteId");

        String currentPage =request.getParameter("currentPage");
        System.out.println(userId);
        System.out.println("删除语录");
        String sql= "select * from yxyy.quotes where userId=? and quoteId=?";
        String sql1= "select * from yxyy.collect where quoteId=?";
        Quotes quotes =quotesBasicDAO.querySingle(sql,Quotes.class,userId,quoteId);
        Collect  collect =collectBasicDAO.querySingle(sql1,Collect.class,quoteId);
        //留存一次
        if(quotes!=null&&collect==null){
            sql= "delete from yxyy.quotes  where userId=? and quoteId=?";
            quotesBasicDAO.dml(sql,userId,quoteId);
        }
        response.sendRedirect("/houduan/hdindex.jsp?ylpage="+currentPage+"#/yulu");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
