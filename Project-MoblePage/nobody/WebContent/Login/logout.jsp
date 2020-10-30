<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
   session.removeAttribute("userid");
   session.removeAttribute("userpassword");
   session.removeAttribute("username");
   session.removeAttribute("userbirth");
   session.removeAttribute("userpart");
   
   response.sendRedirect("../main/main.jsp");
   
%>
</body>
</html>