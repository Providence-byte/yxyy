package com.myservers.hdindex;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Xgyh", value = "/Xgyh")
public class Xgyh extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");
        HttpSession session=request.getSession();
        BasicDAO<Object> basicDAO = new BasicDAO<>();

        String userName = request.getParameter("bjUsername");
        String password = request.getParameter("bjPassword");
        String email = request.getParameter("bjEmail");
        String userId = request.getParameter("userId");
        String currentPage = request.getParameter("currentPage");
        String sql = "update yxyy.user set " +
                "userName=?,password=?,email=?where userId=?";
        int i=basicDAO.dml(sql,userName,password,email,userId);
        if(i==1){
        }
        response.sendRedirect("/houduan/hdindex.jsp?yhpage="+currentPage+"#/user");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
