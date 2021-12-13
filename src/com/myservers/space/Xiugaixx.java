package com.myservers.space;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
//修改信息功能
@WebServlet(name = "Xiugaixx", value = "/space/Xiugaixx")
public class Xiugaixx extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");
        HttpSession session=request.getSession();
        BasicDAO<Object> basicDAO = new BasicDAO<>();

        String head = request.getParameter("head");
        String nickName = request.getParameter("nickName");
        String signature = request.getParameter("signature");
        String age = request.getParameter("age");
        String phoneNum = request.getParameter("phoneNum");
        String sex = request.getParameter("sex");
        String address = request.getParameter("address");
//        if(head==null){
//            head="head1.jpg";
//        }
//        if(sex==null){
//            sex="男";
//        }
        String Id =  (String) session.getAttribute("Id");
        String sql = "update yxyy.user set " +
                "head=?,nickName=?,signature=?,age=?,phoneNum=?,sex=?,address=? where userId=?";
        int i=basicDAO.dml(sql,head,nickName,signature,age,phoneNum,sex,address,Id);
        if(i==1){
            User user = (User) session.getAttribute("User");
            user.Xg(head,nickName,signature,age,phoneNum,sex,address);
            session.setAttribute("User",user);
        }
        response.sendRedirect("/assets/jsp/space.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
