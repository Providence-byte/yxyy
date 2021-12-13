<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.dao_.domain.User" %>
<%@ page import="com.dao_.dao.BasicDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao_.domain.QuotesCollect" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.dao_.domain.Location" %>
<%@ page import="com.dao_.domain.Quotes" %><%--
  Created by IntelliJ IDEA.
  User: YZJ
  Date: 2021/6/14
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人中心</title>
    <link rel="stylesheet" href="../css/reset.min.css">
    <link rel="stylesheet" href="../css/space1.css">
</head>

<body>
<%
    request.setCharacterEncoding("utf-8");


    /**
     * 测试注销中
     * */
    boolean i = (boolean) session.getAttribute("state");
    int Id = 0;
    //正确 说明登录成功
    if (i) {
        Id = Integer.parseInt((String) session.getAttribute("Id"));
    }

    /**
     * 测试值
     *
     * */
//    boolean i = true;
//    int Id = 1;
////    int id=2;
    if (Id == 0) {

%>
<jsp:forward page="login.jsp"/>
<%
    }
    String sql;
    BasicDAO<Object> basicDAO = new BasicDAO<>();
%>
<div id="space-top">
    <img src="../images/logo.png" alt="">
    <div class="space-top-back">
        <a href="../../index.jsp">&lt;&lt;返回首页</a>
    </div>
