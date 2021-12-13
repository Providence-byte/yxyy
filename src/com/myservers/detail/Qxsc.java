package com.myservers.detail;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.Collect;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Qxsc", value = "/Qxsc")
public class Qxsc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");
        //
        HttpSession session=request.getSession();
        BasicDAO<Collect> collectBasicDAO = new BasicDAO<>();
        String userId =request.getParameter("userId");
        String quoteId =request.getParameter("quoteId");

        String sql= "select * from yxyy.collect where userId=? and quoteId=?";
        Collect collect =collectBasicDAO.querySingle(sql,Collect.class,userId,quoteId);
        //留存一次
        session.setAttribute("collect",collect);
        if(collect!=null){
            sql= "delete from yxyy.collect  where userId=? and quoteId=?";
            collectBasicDAO.dml(sql,userId,quoteId);
        }
        String url = "/assets/jsp/detail.jsp?quoteId="+quoteId;
//        request.getRequestDispatcher(url).forward(request, response);
        response.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
