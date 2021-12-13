package com.myservers.hdindex;

import com.dao_.dao.BasicDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Xgyl", value = "/Xgyl")
public class Xgyl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");
        HttpSession session=request.getSession();
        BasicDAO<Object> basicDAO = new BasicDAO<>();

        String userName = request.getParameter("yl-bjUsername");
        String caption = request.getParameter("yl-bjTitle");
        String content = request.getParameter("yl-bjZhengwen");
        String userId = request.getParameter("userId");
        String quoteId = request.getParameter("quoteId");
        String currentPage = request.getParameter("currentPage");
        String sql = "update yxyy.quotes set " +
                "userId=?,caption=?,content=?where userId=? and quoteId=?";
        int i=basicDAO.dml(sql,userName,caption,content,userId,quoteId);
        response.sendRedirect("/houduan/hdindex.jsp?ylpage="+currentPage+"#/yulu");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
