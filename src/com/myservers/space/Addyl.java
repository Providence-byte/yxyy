package com.myservers.space;

import com.dao_.dao.BasicDAO;
import com.dao_.domain.Quotes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "Addyl", value = "/space/Addyl")
public class Addyl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=gb2312");

        String sql;
        HttpSession session = request.getSession();
        String qpublic = request.getParameter("ispublic");
        System.out.println("qpublic"+qpublic);
//        if (!"1".equals(qpublic)) {
//            qpublic = "0";
//        }else{
//            qpublic = "1";
//        }
        String content = request.getParameter("content");
        String caption = request.getParameter("caption");
        String Id = (String) session.getAttribute("Id");
//        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        BasicDAO<Quotes> quotesBasicDAO = new BasicDAO<>();
        sql = "select max(quoteId) as quoteId from yxyy.quotes";
//        int yls = ((Long) userBasicDAO.queryScalar(sql, Id)).intValue();
        System.out.println(quotesBasicDAO.queryScalar(sql).getClass());
        System.out.println(quotesBasicDAO.queryScalar(sql));
        int max =  (Integer) quotesBasicDAO.queryScalar(sql) + 1;

//        String max=String.valueOf(Integer.parseInt((String) quotesBasicDAO.queryScalar(sql))+1);
        sql = "insert into yxyy.quotes" +
                "(quoteId,userId,publishTime,qpublic,content,caption,hotindex)" +
                " values(?,?,?,?,?,?,?)";
        int i = quotesBasicDAO.dml(sql, max, Id, df.format(new Date()), qpublic, content, caption,0);
        response.sendRedirect("/assets/jsp/space.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
