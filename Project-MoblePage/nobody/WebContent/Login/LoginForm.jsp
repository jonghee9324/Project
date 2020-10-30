<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>로그인 화면</title>
<link href="login.css" rel="stylesheet"/>
</head>
<body>
    <form action = "LoginServlet.jsp"  method="post">
    <div> &nbsp; </div>
    <div> &nbsp; </div>
        <div id="regLogodiv">
        <a href="../main/main.jsp"><img src="../images/moble2.jpg" id="regLogo"></a>
        </div>
    <div> &nbsp; </div>
    <div> &nbsp; </div>
        <div id="loginWrap">   
            &nbsp;
            <label class="legend"><strong>아이디</strong></label>
            <div id="join-div">
                <input name="userid" type="text">
            </div>   
            
            <label class="legend"><strong>비밀번호</strong></label>
            <div id="join-div">
                <input name="password" type="password">
            </div>
            <div id="wrap">

            <div> &nbsp; </div>
            <input type="submit" value="로그인" class="login">&nbsp;<input type="button" OnClick="window.location='RegisterForm.jsp'" value="회원가입">
            </div>
            
            <div> &nbsp; </div>
            <div> &nbsp; </div>

        <div> &nbsp; </div>
        <div> &nbsp; </div>
    </div>
</form>
</body>
</html>