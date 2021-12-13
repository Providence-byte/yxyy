package com.myservers.hdindex;

import com.dao_.dao.BasicDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Xgsc", value = "/Xgsc")
public class Xgsc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");
        HttpSession session=request.getSession();
        BasicDAO<Object> basicDAO = new BasicDAO<>();

        String yl = request.getParameter("yl-addUsername");
        String Id = request.getParameter("yl-yhm");
        String collectTime = request.getParameter("yl-addTitle");
        String userId = request.getParameter("userId");
        String quoteId = request.getParameter("quoteId");
        String currentPage = request.getParameter("currentPage");
        String sql = "update yxyy.collect set " +
                "userId=?,quoteId=?,collectTime=?where userId=? and quoteId=?";
        int i=basicDAO.dml(sql,Id,yl,collectTime,userId,quoteId);
        response.sendRedirect("/houduan/hdindex.jsp?shoucang="+currentPage+"#/shoucang");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
