<%@ page import="com.dao_.domain.Quotes" %>
<%@ page import="com.dao_.dao.BasicDAO" %>
<%@ page import="com.dao_.domain.Collect" %><%--
  Created by IntelliJ IDEA.
  User: YZJ
  Date: 2021/7/1
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>愈心于语-文章详情</title>
    <link rel="stylesheet" href="../css/reset.min.css">
    <link rel="stylesheet" href="../css/detail.css">
</head>

<body>

<%
    //设置登录状态
    boolean state = false;
    if (session.getAttribute("state") == null) {
        session.setAttribute("state", false);
    } else {
        state = (boolean) session.getAttribute("state");
    }
%>
<nav id="nav">
    <a href="/index.jsp" id="logo">
        <img src="/assets/images/logo.png" width="80px" height="60px" alt="">
    </a>
    <ul id="list-top">
        <li><a href="javascript:;" target="_blank">励志语录/</a></li>
        <li><a href="javascript:;" target="_blank">正能量语录/</a></li>
        <li><a href="javascript:;" target="_blank">经典语录/</a></li>
        <li><a href="javascript:void(0)" onclick="by1();return false;">心灵鸡汤/</a></li>
    </ul>
    <ul id="list">
        <li><a href="space.jsp">个人中心</a></li>
        <%
            //登录成功
            if (state) {

        %>
        <%
                out.print("<li><a href=\"assets/jsp/login.jsp\" target=\"_blank\">登出</a></li>");
            } else {
                out.print("<li><a href=\"assets/jsp/login.jsp\" target=\"_blank\">登录</a></li>");
            }
        %>
        <%--            <li><a href="assets/jsp/login.html" target="_blank">登录</a></li>--%>
        <li><a href="javascript:void(0)" onclick="by1();return false;">咨询</a></li>
        <li><a href="javascript:;" target="_blank">测试</a></li>
        <li><a href="javascript:;" target="_blank">FM</a></li>
        <li><a href="javascript:;" target="_blank">倾诉</a></li>
        <li><a href="javascript:;" target="_blank">阅读</a></li>
        <li><a href="/index.jsp" onclick="by1();return false;">首页</a></li>
<%--        <li><a href="javascript:void(0)" onclick="by1();return false;">首页</a></li>--%>
    </ul>
</nav>
<div id="detail-bg">
    <div class="detail-content">
        <%
            String userId = request.getParameter("userId");
            String quoteId = request.getParameter("quoteId");
            String Id = (String) session.getAttribute("Id");
            System.out.println(userId + "#" + quoteId + "*" + Id);
            BasicDAO<Quotes> quotesBasicDAO = new BasicDAO<Quotes>();
            String sql;
            sql = "select * from yxyy.quotes where quoteId=?";
            Quotes quotes = quotesBasicDAO.querySingle(sql, Quotes.class, quoteId);
            int suiji = (int) (Math.random() * 28 + 1);
        %>
        <h1><%=quotes.getCaption()%>
        </h1>
        <span></span>
        <h2>正能量语录网收录“<%=quotes.getCaption()%>”，希望对您有所启迪，下面随小编一起来看下“<%=quotes.getCaption()%>”吧。</h2>
        <%--        <img src="../images/lunbo_1.png" alt="">--%>
        <img src="../images/ylt_ (<%=suiji%>).jpg" width="100%" height="154px"
             style="min-height: 184px"
             alt="">
        <p>
            <%=quotes.getContent()%>
        </p>
        <div class="detail-btn-group1" style="width: 80%;
                height: 80px;
            display: flex;
            align-items: center;
            justify-content: flex-start;">
            <%
                if (!"0".equals(Id)&&Id!=null) {
                    BasicDAO<Collect> collectBasicDAO = new BasicDAO<>();
                    sql = "select * from yxyy.collect where userId=? and quoteId=?";
                    Collect collect = collectBasicDAO.querySingle(sql, Collect.class, Id, quoteId);
                    if (collect == null) {
            %>
            <a href="/Addsc?userId=<%=Id%>&quoteId=<%=quoteId%>" style="
                display: block;
                text-align: center;
                line-height: 40px;
                width: 100px;
                height: 40px;
                background-color: rgb(105,179,108);
                border: none;
                border-radius: 5px;
                color: #fff;
                cursor: pointer;
                font-size: 16px;
                margin: 0 auto;
                width: 180px;
                background-color: #3f8adb;">
                收藏
            </a>
            <%
            } else {
            %>
            <a href="/Qxsc?userId=<%=Id%>&quoteId=<%=quoteId%>" style="
                display: block;
                text-align: center;
                line-height: 40px;
                width: 100px;
                height: 40px;
                background-color: rgb(105,179,108);
                border: none;
                border-radius: 5px;
                color: #fff;
                cursor: pointer;
                font-size: 16px;
                margin: 0 auto;
                width: 180px;
                background-color: #999;">
                取消收藏
            </a>
            <%

                    }
                }
            %>
        </div>
        <div class="detail-btn-group">
            <%
                //前一个
                sql = "select *  from yxyy.quotes where quoteId<? and qpublic=1  order by quoteId desc limit 1";
                quotes = quotesBasicDAO.querySingle(sql, Quotes.class, quoteId);

                if (quotes != null) {
            %>
            <a href="/Cknr?userId=<%=userId%>&quoteId=<%=quoteId%>&fx=0" style="display: block;
    text-align: center;
    line-height: 40px;
    width: 100px;
    height: 40px;
    background-color: rgb(105,179,108);
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    font-size: 16px;
margin-right: 80%;">&lt;&lt;上一篇</a>
            <%

                }
                //后一个
                sql = "select *  from yxyy.quotes where quoteId>? and qpublic=1  order by quoteId limit 1";
                quotes = quotesBasicDAO.querySingle(sql, Quotes.class, quoteId);
                if (quotes != null) {

            %>
            <a href="/Cknr?userId=<%=userId%>&quoteId=<%=quoteId%>&fx=1" style=" display: block;
    text-align: center;
    line-height: 40px;
    width: 100px;
    height: 40px;
    background-color: rgb(105,179,108);
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    font-size: 16px;">下一篇&gt;&gt;</a>
            <%
                }

            %>

            <!--                <button>收藏</button>-->

        </div>

    </div>
</div>
</body>

</html>