</div>
<h1 class="space-title">个人中心</h1>
<div id="space-content">
    <div class="space-self">
        <div class="about-me">
            <%
                User user = (User) session.getAttribute("User");
                if (user.getHead() == null) {
                    user.setHead("head1.jpg");
                }
            %>
            <div class="space-head">
                <img src="../images/<%=user.getHead()%>" width="100px" height="100px" alt="">
            </div>
            <%
                if (user.getNickName() == null) {
                    out.print("<h3>" + user.getUserName() + "</h3>");
                } else {
                    out.print("<h3>" + user.getNickName() + "</h3>");
                }

                if (user.getSignature() == null) {
                    out.print("<h5>这个人很懒，还什么都没写...</h5>");
                } else {
                    out.print("<h5>" + user.getSignature() + "</h5>");
                }
            %>
            <ul><%
                sql = "select count(userId) from yxyy.quotes where userId=?";
                BasicDAO<User> userBasicDAO = new BasicDAO<>();
                int yls = ((Long) userBasicDAO.queryScalar(sql, Id)).intValue();
                out.print("<li>语录数:<span>" + yls + "</span></li>");

                //暂无处可访问，待开发中
                sql = "select visits from yxyy.user where userId=?";
                int fws = (Integer) (userBasicDAO.queryScalar(sql, Id));
                out.print("<li>访问数:<span>" + fws + "</span></li>");

                sql = "select count(userId) from yxyy.collect where userId=?";
                int scs = ((Long) userBasicDAO.queryScalar(sql, Id)).intValue();
                out.print("<li>收藏数:<span>" + scs + "</span></li>");
            %>
            </ul>
        </div>
        <div class="about-me-other">
            <div>
                <h3>
                    <img src="../images/icon_bgp2mynopxn/ziyuan176.png" width="20px" height="20px" alt="">
                    <span>喜欢</span>
                </h3>
                <p class="biaoqian">
                    <span style="background-color: aqua;">跑步</span>
                    <span style="background-color: yellow;">打球</span>
                    <span style="background-color: rgb(216, 146, 238);">看书</span>
                    <span style="background-color:wheat;">游泳</span>
                </p>
            </div>
            <div>
                <h3>
                    <img src="../images/icon_bgp2mynopxn/biaoqian.png" width="20px" height="20px" alt="">
                    <span>标签</span>
                </h3>
                <p class="biaoqian">
                    <span style="background-color:wheat;">#暖心</span>
                    <span style="background-color: rgb(216, 146, 238);">#自信</span>
                    <span style="background-color: aqua;">#品质</span>
                    <span style="background-color: yellow;">#成熟</span>
                </p>
            </div>
        </div>
    </div>
    <div class="space-main">
        <ul class="space-list-title">
            <li class="my-shoucang space-active">我的收藏</li>
            <li class="my-msg">编辑资料</li>
            <li class="my-yulu">我的语录</li>
            <li class="my-write">写语录</li>
        </ul>
        <div class="tab-detail space-shoucang">

            <%

                //                    sql = "select * from yxyy.quotes where userId='" + id + "'";
                sql = "select * from yxyy.quotes ,yxyy.collect where yxyy.quotes.quoteId=yxyy.collect.quoteId and  yxyy.collect.userId=?";
                BasicDAO<QuotesCollect> quotesCollectBasicDAO = new BasicDAO<QuotesCollect>();
                List<QuotesCollect> quotesCollects = quotesCollectBasicDAO.queryMultiply(sql, QuotesCollect.class, Id);
                String userId = null;
                String quoteId = null;
                if (quotesCollects.isEmpty()) {
//                        out.print("<h1 style=\"margin: 0 auto;color: #ccc\" >暂无收藏</h1>\n");
                    out.print("<h1 style=\"margin: 20px auto;color: #ccc;text-align: center;font-size:20px \" >暂无收藏</h1>");
                } else {
            %>
            <ul>
                <%
                    for (QuotesCollect quotesCollect : quotesCollects) {
                        int suiji = (int) (Math.random() * 28 + 1);
                        userId = quotesCollect.getUserId();
                        quoteId = quotesCollect.getQuoteId();
                %>
                <li>
                    <a href="/Cknr?userId=<%=userId%>&quoteId=<%=quoteId%>"><img src="../images/ylt_ (<%=suiji%>).jpg"
                                                                                 width="100%" height="154px"
                                                                                 style="min-height: 184px"
                                                                                 alt=""></a>
                    <p style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap; max-width: 140px;"><%=quotesCollect.getCaption()%>
                    </p>

                    <%--                    <a href="deleteCourse.jsp?cNum=<%=cNum%>"onClick="if(!confirm('确定要删除吗？'))return false;else return true;">删除</a>--%>

                    <%--                    <button href="http:/localhost/Quxiaosc?userId=<%=userId%>&userId=<%=quoteId%>"--%>
                    <%--                            onClick="if(!confirm('确定取消收藏吗？'))return false;else return true;">取消收藏--%>
                    <%--                    </button>--%>
                    <a href="/space/Quxiaosc?userId=<%=userId%>&quoteId=<%=quoteId%>"
                       class="btn-cancel"
                       style="display: block;
                            height: 20px;
                            width: 40%;
                            font-size: 14px;
                            line-height: 20px;
                            background-color: red;
                            color: #fff;
                            cursor: pointer;
                            border-radius: 3px;
                            margin-bottom: 5px;"
                       onClick="if(!confirm('确定要删除吗？'))return false;else return true;">
                        取消收藏
                    </a>
                </li>
                <%
                    }
                %>
            </ul>
            <%
                }
            %>

        </div>
        <div class="tab-detail space-bianji">
            <%
                //                sql = "select * from yxyy.user where userId=?";
//                    userBasicDAO.querySingle(sql,User.class,Id);
//                rs = stmt.executeQuery(sql);
//                rs.next();

            %>

            <form action="/space/Xiugaixx" method="post" name="form1" style="width: 100%;
    height: auto;
    display: flex;
    flex-direction: column;
    align-items: center;">
                <label for="" class="nor">头像:
                    <%
                        //                        String head;
