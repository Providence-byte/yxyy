<%@ page import="java.sql.*" %>
<%@ page import="com.dao_.dao.BasicDAO" %>
<%@ page import="com.dao_.domain.Lbt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao_.domain.Quotes" %>
<%@ page import="com.dao_.domain.Fm" %><%--
  Created by IntelliJ IDEA.
  User: YZJ
  Date: 2021/5/12
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>愈心于语</title>
    <link rel="shortcut icon" href="assets/images/logo_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/index.css">
    <link rel="stylesheet" href="assets/css/lunbo.css">
    <link rel="stylesheet" href="assets/css/barrage.css">
    <link rel="stylesheet" href="assets/css/reset.min.css">
</head>

<body>
<%


    String sql;
    //设置登录状态
    boolean state=false;
    int Id;
    if(session.getAttribute("state")==null) {
        session.setAttribute("state", false);
    }else{
        state= (boolean) session.getAttribute("state");
    }
    if(session.getAttribute("Id")!=null){
        Id =Integer.parseInt((String) session.getAttribute("Id"));
    }else{
        Id=0;
    }

%>
<div id="header">
    <div id="box"></div>
    <!-- 导航栏 -->
    <nav id="nav">
        <a href="#" id="logo">
            <img src="assets/images/logo.png" width="80px" height="60px" alt="">
        </a>
        <ul id="list-top">
            <li><a href="javascript:;" target="_blank">励志语录/</a></li>
            <li><a href="javascript:;" target="_blank">正能量语录/</a></li>
            <li><a href="javascript:;" target="_blank">经典语录/</a></li>
            <li><a href="javascript:void(0)" onclick="by1();return false;">心灵鸡汤/</a></li>
        </ul>
        <ul id="list">
            <li><a href="assets/jsp/space.jsp">个人中心</a></li>
            <%//登录成功
                if(state){

            %>
            <%
                    out.print("<li><a href=\"assets/jsp/login.jsp\" target=\"_blank\">登出</a></li>");
                }else
                {
                    out.print("<li><a href=\"assets/jsp/login.jsp\" target=\"_blank\">登录</a></li>");
                }
            %>
