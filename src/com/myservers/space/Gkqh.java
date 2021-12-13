package com.myservers.space;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.Quotes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
//公开切换
@WebServlet(name = "Gkqh", value = "/space/Gkqh")
public class Gkqh extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");

        String sql;
        HttpSession session = request.getSession();
        String userId = request.getParameter("userId");
        String quoteId = request.getParameter("quoteId");
        String qpublic = request.getParameter("qpublic");

        if ("1".equals(qpublic)) {
            qpublic = "0";
        } else {
            qpublic = "1";
        }
        System.out.println("qpublic" + qpublic);
//        String Id = (String) session.getAttribute("Id");
        BasicDAO<Quotes> quotesBasicDAO = new BasicDAO<>();
        sql = "update yxyy.quotes set qpublic=? where userId=? and quoteId=?";
        int i = quotesBasicDAO.dml(sql, qpublic,userId,quoteId);
        response.sendRedirect("/assets/jsp/space.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
