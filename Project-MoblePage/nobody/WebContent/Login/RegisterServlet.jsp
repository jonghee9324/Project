<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nobodyDB.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   		request.setCharacterEncoding("utf-8");
            
		String id = request.getParameter("userid");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String part = request.getParameter("part");
		String birth = request.getParameter("birth");
         		   
        UserInfoVO uivo = new UserInfoVO(id, password, name, part, birth);
        NobodyDAO uidao= new NobodyDAOimpl();
        boolean result = uidao.info_insert(uivo);
        if(result)
           response.sendRedirect("LoginForm.jsp");
        else
           out.print("실패");
   %>
</body>
</html>