<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.dao_.domain.Fm" %>
<%@ page import="com.dao_.dao.BasicDAO" %>
<%@ page import="com.dao_.domain.Quotes" %>
<%@ page import="com.dao_.domain.User" %>
<%@ page import="com.dao_.domain.Collect" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: YZJ
  Date: 2021/7/5
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>愈心于语-后台管理</title>
    <link
            rel="shortcut icon"
            href="assets/images/logo_favicon.ico"
            type="image/x-icon"
    />
    <link
            rel="stylesheet/less"
            type="text/css"
            href="./assets/css/common.less"
    />
    <link
            rel="stylesheet/less"
            type="text/css"
            href="./assets/css/index.less"
    />
    <script>
        less = {
            env: "development",
        };
    </script>
    <script src="./js/less.js" data-env="development"></script>
</head>

<body>
<%
    String sql;
%>
<div id="nav">
    <div class="title">愈心于语-后台管理</div>
    <a href="javascript:;" class="turn-sidebar"
    ><span class="iconfont">&#xe645;</span></a
    >
    <div class="username">
        admin1 <span>▼</span>
        <ul class="admin-op">
            <li><a href="">切换账号</a></li>
            <li><a href="">退出登录</a></li>
        </ul>
    </div>
    <a href="/index.jsp" class="gotoindex">前台首页</a>
</div>
<div id="main">
    <div class="sidebar spread-side">
        <ul class="sidebar-list">
            <li>
                <a href="#/user"
                ><span class="iconfont" title="">&#xe608;</span>
                    <p>用户管理<b>&gt;</b></p></a
                >
            </li>
            <li>
                <a href="#/yulu"
                ><span class="iconfont" title="">&#xe6e7;</span>
                    <p>语录管理<b>&gt;</b></p></a
                >
            </li>
            <li>
                <a href="#/shoucang"
                ><span class="iconfont" title="">&#xe6e7;</span>
                    <p>收藏管理<b>&gt;</b></p></a
                >
            </li>
        </ul>
    </div>
    <div class="content">
        <div class="bread">
            <a href="#/home" class="gotohome"
            ><span class="iconfont">&#xe622;</span>我的主页</a
            >
            <div class="content-tab"></div>
        </div>
    </div>
</div>
</body>
<%
    User root=(User) session.getAttribute("User");
%>
<script type="text/javascript">
    const turnSidebar = document.querySelector('.turn-sidebar');
    const sidebar = document.querySelector('.sidebar');
    const sidebarList1 = document.querySelector('.sidebar-list');
    const spans = sidebarList1.querySelectorAll('span');

    turnSidebar.addEventListener('click', () => {
        if (sidebar.className === 'sidebar spread-side') {
            sidebar.className = 'sidebar shrink-side'
            spans[0].title = "用户管理"
            spans[1].title = "语录管理"
            spans[2].title = "FM管理"
        } else {
            sidebar.className = 'sidebar spread-side'
            spans[0].title = ""
            spans[1].title = ""
            spans[2].title = ""
        }
    })
