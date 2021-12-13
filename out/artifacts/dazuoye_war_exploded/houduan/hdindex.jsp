<%@ page import="com.dao_.domain.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.dao_.domain.Quotes" %>
<%@ page import="com.dao_.dao.BasicDAO" %>
<%@ page import="com.dao_.domain.Collect" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.dao_.domain.Fm" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.InetAddress" %>
<%@ page import="sun.text.resources.ja.JavaTimeSupplementary_ja" %><%--
  Created by IntelliJ IDEA.
  User: YZJ
  Date: 2021/7/6
  Time: 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>愈心于语-后台管理</title>
    <link
            rel="shortcut icon"
            href="assets/images/logo_favicon.ico"
            type="image/x-icon"
    />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
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

    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
    ></script>
</head>

<body>
<%
    User root=(User) session.getAttribute("User");
    String sql;
%>
<div id="nav">
    <div class="title">愈心于语-后台管理</div>
    <a href="javascript:;" class="turn-sidebar"
    ><span class="iconfont">&#xe645;</span></a
    >
    <div class="username">
        <%=root.getUserName()%> <span>▼</span>
        <ul class="admin-op">
            <li><a href="/assets/jsp/login.jsp">切换账号</a></li>
            <li><a href="/assets/jsp/login.jsp">退出登录</a></li>
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
<script type="text/javascript">
    const turnSidebar = document.querySelector(".turn-sidebar");
    const sidebar = document.querySelector(".sidebar");
    const sidebarList1 = document.querySelector(".sidebar-list");
    const spans = sidebarList1.querySelectorAll("span");

    turnSidebar.addEventListener("click", () => {
        if (sidebar.className === "sidebar spread-side") {
            sidebar.className = "sidebar shrink-side";
            spans[0].title = "用户管理";
            spans[1].title = "语录管理";
            spans[2].title = "FM管理";
        } else {
            sidebar.className = "sidebar spread-side";
            spans[0].title = "";
            spans[1].title = "";
            spans[2].title = "";
        }
    });
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
                    <%
                      InetAddress address = InetAddress.getLocalHost();
                      String ip=address .getHostAddress().toString(); //获取本机计算机ip
                      String hostName=address.getHostName().toString(); //获取本机计算机名称
                      String jsjm=System.getProperty("user.name");// 用户名
                      String czxt=System.getProperty("os.name");// 操作系统名称
                      String jg=System.getProperty("os.arch");// 操作系统的架构
                      String bbh=System.getProperty("os.version");// 操作系统版本号
