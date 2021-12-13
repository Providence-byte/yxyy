package com.myservers.detail;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.Quotes;
import com.dao_.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
//查看内容
@WebServlet(name = "Cknr", value = "/Cknr")
public class Cknr extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");

        String sql;
        HttpSession session = request.getSession();
        String userId = request.getParameter("userId");
        String quoteId = request.getParameter("quoteId");
        String Id = (String) session.getAttribute("Id");
        System.out.println(userId+"##"+quoteId+"##"+Id);
        String fx = request.getParameter("fx");//方向0前 1后
        BasicDAO<Quotes> quotesBasicDAO = new BasicDAO<>();
        BasicDAO<User> userBasicDAO = new BasicDAO<>();
        if(!"0".equals(Id)&&Id!=null){//已登录
            sql = "select *  from yxyy.user where userId=?";
            User user=userBasicDAO.querySingle(sql,User.class,Id);
            sql = "update yxyy.user set visits=? where userId=?";
            int visits=Integer.valueOf(user.getVisits())+1;
            //用户浏览数+1
            userBasicDAO.dml(sql,visits,Id);
            sql = "select *  from yxyy.quotes where quoteId=?";
            Quotes quotes=quotesBasicDAO.querySingle(sql,Quotes.class,quoteId);
            sql = "update yxyy.quotes set hotindex=? where quoteId=?";
            int hotindex=Integer.valueOf(quotes.getHotindex())+1;
            //语录被浏览数+1
            quotesBasicDAO.dml(sql,hotindex,quoteId);
        }
        Quotes quotes;
        if("0".equals(fx)){//前一个
            sql = "select *  from yxyy.quotes where quoteId<? and qpublic=1  order by quoteId desc limit 1";
            quotes=quotesBasicDAO.querySingle(sql,Quotes.class,quoteId);
            quoteId=quotes.getQuoteId();
        }else if ("1".equals(fx)){//后一个
            sql = "select *  from yxyy.quotes where quoteId>? and qpublic=1  order by quoteId limit 1";
            quotes=quotesBasicDAO.querySingle(sql,Quotes.class,quoteId);
            quoteId=quotes.getQuoteId();
        }



        String url = "/assets/jsp/detail.jsp?quoteId="+quoteId;
//        request.getRequestDispatcher(url).forward(request, response);
        response.sendRedirect(url);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