</script>
<script type="text/javascript">
    const side1 = `<div class="content-tab-1 sel-ctt">
            <div class="welcome">
                     <%
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
                    df.format(new Date());
                %>
                <div>
                    <p>欢迎管理员：<span><%=root.getUserName()%></span> ! 今天的日期是：<%=df.format(new Date())%>
                    </p>
                </div>
                </div>
                <div class="stats">
                    <div>数据统计</div>
                    <div>
                    <%
                        BasicDAO<Quotes> quotesBasicDAO = new BasicDAO<>();
                        sql = "select count(*) from yxyy.quotes";
                        int qcount = ((Long) quotesBasicDAO.queryScalar(sql)).intValue();
                    %>
                    <ul>
                        <li>文章数量（篇）<p><%=qcount%>
                        </p>
                        </li>
                        <%
                            BasicDAO<User> userBasicDAO = new BasicDAO<>();
                            sql = "select count(*) from yxyy.user";
                            int ucount = ((Long) userBasicDAO.queryScalar(sql)).intValue();
                        %>
                        <li>会员数量（个）<p><%=ucount%>
                        </p>
                        </li>
                        <%
                            BasicDAO<Collect> collectBasicDAO = new BasicDAO<>();
                            sql = "select count(*) from yxyy.collect";
                            int ccount = ((Long) collectBasicDAO.queryScalar(sql)).intValue();
                        %>
                        <li>收藏数量（篇）<p><%=ccount%>
                        </p>
                        </li>
                        <%
                            sql = "select sum(visits) from yxyy.user";
                            BigDecimal b = (BigDecimal) userBasicDAO.queryScalar(sql);

                            int vcount = b.intValue();
//              int vcount= ((Long) userBasicDAO.queryScalar(sql)).intValue();
                        %>
                        <li>浏览数量（次）<p><%=vcount%>
                        </p>
                        </li>
                        <%
                            BasicDAO<Fm> fmBasicDAO = new BasicDAO<>();
                            sql = "select count(*) from yxyy.fm";
                            int fcount = ((Long) fmBasicDAO.queryScalar(sql)).intValue();
                        %>
                        <li>FM数量（首）<p><%=fcount%>
                        </p>
                        </li>
                    </ul>

                    </div>
                </div>
                <div class="system">
                    <div>系统信息</div>
                    <div class="details">
                        <table border="1">
                        <tr>
                            <td class="table-left">当前系统版本</td>
                            <td>1.0.180420</td>
                        </tr>
                        <tr>
                            <td class="table-left">服务器地址</td>
                            <td>kungeyyds.com</td>
                        </tr>
                        <tr>
                            <td class="table-left">操作系统</td>
                            <td>Window10</td>
                        </tr>
                        <tr>
                            <td class="table-left">运行环境</td>
                            <td>Apache/2.4.23 (Win32) OpenSSL/1.0.2j mod_fcgid/2.3.9</td>
                        </tr>
                        <tr>
                            <td class="table-left">Tomcat版本</td>
                            <td>apache-tomcat-9.0.39</td>
                        </tr>
                        <tr>
                            <td class="table-left">MySQL版本</td>
                            <td>8.0.22 MySQL</td>
                        </tr>
                        <tr>
                            <td class="table-left">上传附件限制</td>
                            <td>2M</td>
                        </tr>
                        <tr>
                            <td class="table-left">剩余空间</td>
                            <td>86015.2M</td>
                        </tr>
                    </table>
                    </div>
                </div>
                <div class="team">
                    <div>开发团队</div>
                    <div class="details">
                        <table border="1">
                            <tr>
                                <td class="table-left">版权所有</td>
                                <td>愈心于语官网（yysy.com）</td>
                            </tr>
                            <tr>
                                <td class="table-left">开发者团队</td>
                                <td>姚振杰，张坤，孙洋，李硕磊</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>`;
    const side2 = `<div class="content-tab-2 sel-ctt">
            <div class="userManage">
                    <div class="u-search">
                        <form action="/hd/hdindex.jsp#/user">
                        <%
                            String yhm = request.getParameter("yhm");
                            System.out.println("yhm="+yhm+"#");
                             String sql1;
                            if(yhm==null||"".equals(yhm)){
                            sql1 = "select * from yxyy.user";
                        %>
                            <label for=""><input type="text" placeholder="请输入用户名" name="yhm"><input type="submit"
                                    value="搜索"></label>
                         <%
                             }else{
                                sql1 = "select * from yxyy.user where userName like '%"+yhm+"%'";
                         %>
                         <label for=""><input type="text" placeholder="请输入用户名" name="yhm" value="<%=yhm%>"><input type="submit"
                                    value="搜索"></label>
                         <%
                            }
                         %>
                        </form>
                    </div>
                    <div class="u-operate">
                        <a href=""><span class="iconfont">&#xe614;</span>批量删除</a>
                        <a href=""><span class="iconfont">&#xe66c;</span>添加</a>
                        <a href=""><span class="iconfont">&#xe692;</span>刷新</a>
                    </div>
                    <div class="u-table">
                        <table>
                            <tbody>
                        <tr>
                            <td><input type="checkbox">全选</td>
                            <td>用户ID</td>
                            <td>用户名</td>
                            <td>邮箱</td>
                            <td>语录数</td>
                            <td>浏览数</td>
                            <td>收藏数</td>
                            <td>操作</td>
                        </tr>
                        <%
                            List<User> users;
                            int pageSize, totalSize, totalPage, currentPage, i, yid, dq;
                            String strPage;
                            pageSize = 7;
                            strPage = request.getParameter("yhpage");

                            if (strPage == null) {
                                currentPage = 1;
                            } else {
                                currentPage = Integer.parseInt(strPage);
                            }
//                            if (request.getParameter("yhm") == null||"".equals(yhm)) {
//                                sql1 = "select * from yxyy.user";
//
//                            } else {
//                               sql1 = "select * from yxyy.user where userId like '% "+yhm+" %'";
//
//                            }
                            users = userBasicDAO.queryMultiply(sql1, User.class);
                            User[] users1 = users.toArray(new User[users.size()]);
                            totalSize = users1.length;
                            totalPage = (totalSize + pageSize - 1) / pageSize;
                            if (totalPage >= 0) {

                                int yls, scs, id;
                                yid = ((currentPage - 1) * pageSize);
                                i = 0;
                                User user;
                                for (; i < pageSize ; i++, yid++) {
                                    if(yid < users.size()){
                                    user = users1[yid];
                                    id = Integer.valueOf(user.getUserId());
                                    sql = "select count(*) from yxyy.quotes where userId=?";
                                    yls = ((Long) quotesBasicDAO.queryScalar(sql, id)).intValue();
                                    sql = "select count(*) from yxyy.collect where userId=?";
                                    scs = ((Long) collectBasicDAO.queryScalar(sql, id)).intValue();
                        %>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td><%=id%>
                            </td>
                            <td><%=user.getUserName()%>
                            </td>
                            <td><p style=" text-overflow:ellipsis;
                  overflow: hidden;
                  white-space: nowrap;
                    width:140px ;
                  "><%=user.getEmail()%></p>
                            </td>
                            <td><%=yls%>
                            </td>
                            <td><%=user.getVisits()%>
                            </td>
                            <td><%=scs%>
                            </td>
                            <td>
                                <a href="" title="编辑"><span class="iconfont">&#xe610;</span></a>
                                <a href="" title="删除"><span class="iconfont">&#xe614;</span></a>
                            </td>
                        </tr>
                        <%
                                }else {
                                        out.print("<tr><td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");

                                }
                                    }
                            }
                        %>
                        </tbody>
                        </table>
                    </div>
                    <div class="u-page">
                       <ul>
                        <%
                            if (currentPage - 1 > 0) {
                        %>
                        <li><a href="/hd/hdindex.jsp?yhpage=<%=currentPage-1%>#/user">&lt;&lt;</a></li>
                        <%
                            }
                        %>
                        <li class="highLight"><a href="/hd/hdindex.jsp?yhpage=<%=currentPage%>#/user"><%=currentPage%>
                        </a></li>
                        <%
                            i = 0;
                            dq = currentPage + 1;
                            while (dq <= totalPage && i < 4) {
                        %>
                        <li><a href="/hd/hdindex.jsp?yhpage=<%=dq%>#/user"><%=dq%>
                        </a></li>
                        <% dq++;
                            i++;
                        }
                        %>
                        <%
                            if (currentPage + 1 <= totalPage) {
                        %>
                        <li><a href="/hd/hdindex.jsp?yhpage=<%=currentPage+1%>#/user">&gt;&gt;</a></li>
                        <%
                            }
                        %>
                    </ul>
                    <%
                    if(totalPage!=currentPage&&totalPage!=0){
                    %>
                    <a href="/hd/hdindex.jsp?yhpage=<%=totalPage%>#/user" class="u-all-page"><%=totalPage%>
                    </a>
                    <%
                    }
                    %>
                    </div>
                </div>
            </div>`;
    const side3 = `<div class="content-tab-3 sel-ctt">
                 <div class="userManage">
                    <div class="u-search">
                        <form action="/hd/hdindex.jsp#/yulu">
                             <%
                            String yl = request.getParameter("yl");
                            System.out.println("yhm="+yhm+"#");
                            if(yl==null||"".equals(yl)){
                            sql1 = "select * from yxyy.quotes";
                        %>
                            <label for=""><input type="text" placeholder="请输入语录ID" name="yl"><input type="submit"
                                    value="搜索"></label>
                         <%
                             }else{
                                sql1 = "select * from yxyy.quotes where quoteId like '%"+yl+"%'";
                         %>
                         <label for=""><input type="text" placeholder="请输入语录ID" name="yl" value="<%=yl%>"><input type="submit"
                                    value="搜索"></label>
                         <%
                            }
                         %>
                        </form>
                    </div>
                    <div class="u-operate">
                        <a href=""><span class="iconfont">&#xe614;</span>批量删除</a>
                        <a href=""><span class="iconfont">&#xe66c;</span>添加</a>
                        <a href=""><span class="iconfont">&#xe692;</span>刷新</a>
                    </div>
                    <div class="u-table">
                        <table>
                            <tbody>
                        <tr>
                            <td><input type="checkbox">全选</td>
                            <td>语录ID</td>
                            <td>用户ID</td>
                            <td>发布时间</td>
                            <td>是否公开</td>
                            <td>收藏数</td>
                            <td>热度</td>
                            <td>操作</td>
                        </tr>
                        <%
                            List<Quotes> quotes;
                            pageSize = 7;
                            strPage = request.getParameter("ylpage");
                            if (strPage == null) {
                                currentPage = 1;
                            } else {
                                currentPage = Integer.parseInt(strPage);
                            }
                            quotes = quotesBasicDAO.queryMultiply(sql1, Quotes.class);
                            Quotes[] quotes1 = quotes.toArray(new Quotes[quotes.size()]);
                            totalSize = quotes1.length;
                            totalPage = (totalSize + pageSize - 1) / pageSize;
                            if (totalPage >= 0) {

                                int yls, ylid, id, scs;
                                yid = ((currentPage - 1) * pageSize);
                                i = 0;
                                Quotes quote;
                                for (; i < pageSize ; i++, yid++) {

                                    if(yid < quotes.size()){
                                    quote = quotes1[yid];
                                    ylid = Integer.valueOf(quote.getQuoteId());
                                    id = Integer.valueOf(quote.getUserId());
                                    sql = "select count(*) from yxyy.collect where quoteId=?";
                                    scs = ((Long) collectBasicDAO.queryScalar(sql, ylid)).intValue();
                                    String gk;
                                    if ("1".equals(quote.getQpublic())) {
                                        gk = "公开";
                                    } else {
                                        gk = "尚未公开";
                                    }
                        %>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td><%=ylid%>
                            </td>
                            <td><%=id%>
                            </td>
                            <td><%=quote.getPublishTime()%>
                            </td>
                            <td>
                                <%=gk%>
                            </td>
                            <td><%=scs%>
                            </td>
                            <td><%=quote.getHotindex()%>
                            </td>
                            <td>
                                <a href="" title="编辑"><span class="iconfont">&#xe610;</span></a>
                                <a href="" title="删除"><span class="iconfont">&#xe614;</span></a>
                            </td>
                        </tr>
                        <%
                                }else{
                                        out.print("<tr><td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                                }

                                }
                            }
                        %>
                        </tbody>
                        </table>
                    </div>
                    <div class="u-page">
                      <ul>
                        <%
                            if (currentPage - 1 > 0) {
                        %>
                        <li><a href="/hd/hdindex.jsp?ylpage=<%=currentPage-1%>#/yulu">&lt;&lt;</a></li>
                        <%
                            }
                        %>
                        <li class="highLight"><a href="/hd/hdindex.jsp?ylpage=<%=currentPage%>#/yulu"><%=currentPage%>
                        </a></li>
                        <%
                            i = 0;
                            dq = currentPage + 1;
                            while (dq <= totalPage && i < 4) {
                        %>
                        <li><a href="/hd/hdindex.jsp?ylpage=<%=dq%>#/yulu"><%=dq%>
                        </a></li>
                        <% dq++;
                            i++;
                        }
                        %>
                        <%
                            if (currentPage + 1 <= totalPage) {
                        %>
                        <li><a href="/hd/hdindex.jsp?ylpage=<%=currentPage+1%>#/yulu">&gt;&gt;</a></li>
                        <%
                            }
                        %>
                    </ul>
                    <%
                    if(totalPage!=currentPage&&totalPage!=0){
                    %>
                    <a href="/hd/hdindex.jsp?ylpage=<%=totalPage%>#/yulu" class="u-all-page"><%=totalPage%>
                    </a>
                    <%
                    }
                    %>
                    </div>
                </div>
            </div>`;
    const side4 = `<div class="content-tab-4 sel-ctt">
                <div class="userManage">
                    <div class="u-search">
                        <form action="/hd/hdindex.jsp#/shoucang">
                               <%
                            String sc = request.getParameter("sc");
                            System.out.println("yhm="+yhm+"#");
                            if(sc==null||"".equals(sc)){
                            sql1 = "select * from yxyy.collect";
                        %>
                            <label for=""><input type="text" placeholder="请输入用户ID" name="sc"><input type="submit"
                                    value="搜索"></label>
                         <%
                             }else{
                                sql1 = "select * from yxyy.collect where userId like '%"+sc+"%'";
                         %>
                         <label for=""><input type="text" placeholder="请输入用户ID" name="sc" value="<%=sc%>"><input type="submit"
                                    value="搜索"></label>
                         <%
                            }
                         %>
                        </form>
                    </div>
                    <div class="u-operate">
                        <a href=""><span class="iconfont">&#xe614;</span>批量删除</a>
                        <a href=""><span class="iconfont">&#xe66c;</span>添加</a>
                        <a href=""><span class="iconfont">&#xe692;</span>刷新</a>
                    </div>
                    <div class="u-table">
                        <table>
                           <tbody>
                        <tr>
                            <td><input type="checkbox">全选</td>
                            <td>用户ID</td>
                            <td>语录ID</td>
                            <td>收藏时间</td>
                            <td>操作</td>
                        </tr>
                        <%
                            List<Collect> collects;
                            pageSize = 7;
                            strPage = request.getParameter("shoucang");
                            System.out.println(strPage+"??");
                            if (strPage == null) {
                                currentPage = 1;
                            } else {
                                currentPage = Integer.parseInt(strPage);
                            }
                            collects = collectBasicDAO.queryMultiply(sql1, Collect.class);
                            Collect[] collects1 = collects.toArray(new Collect[collects.size()]);
                            totalSize = collects1.length;
                            totalPage = (totalSize + pageSize - 1) / pageSize;
                            if (totalPage >= 0) {

                                int  ylid, id;
                                yid = ((currentPage - 1) * pageSize);
                                i = 0;
                                Collect collect;
                                for (; i < pageSize ; i++, yid++) {
                                    if(yid < collects.size()){
                                    collect = collects1[yid];
                                    ylid = Integer.valueOf(collect.getQuoteId());
                                    id = Integer.valueOf(collect.getUserId());
                        %>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td><%=id%>
                            </td>
                            <td><%=ylid%>
                            </td>
                            <td><%=collect.getCollectTime()%>
                            </td>
                            <td>
                                <a href="" title="编辑"><span class="iconfont">&#xe610;</span></a>
                                <a href="" title="删除"><span class="iconfont">&#xe614;</span></a>
                            </td>
                        </tr>
                        <%
                                }else{
                                        out.print("<tr><td></td><td></td><td></td><td></td><td></td></tr>");
                                }
                                }

                            }
                        %>
                        </tbody>
                        </table>
                    </div>
                    <div class="u-page">
                       <ul>
                        <%
                            if (currentPage - 1 > 0) {
                        %>
                        <li><a href="/hd/hdindex.jsp?shoucang=<%=currentPage-1%>#/shoucang">&lt;&lt;</a></li>
                        <%
                            }
                        %>
                        <li class="highLight"><a href="/hd/hdindex.jsp?shoucang=<%=currentPage%>#/shoucang"><%=currentPage%>
                        </a></li>
                        <%
                            i = 0;
                            dq = currentPage + 1;
                            while (dq <= totalPage && i < 4) {
                        %>
                        <li><a href="/hd/hdindex.jsp?shoucang=<%=dq%>#/shoucang"><%=dq%>
                        </a></li>
                        <% dq++;
                            i++;
                        }
                        %>
                        <%
                            if (currentPage + 1 <= totalPage) {
                        %>
                        <li><a href="/hd/hdindex.jsp?shoucang=<%=currentPage+1%>#/shoucang">&gt;&gt;</a></li>
                        <%
                            }
                        %>
                    </ul>
                    <%
                    if(totalPage!=currentPage&&totalPage!=0){
                    %>
                    <a href="/hd/hdindex.jsp?shoucang=<%=totalPage%>#/shoucang" class="u-all-page"><%=totalPage%>
                    </a>
                    <%
                    }
                    %>
                    </div>
                </div>
            </div>`;

    //构造函数
    function Router() {
        this.routes = {};
        this.currentUrl = "";
    }

    Router.prototype.route = function (path, callback) {
        this.routes[path] = callback || function () {
        }; //给不同的hash设置不同的回调函数
    };
    Router.prototype.refresh = function () {
        //   console.log(location.hash.slice(1)); //获取到相应的hash值
        this.currentUrl = location.hash.slice(1) || "/home"; //如果存在hash值则获取到，否则设置hash值为/
        // console.log(this.currentUrl);
        if (this.currentUrl && this.currentUrl != "/") {
            this.routes[this.currentUrl](); //根据当前的hash值来调用相对应的回调函数
        }
    };
    Router.prototype.init = function () {
        window.addEventListener("load", this.refresh.bind(this), false);
        window.addEventListener("hashchange", this.refresh.bind(this), false);
    };
    //给window对象挂载属性

    window.Router = new Router();
    window.Router.init();
    let oSidebar = document.querySelector(".content-tab");
    const sidebarList = document.querySelector(".sidebar-list");
    const lis = sidebarList.querySelectorAll("li");
    const bread = document.querySelector(".gotohome");
    Router.route("/home", function () {
        oSidebar.innerHTML = side1;
    });
    Router.route("/user", function () {
        oSidebar.innerHTML = side2;
    });
    Router.route("/yulu", function () {
        oSidebar.innerHTML = side3;
        let huakuaiSpan = document.querySelector(".huakuai-radius");
        let huakuaiDiv = document.querySelector("#huakuai-box");
        let huakuaiData = document.querySelectorAll(".huakuaiData");
        huakuaiSpan.addEventListener("click", (e) => {
            console.log(huakuaiSpan.className);
            if (huakuaiSpan.className === "huakuai-radius huakuai-left") {
                huakuaiSpan.className = "huakuai-radius huakuai-right";
                huakuaiDiv.className = "huakuai-bg";
                huakuaiData.name = "1";
            } else {
                huakuaiSpan.className = "huakuai-radius huakuai-left";
                huakuaiDiv.className = "";
                huakuaiData.name = "0";
            }
        });
    });
    Router.route("/shoucang", function () {
        oSidebar.innerHTML = side4;
    });
    window.addEventListener("load", () => {
        console.log(window.location.hash);
        switch (window.location.hash) {
            case "#/home":
                bread.style.backgroundColor = "#fff";
                break;
            case "#/user":
                lis[0].style.backgroundColor = "rgb(30, 159, 255)";
                break;
            case "#/yulu":
                lis[1].style.backgroundColor = "rgb(30, 159, 255)";
                break;
            case "#/shoucang":
                lis[2].style.backgroundColor = "rgb(30, 159, 255)";
                break;

            default:
                break;
        }
    });
    bread.addEventListener("click", () => {
        bread.style.backgroundColor = "#fff";
        for (let i = 0; i < lis.length; i++) {
            lis[i].style.backgroundColor = "";
        }
    });
    for (let i = 0; i < lis.length; i++) {
        lis[i].addEventListener("click", () => {
            bread.style.backgroundColor = "";
            for (let i = 0; i < lis.length; i++) {
                lis[i].style.backgroundColor = "";
            }
            lis[i].style.backgroundColor = "rgb(30, 159, 255)";
        });
    }
</script>
</html>

