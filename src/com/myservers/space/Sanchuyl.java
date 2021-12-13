package com.myservers.space;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.Collect;
import com.dao_.domain.Quotes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
//删除语录
@WebServlet(name = "Sanchuyl", value = "/space/Sanchuyl")
public class Sanchuyl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");
        //
        HttpSession session=request.getSession();
        BasicDAO<Quotes> quotesBasicDAO = new BasicDAO<>();
        String userId =request.getParameter("userId");
        String quoteId =request.getParameter("quoteId");
        System.out.println(userId);
        System.out.println("删除语录");
        System.out.println(userId+" "+quoteId);
        String sql= "select * from yxyy.quotes where userId=? and quoteId=?";
        Quotes quotes =quotesBasicDAO.querySingle(sql,Quotes.class,userId,quoteId);
        //留存一次
        session.setAttribute("quotes",quotes);
        if(quotes!=null){
            sql= "delete from yxyy.quotes  where userId=? and quoteId=?";
            quotesBasicDAO.dml(sql,userId,quoteId);
        }
        response.sendRedirect("/assets/jsp/space.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