//操作系统用户名：YZJ
//操作系统名称：Windows 10
//操作系统的架构：amd64
//操作系统版本号：10.0
                    %>
                    <div class="details">
                        <table border="1">
                        <tr>
                            <td class="table-left">当前系统版本</td>
                            <td>1.0.180420</td>
                        </tr>
                        <tr>
                            <td class="table-left">本机ip地址</td>
                            <td><%=ip%></td>
                        </tr>
                        <tr>
                            <td class="table-left">操作系统</td>
                            <td><%=czxt%></td>
                        </tr>
                        <tr>
                            <td class="table-left">运行环境</td>
                            <td><%=czxt%> <%=jg%> <%=bbh%></td>
                        </tr>
                        <tr>
                            <td class="table-left">操作系统用户名</td>
                            <td><%=jsjm%></td>
                        </tr>
                        <tr>
                            <td class="table-left">本机计算机名称</td>
                            <td><%=hostName%></td>
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
                        <form action="/houduan/hdindex.jsp#/user">
                        <%
                            String yhm = request.getParameter("yhm");
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
                        <a href="" data-bs-toggle="modal" data-bs-target="#Modal1">
                          <span class="iconfont">&#xe66c;</span>添加
                        </a>
                        <a href="/houduan/hdindex.jsp#/user"><span class="iconfont">&#xe692;</span>刷新</a>
                    </div>

    <div class="modal fade" id="Modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
    <h5 class="modal-title" id="exampleModalLabel">添加用户</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
    <form action="/Addyh">
    <div class="mb-3">
    <label for="" class="form-label">用户名</label>
    <input type="text" class="form-control" id="addUsername" name="userName" placeholder="请输入用户名">
    </div>
    <div class="mb-3">
    <label for="" class="form-label">密码</label>
    <input type="password" class="form-control" id="addPassword" name="password" placeholder="请输入密码">
    </div>
    <div class="mb-3">
    <label for="" class="form-label">邮箱</label>
    <input type="email" class="form-control" id="addEmail" name="email" placeholder="name@example.com">
    </div>
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">关闭</button>
    <input class="btn btn-primary" type="submit"value="添加">
    </form>
    </div>
    <div class="modal-footer">
    </div>
    </div>
    </div>
    </div>
    <div class="u-table">
    <table>
    <tbody>
    <tr>
    <td><input type="checkbox">全选</td>
    <td>ID</td>
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
                                String bjyhm,bjmm,bjyx;
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
                                    bjyhm=user.getUserName();
                                    bjmm=user.getPassword();
                                    bjyx=user.getEmail();
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
    <a href="" title="编辑" data-bs-toggle="modal" data-bs-target="#Modal<%=i%>">
    <span class="iconfont">&#xe610;</span>
    </a>


    <div class="modal fade" id="Modal<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
    <h5 class="modal-title" id="exampleModalLabel">编辑用户</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
    <form action="/Xgyh">
    <div class="mb-3">
    <label for="" class="form-label">用户名</label>
    <input type="text" class="form-control" id="bjUsername" name="bjUsername" placeholder="请输入用户名" value="<%=bjyhm%>">
    </div>
    <div class="mb-3">
    <label for="" class="form-label">密码</label>
    <input type="password" class="form-control" id="bjPassword" name="bjPassword" placeholder="请输入密码" value="<%=bjmm%>">
    </div>
    <div class="mb-3">
    <label for="" class="form-label">邮箱</label>
    <input type="email" class="form-control" id="bjEmail" name="bjEmail" placeholder="name@example.com" value="<%=bjyx%>">
    <input type="hidden" name="userId" value="<%=id%>"/>
    <input type="hidden" name="currentPage" value="<%=currentPage%>"/>
    </div>
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">关闭</button>
    <input class="btn btn-primary" type="submit"value="修改">
    </form>
    </div>
    <div class="modal-footer">
    </div>
    </div>
    </div>
    </div>

    <a href="/Scyh?userId=<%=id%>&currentPage=<%=currentPage%>" title="删除"><span class="iconfont">&#xe614;</span></a>
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
                        <li><a href="/houduan/hdindex.jsp?yhpage=<%=currentPage-1%>#/user">&lt;&lt;</a></li>
                        <%
                            }
                        %>
                        <li class="highLight"><a href="/houduan/hdindex.jsp?yhpage=<%=currentPage%>#/user"><%=currentPage%>
                        </a></li>
                        <%
                            i = 0;
                            dq = currentPage + 1;
                            while (dq <= totalPage && i < 4) {
                        %>
                        <li><a href="/houduan/hdindex.jsp?yhpage=<%=dq%>#/user"><%=dq%>
                        </a></li>
                        <% dq++;
                            i++;
                        }
                        %>
                        <%
                            if (currentPage + 1 <= totalPage) {
                        %>
                        <li><a href="/houduan/hdindex.jsp?yhpage=<%=currentPage+1%>#/user">&gt;&gt;</a></li>
                        <%
                            }
                        %>
                    </ul>
                    <%
                    if(totalPage!=currentPage&&totalPage!=0){
                    %>
                    <a href="/houduan/hdindex.jsp?yhpage=<%=totalPage%>#/user" class="u-all-page"><%=totalPage%>
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
     <form action="/houduan/hdindex.jsp#/yulu">
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
    <a href="" title="编辑" data-bs-toggle="modal" data-bs-target="#Modal3">
    <span class="iconfont">&#xe66c;</span>添加
    </a>
    <a href="/houduan/hdindex.jsp#/yulu"><span class="iconfont">&#xe692;</span>刷新</a>

    </div>

    <div class="modal fade" id="Modal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
    <h5 class="modal-title">添加语录</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
    <form action="/Addyll">
    <div class="mb-3">
    <label for="" class="form-label">用户名</label>
    <input type="text" class="form-control"  name="yhId" placeholder="请输入用户名">
    </div>
    <div class="mb-3">
    <label for="" class="form-label">标题</label>
    <input type="text" class="form-control"  name="caption" placeholder="请输入标题">
    </div>
    <div class="mb-3">
    <label for="" class="form-label">正文</label>
    <textarea class="form-control" name="content" rows="3"></textarea>
    </div>
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">关闭</button>
    <input class="btn btn-primary" type="submit"value="添加">
    </form>
    </div>
    <div class="modal-footer">
    </div>
    </div>
    </div>
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
    <td>类型</td>
    <td>收藏数</td>
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
                                String caption,content;
                                yid = ((currentPage - 1) * pageSize);
                                i = 0;
                                Quotes quote;
                                for (; i < pageSize ; i++, yid++) {

                                    if(yid < quotes.size()){
                                    quote = quotes1[yid];
                                    caption=quote.getCaption();
                                    content=quote.getContent();
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
    <a href="" title="编辑" data-bs-toggle="modal" data-bs-target="#Modal<%=i%>">
    <span class="iconfont">&#xe610;</span>
    </a>

    <div class="modal fade" id="Modal<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
    <h5 class="modal-title">语录编辑</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
    <form action="/Xgyl">
    <div class="mb-3">
    <label for="" class="form-label">用户名</label>
    <input type="text" class="form-control"  name="yl-bjUsername" placeholder="请输入用户ID" value="<%=id%>">
    </div>
    <div class="mb-3">
    <label for="" class="form-label">标题</label>
    <input type="text" class="form-control"  name="yl-bjTitle" placeholder="请输入标题" value="<%=caption%>">
    </div>
    <div class="mb-3">
    <label for="" class="form-label">正文</label>
    <textarea class="form-control" name="yl-bjZhengwen" rows="3"><%=content%></textarea>
     <input type="hidden" name="userId" value="<%=id%>"/>
     <input type="hidden" name="quoteId" value="<%=ylid%>"/>
    <input type="hidden" name="currentPage" value="<%=currentPage%>"/>
    </div>
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">关闭</button>
    <input class="btn btn-primary" type="submit"value="修改">
    </form>
    </div>
    <div class="modal-footer">
    </div>
    </div>
    </div>
    </div>

    <a href="/Scyl?userId=<%=id%>&quoteId=<%=ylid%>&currentPage=<%=currentPage%>" title="删除"><span class="iconfont">&#xe614;</span></a>
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
                        <li><a href="/houduan/hdindex.jsp?ylpage=<%=currentPage-1%>#/yulu">&lt;&lt;</a></li>
                        <%
                            }
                        %>
                        <li class="highLight"><a href="/houduan/hdindex.jsp?ylpage=<%=currentPage%>#/yulu"><%=currentPage%>
                        </a></li>
                        <%
                            i = 0;
                            dq = currentPage + 1;
                            while (dq <= totalPage && i < 4) {
                        %>
                        <li><a href="/houduan/hdindex.jsp?ylpage=<%=dq%>#/yulu"><%=dq%>
                        </a></li>
                        <% dq++;
                            i++;
                        }
                        %>
                        <%
                            if (currentPage + 1 <= totalPage) {
                        %>
                        <li><a href="/houduan/hdindex.jsp?ylpage=<%=currentPage+1%>#/yulu">&gt;&gt;</a></li>
                        <%
                            }
                        %>
                    </ul>
                    <%
                    if(totalPage!=currentPage&&totalPage!=0){
                    %>
                    <a href="/houduan/hdindex.jsp?ylpage=<%=totalPage%>#/yulu" class="u-all-page"><%=totalPage%>
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
     <form action="/houduan/hdindex.jsp#/shoucang">
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
    <a href="" title="编辑" data-bs-toggle="modal" data-bs-target="#Modal5">
    <span class="iconfont">&#xe66c;</span>添加
    </a>
    <a href="/houduan/hdindex.jsp#/shoucang"><span class="iconfont">&#xe692;</span>刷新</a>
    </div>

    <div class="modal fade" id="Modal5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
    <h5 class="modal-title">添加收藏</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
    <form action="/Addscyl">
    <div class="mb-3">
    <label for="" class="form-label">语录ID</label>
    <input type="text" class="form-control"  name="quoteId" placeholder="请输入语录ID">
    </div>
    <div class="mb-3">
    <label for="" class="form-label">用户ID</label>
    <input type="text" class="form-control"  name="userId" placeholder="请输入用户ID">
    </div>

     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">关闭</button>
    <input class="btn btn-primary" type="submit"value="添加">
    </form>
    </div>
    <div class="modal-footer">
    </div>
    </div>
    </div>
    </div>
    <div class="u-table">
    <table>
    <tbody>
    <tr>
    <td><input type="checkbox">全选</td>
    <td>语录ID</td>
    <td>用户ID</td>
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
                                Date sj;
                                yid = ((currentPage - 1) * pageSize);
                                i = 0;
                                Collect collect;
                                for (; i < pageSize ; i++, yid++) {
                                    if(yid < collects.size()){
                                    collect = collects1[yid];
                                    ylid = Integer.valueOf(collect.getQuoteId());
                                    id = Integer.valueOf(collect.getUserId());
                                    sj=collect.getCollectTime();

                        %>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td><%=ylid%>
                            </td>
                            <td><%=id%>
                            </td>
                            <td><%=sj%>
                            </td>
                            <td>
    <a href="" title="编辑" data-bs-toggle="modal" data-bs-target="#Modal<%=i%>">
    <span class="iconfont">&#xe610;</span>
    </a>

    <div class="modal fade" id="Modal<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
    <h5 class="modal-title">收藏编辑</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
    <form action="/Xgsc">
    <div class="mb-3">
    <label for="" class="form-label">语录ID</label>
    <input type="text" class="form-control"  name="yl-addUsername" placeholder="请输入语录ID"value="<%=ylid%>">
    </div>
    <div class="mb-3">
    <label for="" class="form-label">用户名</label>
    <input type="text" class="form-control"  name="yl-yhm" placeholder="请输入用户名" value="<%=id%>">
    </div>
    <div class="mb-3">
    <label for="" class="form-label">收藏时间</label>
    <input type="text" class="form-control"  name="yl-addTitle" placeholder="请输入收藏时间"value="<%=sj%>">
      <input type="hidden" name="userId" value="<%=id%>"/>
     <input type="hidden" name="quoteId" value="<%=ylid%>"/>
    <input type="hidden" name="currentPage" value="<%=currentPage%>"/>
    </div>
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">关闭</button>
    <input class="btn btn-primary" type="submit"value="修改">
    </form>
    </div>
    <div class="modal-footer">
    </div>
    </div>
    </div>
    </div>

    <a href="/Scsc?userId=<%=id%>&quoteId=<%=ylid%>&currentPage=<%=currentPage%>" title="删除"><span class="iconfont">&#xe614;</span></a>
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
                        <li><a href="/houduan/hdindex.jsp?shoucang=<%=currentPage-1%>#/shoucang">&lt;&lt;</a></li>
                        <%
                            }
                        %>
                        <li class="highLight"><a href="/houduan/hdindex.jsp?shoucang=<%=currentPage%>#/shoucang"><%=currentPage%>
                        </a></li>
                        <%
                            i = 0;
                            dq = currentPage + 1;
                            while (dq <= totalPage && i < 4) {
                        %>
                        <li><a href="/houduan/hdindex.jsp?shoucang=<%=dq%>#/shoucang"><%=dq%>
                        </a></li>
                        <% dq++;
                            i++;
                        }
                        %>
                        <%
                            if (currentPage + 1 <= totalPage) {
                        %>
                        <li><a href="/houduan/hdindex.jsp?shoucang=<%=currentPage+1%>#/shoucang">&gt;&gt;</a></li>
                        <%
                            }
                        %>
                    </ul>
                    <%
                    if(totalPage!=currentPage&&totalPage!=0){
                    %>
                    <a href="/houduan/hdindex.jsp?shoucang=<%=totalPage%>#/shoucang" class="u-all-page"><%=totalPage%>
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
    this.routes[path] = callback || function () {}; //给不同的hash设置不同的回调函数
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
