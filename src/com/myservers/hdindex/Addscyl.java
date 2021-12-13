package com.myservers.hdindex;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.Collect;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "Addscyl", value = "/Addscyl")
public class Addscyl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");
        //
        HttpSession session = request.getSession();
        BasicDAO<Collect> collectBasicDAO = new BasicDAO<>();
        BasicDAO basicDAO = new BasicDAO<>();
        String userId = request.getParameter("userId");
        String quoteId = request.getParameter("quoteId");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String sql1,sql2,sql;
        sql1 = "select * from yxyy.user where userId=?";
        sql2 = "select * from yxyy.quotes where quoteId=?";
        System.out.println(basicDAO.queryScalar(sql1,userId));
        System.out.println(basicDAO.queryScalar(sql1,userId)==null);
        if(basicDAO.queryScalar(sql1,userId)!=null&&basicDAO.queryScalar(sql2,userId)!=null){
        sql = "insert into yxyy.collect(userId,quoteId,collectTime)values(?,?,?)";
        collectBasicDAO.dml(sql, userId, quoteId, df.format(new Date()));
        }
        response.sendRedirect("/houduan/hdindex.jsp#/shoucang");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