//                        if (rs.getString("head")==null){
//                            head="";
//                        }else{
//                            head=rs.getString("head");
//                        }

                        for (int i1 = 1; i1 <= 3; i1++) {
                            String img = "head" + i1 + ".jpg";
                            if (img.equals(user.getHead()) && user.getHead() != null) {
                    %>
                    <input type="radio" name="head" value="<%=img%>" checked>
                    <img src="../images/<%=img%>" width="60px" height="60px" alt="">
                    <%
                    } else {
                    %>
                    <input type="radio" name="head" value="<%=img%>">
                    <img src="../images/<%=img%>" width="60px" height="60px" alt="">
                    <%
                            }
                        }

                    %>
                </label>
                <label for="" class="nor">
                    <%
                        String nickName = user.getNickName();
                        if (nickName == null) {
                            nickName = "";
                        }
                    %>
                    昵称:<input type="text" name="nickName" value="<%=nickName%>" required="required">
                </label>
                <label for="" class="nor">
                    <%
                        String signature = user.getSignature();
                        if (signature == null) {
                            signature = "";
                        }
                    %>
                    签名:<input type="text" name="signature" value="<%=signature%>" required="required">
                </label>
                <label for="" class="nor">
                    <%
                        String age = user.getAge();
                        if (age == null) {
                            age = "";
                        }
                    %>
                    年龄:<input type="number" name="age" value="<%=age%>" required="required">
                </label>
                <label for="" class="nor">
                    <%
                        String phoneNum = user.getPhoneNum();
                        if (phoneNum == null) {
                            phoneNum = "";
                        }
                    %>
                    手机:<input type="text" name="phoneNum" value="<%=phoneNum%>" required="required">
                </label>
                <label for="" class="nor">性别:
                    <%
                        String sex = user.getSex();
                        if (sex == null) {
                    %>
                    <input type="radio" name="sex" value="男" name="sex">
                    <span class="sex-1"><img src="../images/icon_bgp2mynopxn/nan.png" width="35px" height="35px"
                                             alt=""></span>
                    <input type="radio" name="sex" value="女" name="sex">
                    <span class="sex-2"><img src="../images/icon_bgp2mynopxn/nv.png" width="35px" height="35px"
                                             alt=""></span>
                    <%
                    } else if (sex.equals("男")) {
                    %>
                    <input type="radio" name="sex" value="男" name="sex" checked>
                    <span class="sex-1"><img src="../images/icon_bgp2mynopxn/nan.png" width="35px" height="35px"
                                             alt=""></span>
                    <input type="radio" name="sex" value="女" name="sex">
                    <span class="sex-2"><img src="../images/icon_bgp2mynopxn/nv.png" width="35px" height="35px"
                                             alt=""></span>
                    <%
                    } else {
                    %>
                    <input type="radio" name="sex" value="男" name="sex">
                    <span class="sex-1"><img src="../images/icon_bgp2mynopxn/nan.png" width="35px" height="35px"
                                             alt=""></span>
                    <input type="radio" name="sex" value="女" name="sex" checked>
                    <span class="sex-2"><img src="../images/icon_bgp2mynopxn/nv.png" width="35px" height="35px"
                                             alt=""></span>
                    <%
                        }
                    %>
                </label>
                <label class="nor" for="">

                    所在地:<select name="address" name="" id="0">

                    <%
                        //                        sql = "select * from yxyy.user_location where userId='"+id+"'";
                        sql = "select yxyy.user.address from yxyy.user_location,yxyy.user " +
                                "where yxyy.user_location.postcode=yxyy.user.address and yxyy.user.userId=?";
                        BasicDAO<Location> locationBasicDAO = new BasicDAO<>();
                        String address = String.valueOf(basicDAO.queryScalar(sql, Id));
                        sql = "select * from yxyy.user_location ";
                        List<Location> locations = locationBasicDAO.queryMultiply(sql, Location.class);
                        //初始无值
                        if ("null".equals(address)) {
                            out.print("<option value=\"0\" selected disabled hidden>请选择地址</option>");
                            for (Location location : locations) {
                                String placeName = location.getPostcode();
                    %>
                    <%--                    selected = "selected" 优先显示--%>
                    <option value="<%=placeName%>"><%=location.getPlaceName()%>
                    </option>

                    <%
                        }
                    } else {
                        for (Location location : locations) {
                            String placeName = location.getPostcode();
                            if (address.equals(location.getPostcode())) {

                    %>
                    <option value="<%=placeName%>" selected="selected"><%=location.getPlaceName()%>
                    </option>
                    <%
                    } else {
                    %>
                    <option value="<%=placeName%>"><%=location.getPlaceName()%>
                    </option>
                    <%
                                }
                            }
                        }
                    %>
                </select></label>
                <input class="baocun" type="submit" value="保存编辑">
            </form>
        </div>
        <div class="tab-detail space-yulu">
            <%


                sql = "select * from yxyy.quotes where userId=?";
