<%@ page import="com.dao_.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: YZJ
  Date: 2021/5/16
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>欢迎注册</title>
    <link rel="stylesheet" href="../css/reset.min.css">
    <link rel="stylesheet" href="../css/signup1.css">
    <script language="javascript">
        var XMLHttpReq;
        //（1）创建XMLHttpRequest对象
        function createXMLHttpRequest() {
            if (window.XMLHttpRequest) { //Mozilla 浏览器
                XMLHttpReq = new XMLHttpRequest();
            } else if (window.ActiveXObject) { // IE浏览器
                try {
                    XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) { }
                }
            }
        }
        //发送请求函数
        function sendRequest() {
            createXMLHttpRequest();
            var userName = document.getElementById("userName").value;
            var url = "/UserCheck?username=" + userName; //jsp
            // var url = "userCheck.jsp?username=" + userName;//sevelt
            XMLHttpReq.open("GET", url, true);//（2）设置和服务器端交互的相应参数
            XMLHttpReq.onreadystatechange = processResponse;//（3）指定响应函数
            //错误的写法processResponse();
            XMLHttpReq.send(null); // //（4）设置发送的数据，开始和服务器端交互
        }
        // 处理返回信息函数
        function processResponse() {
            //（5）判断和服务器端的交互是否完成，还有判断服务器端是否正确返回了数据
            if (XMLHttpReq.readyState == 4) { // 判断对象状态
                if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                    var message = XMLHttpReq.responseText;
                    var div = document.getElementById("message");
                    div.innerHTML = message;
                } else { //页面不正常
                    window.alert("您所请求的页面有异常。");
                }
            }
        }
    </script>
    </script>
</head>

<body>
<%
    request.setCharacterEncoding("utf-8");
    if (session.getAttribute("errorInfo") != null) {
        out.print("<script language=Javascript>alert('" + session.getAttribute("errorInfo") + "');</script>");
        session.setAttribute("errorInfo", null);
    }
    User user = null;
    if (session.getAttribute("Login") != null) {
        user = (User) session.getAttribute("Login");
    } else {
        user = new User("", "", "");
    }
%>
<div id="bg-box"></div>
<div id="login-box">
    <div class="login-logo">
        <img src="../images/logo.png" alt="">
        <h3>愈 心 于 语</h3>
        <span> / 欢迎注册</span>
    </div>
    <div class="login-content">
        <div class="login-title">
            <a href="./login.jsp">登录</a>
            <a href="javascript:;">注册<span></span></a>
        </div>
        <%--        --%>
        <form name="form1" action="/Signup" method="get">
            <input style="margin-bottom: 4px" type="text" placeholder="用户名" name="userName" id="userName"
                   value="<%=user.getUserName()%>">
            <div style="height: 16px" id="message"></div>

            <input class="mm" type="password" placeholder="密码" name="password" value="<%=user.getPassword()%>">
            <input type="email" placeholder="邮箱" name="email" value="<%=user.getEmail()%>">
            <img class="pwd" src="../images/icon_bgp2mynopxn/mimayincang.png" alt="">
            <input type="submit" value="注册">

        </form>
        <span class="underline"></span>
        <div class="login-footer"><a href="">用户协议</a><a href="">隐私政策</a><a href="">帮助中心</a></div>
    </div>
</div>
<script>
    let pwd = document.querySelector('.pwd'),
        input = document.querySelector('.mm');
    pwd.addEventListener('click', () => {
        if (input.type === 'password') {
            pwd.src = "../images/icon_bgp2mynopxn/mimaxianshi.png";
            input.type = 'text';
        } else {
            pwd.src = "../images/icon_bgp2mynopxn/mimayincang.png";
            input.type = 'password';
        }

    })

</script>
<%--<script language="javascript">--%>
<%--    var XMLHttpReq;--%>

<%--    //（1）创建XMLHttpRequest对象--%>
<%--    function createXMLHttpRequest() {--%>
<%--        if (window.XMLHttpRequest) { //Mozilla 浏览器--%>
<%--            XMLHttpReq = new XMLHttpRequest();--%>
<%--        } else if (window.ActiveXObject) { // IE浏览器--%>
<%--            try {--%>
<%--                XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");--%>
<%--            } catch (e) {--%>
<%--                try {--%>
<%--                    XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");--%>
<%--                } catch (e) {--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>

<%--    //发送请求函数--%>
<%--    function sendRequest() {--%>
<%--        createXMLHttpRequest();--%>
<%--        var userName = document.getElementById("userName").value;--%>
<%--        var url = "/UserCheck?username=" + userName; //jsp--%>
<%--        // var url = "userCheck.jsp?username=" + userName;//sevelt--%>
<%--        XMLHttpReq.open("GET", url, true);//（2）设置和服务器端交互的相应参数--%>
<%--        XMLHttpReq.onreadystatechange = processResponse;//（3）指定响应函数--%>
<%--        //错误的写法processResponse();--%>
<%--        XMLHttpReq.send(null); // //（4）设置发送的数据，开始和服务器端交互--%>
<%--    }--%>

<%--    // 处理返回信息函数--%>
<%--    function processResponse() {--%>
<%--        //（5）判断和服务器端的交互是否完成，还有判断服务器端是否正确返回了数据--%>
<%--        if (XMLHttpReq.readyState == 4) { // 判断对象状态--%>
<%--            if (XMLHttpReq.status >= 200 && XMLHttpReq.status<=300) { // 信息已经成功返回，开始处理信息--%>
<%--                var message = XMLHttpReq.responseText;--%>
<%--                var div = document.getElementById("message");--%>
<%--                div.innerHTML = message;--%>
<%--            } else { //页面不正常--%>
<%--                window.alert("您所请求的页面有异常。");--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>
<%--    // let checkUserName = document.querySelector('#userName');--%>
<%--    // checkUserName.addEventListener('blur',()=>{--%>
<%--    //     sendRequest();--%>
<%--    // })--%>
<%--</script>--%>
<script>
    let checkUserName = document.querySelector('#userName');
        checkUserName.addEventListener('blur',()=>{
            sendRequest();
        })
</script>
</body>

</html>