<%--            <li><a href="assets/jsp/login.html" target="_blank">登录</a></li>--%>
            <li><a style="cursor: pointer" class="turned2">语录</a></li>
            <li><a style="cursor: pointer" class="turned1">FM</a></li>
            <li><a style="cursor: pointer" class="turned3">阅读</a></li>
            <li><a style="cursor: pointer" onclick="by1();return false;">首页</a></li>
        </ul>
    </nav>

    <!-- 轮播图 -->
    <div id="content1">
        <div id="lunbo-list">
            <ul class="lunbo-numsBox">
                <%
                    sql = "select * from yxyy.lbt";
                    BasicDAO<Lbt> lbtBasicDAO = new BasicDAO<>();

                    List<Lbt> lbts= lbtBasicDAO.queryMultiply(sql,Lbt.class);
                    for (Lbt lbt :lbts) {
                %>
                <li><%=lbt.getBiaoti()%>
                </li>
                <%
                    }
                %>
            </ul>
        </div>

        <div id="lunbo-box">
            <div class="lunbo-inner">
                <a href="javascript:;" class="left-arrow">&lt</a>
                <a href="javascript:;" class="right-arrow">&gt</a>
                <ul class="lunbo-ul">
                    <%
                        for (Lbt lbt :lbts) {
                    %>
                    <li><img src="assets/images/<%=lbt.getImage()%>" alt=""></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="content2">
    <div class="title">
        <h1>语录分享</h1>
        <a href="/assets/jsp/space.jsp">发布文章>></a>
    </div>
    <div class="left-box">
        <ul>
            <%
                sql = "select * from yxyy.quotes where  qpublic='1' order by publishTime desc ,quoteId desc";
                BasicDAO<Quotes> quotesBasicDAO = new BasicDAO<Quotes>();
                List<Quotes> quotes=quotesBasicDAO.queryMultiply(sql,Quotes.class);
                String quoteId;
                for (Quotes quotes1 :quotes) {
                    int suiji= (int) (Math.random()*28+1);
                    quoteId=quotes1.getQuoteId();
            %>
            <li>
                <div class="media">
                    <div class="media-left">
                        <a href="/Cknr?userId=<%=Id%>&quoteId=<%=quoteId%>">
<%--                            <img class="media-object" src="assets/images/<%=rs.getString("img")%>" width="120px" height="100px" alt="...">--%>
                            <img class="media-object" src="assets/images/ylt_ (<%=suiji%>).jpg" width="120px" height="110px" alt="...">
                        </a>
                    </div>
                    <div class="media-body ">
                        <h4 class="media-heading font3"><%=quotes1.getCaption()%>
                        </h4>
                        <%=quotes1.getContent()%>
                    </div>
                </div>
                <div class="btn-group position-right" role="group" aria-label="...">
                    <button type="button" class="btn btn-primary ">阅读全文</button>
                </div>
            </li>
            <%
                }
            %>
        </ul>
    </div>
    <div class="right-box">
        <h4>热门文章</h4>
        <span class="underline">
                <ul>

                    <%
                        sql = "select * from yxyy.quotes  order by hotindex desc";
                        quotes=quotesBasicDAO.queryMultiply(sql,Quotes.class);
                        int i = 1;
                        for (Quotes quotes1 :quotes) {
                            quoteId=quotes1.getQuoteId();
                            if (i <= 3) {
                    %>
                        <li><span class="bgc-red"><%=i%></span><a href="/Cknr?userId=<%=Id%>&quoteId=<%=quoteId%>"><%=quotes1.getCaption()%></a></li>
                    <%
                    } else {
                    %>
                        <li><span><%=i%></span><a href="/Cknr?userId=<%=Id%>&quoteId=<%=quoteId%>"><%=quotes1.getCaption()%></a> </li>
                    <%
                            }
                            if(i==10){
                                break;
                            }
                            i++;
                        }
                    %>
                </ul>
          </span>
    </div>


</div>
<div id="content3">
    <div class="title">
        <h1>心理FM</h1>
        <a href="javascript:;">查看更多>></a>
    </div>

    <ul>
        <%
            sql = "select * from yxyy.fm";
            BasicDAO<Fm> fmBasicDAO = new BasicDAO<Fm>();
            List<Fm> fms=fmBasicDAO.queryMultiply(sql,Fm.class);

            i=0;
            for (Fm fm :fms) {
                i++;
                    if(i>4){
                        break;
                    }
        %>
        <li><img class="bg-img" src="<%=fm.getJjimage()%>" alt="">
            <p><%=fm.getJianjie()%></p>
            <div class="author">
                <div class="avatar"><img src="<%=fm.getGeimage()%>" alt=""></div>
                <h3><%=fm.getGequ()%></h3>
                <a href="<%=fm.getA()%>" title="点击播放"><span class="iconfont">&#xe60c;</span></a>
            </div>
        </li>
        <%
            }
        %>


    </ul>
</div>
<button id="backTop">^</button>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<script src="js/header.js" type="text/javascript"></script>
<script src="js/lunbo.js" type="text/javascript"></script>
<script type="text/javascript">

    let turned1 =document.querySelector('.turned1');
    let turned2 =document.querySelector('.turned2');
    let turned3 =document.querySelector('.turned3');
    let content2 = document.querySelector('#content2')
    let content3 = document.querySelector('#content3')
    turned1.addEventListener('click',()=>{
        content3.scrollIntoView({block: "start", behavior:'smooth' })
    })
    turned2.addEventListener('click',()=>{
        content2.scrollIntoView({block: "start", behavior:'smooth' })
    })
    turned3.addEventListener('click',()=>{
        content2.scrollIntoView({block: "start", behavior:'smooth' })
    })
</script>
</body>

</html>