//                sql = "select * from yxyy.quotes ,yxyy.collect where yxyy.quotes.quoteId=yxyy.collect.quoteId and  yxyy.collect.userId=?";
                BasicDAO<Quotes> quotesBasicDAO = new BasicDAO<Quotes>();
                List<Quotes> quotesList = quotesBasicDAO.queryMultiply(sql, Quotes.class, Id);
                if (quotesList.isEmpty()) {
                    out.print("<h1 style=\"margin: 20px auto;color: #ccc;text-align: center;font-size:20px\" >暂无语录</h1>\n");
                } else {
            %>
            <ul>
                <%

                    for (Quotes quotes : quotesList) {
                        int suiji = (int) (Math.random() * 28 + 1);
                        userId = quotes.getUserId();
                        quoteId = quotes.getQuoteId();
                        String qpublic = quotes.getQpublic();
                %>
                <li style="max-height: 136px;">
                    <img src="../images/ylt_ (<%=suiji%>).jpg" alt="" width="130px" height="130px"
                         style="min-width: 130px">
                    <div>
                        <p><%=quotes.getContent()%>
                        </p>
                        <div>
                            <%
                                //公开
                                if ("1".equals(qpublic)) {
                            %>
                            <a href="/space/Gkqh?userId=<%=userId%>&quoteId=<%=quoteId%>&qpublic=<%=qpublic%>" style="width: 100px;
                                height: 35px;
                                margin-left: 10px;
                                border: none;
                                color: #fff;
                                font-size: 16px;
                                border-radius: 3px;
                                cursor: pointer;
                                 line-height: 35px;
                                background-color: #999;
                                /*background-color: rgb(46,142,46);*/
                            ">
                                取消公开</a>
                            <%
                            } else {//未公开
                            %>

                            <a href="/space/Gkqh?userId=<%=userId%>&quoteId=<%=quoteId%>&qpublic=<%=qpublic%>" style="width: 100px;
                                height: 35px;
                                margin-left: 10px;
                                border: none;
                                color: #fff;
                                font-size: 16px;
                                border-radius: 3px;
                                cursor: pointer;
                                 line-height: 35px;
                                /*background-color: #ccc;*/
                                background-color: rgb(46,142,46);
                            ">
                                公开</a>
                            <%
                                }
                            %>
                            <a href="/Cknr?userId=<%=userId%>&quoteId=<%=quoteId%>" style="width: 100px;
                                height: 35px;
                                margin-left: 10px;
                                border: none;
                                color: #fff;
                                font-size: 16px;
                                border-radius: 3px;
                                cursor: pointer;
                                 line-height: 35px;
                                background-color: royalblue;">
                                查看详情</a>
                            <a href="/space/Sanchuyl?userId=<%=userId%>&quoteId=<%=quoteId%>"
                               style="width: 100px;
                                height: 35px;
                                margin-left: 10px;
                                border: none;
                                color: #fff;
                                font-size: 16px;
                                border-radius: 3px;
                                cursor: pointer;
                                 line-height: 35px;
                                background-color: red;"
                               onClick="if(!confirm('确定要删除吗？'))return false;else return true;">
                                删除
                            </a>
                        </div>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
            <%
                }
            %>
        </div>
        <div class="tab-detail space-write">
            <form action="/space/Addyl">
                <label for="">封面：<input type="file"></label>
                <label for="">标题：<input type="text" name="caption"></label>
                <label for="">
                    <span>正文：</span>
                    <textarea placeholder="写点什么吧..." name="content" id="" rows="20"></textarea>
                </label>
                <label for="">
                    <div id="huakuai-outer">
                        <p class="huakuai-text">是否公开:</p>
                        <div id="huakuai-box">
                            <span class="huakuai-radius huakuai-left"></span>
                        </div>
                    </div>
                    <input class="chuan-zhi" type="hidden" name="ispublic" value="0"/>
                </label>
                <input class="space-write-submit" type="submit" value="发布文章">
            </form>
        </div>
    </div>
</div>
<div class="footer"></div>
<script>
    let spaceMain = document.querySelector('.space-main');
    let spaceTitle = document.querySelector('.space-list-title');
    let lis = spaceTitle.getElementsByTagName('li');
    let divs = spaceMain.querySelectorAll('.tab-detail')
    window.addEventListener('load', () => {
        for (let i = 1; i < lis.length; i++) {
            divs[i].style.display = "none";
            lis[i].className = "";
        }
    })
    for (let i = 0; i < lis.length; i++) {
        lis[i].addEventListener('click', () => {
            for (let i = 0; i < lis.length; i++) {
                divs[i].style.display = "none";
                lis[i].className = "";
            }
            lis[i].className = "space-active"
            divs[i].style.display = "block"
        })
    }

</script>
<%--<script type="text/javascript">--%>
<%--    let btnCancel = document.querySelector(".btn-cancel");--%>
<%--    let spaceMain = document.querySelector('.space-main');--%>
<%--    let spaceTitle = document.querySelector('.space-list-title');--%>
<%--    let lis = spaceTitle.getElementsByTagName('li');--%>
<%--    let divs = spaceMain.querySelectorAll('.tab-detail')--%>
<%--    btnCancel.addEventListener("click", (e) => {--%>
<%--        window.location.href = ''--%>
<%--    })--%>
<%--    window.addEventListener('load', () => {--%>
<%--        for (let i = 1; i < lis.length; i++) {--%>
<%--            divs[i].style.display = "none";--%>
<%--            lis[i].className = "";--%>
<%--        }--%>
<%--    })--%>
<%--    for (let i = 0; i < lis.length; i++) {--%>
<%--        lis[i].addEventListener('click', () => {--%>
<%--            for (let i = 0; i < lis.length; i++) {--%>
<%--                divs[i].style.display = "none";--%>
<%--                lis[i].className = "/Quxiaosc?userId=<%=userId%>&quoteId=<%=quoteId%>";--%>
<%--            }--%>
<%--            lis[i].className = "space-active"--%>
<%--            divs[i].style.display = "block"--%>
<%--        })--%>
<%--    }--%>

<%--</script>--%>
<script type="text/javascript">
    let huakuaiSpan = document.querySelector('.huakuai-radius');
    let huakuaiDiv = document.querySelector('#huakuai-box');
    let chuanZhi = document.querySelector('.chuan-zhi');
    huakuaiSpan.addEventListener("click", (e) => {
        if (huakuaiSpan.className === 'huakuai-radius huakuai-left') {
            huakuaiSpan.className = 'huakuai-radius huakuai-right';
            chuanZhi.value = 1;
            console.log(chuanZhi.value);
            huakuaiDiv.className = 'huakuai-bg'
        } else {
            huakuaiSpan.className = 'huakuai-radius huakuai-left';
            chuanZhi.value = 0;
            console.log(chuanZhi.value);
            huakuaiDiv.className = ''
        }
    })
</script>
</body>

</html>
