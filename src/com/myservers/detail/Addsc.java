package com.myservers.detail;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.Collect;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLClientInfoException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "Addsc", value = "/Addsc")
public class Addsc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");
        //
        HttpSession session=request.getSession();
        BasicDAO<Collect> collectBasicDAO = new BasicDAO<>();
        String userId =request.getParameter("userId");
        String quoteId =request.getParameter("quoteId");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String sql="insert into yxyy.collect(userId,quoteId,collectTime)values(?,?,?)";
        collectBasicDAO.dml(sql,userId,quoteId,df.format(new Date()));

        String url = "/assets/jsp/detail.jsp?quoteId="+quoteId;
//        request.getRequestDispatcher(url).forward(request, response);
        response.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
