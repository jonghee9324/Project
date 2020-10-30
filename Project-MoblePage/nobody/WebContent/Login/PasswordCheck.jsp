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
		String id = request.getParameter("userid");
    	String password = request.getParameter("password");
    	String passwordck = request.getParameter("passwordck");
    	String part = request.getParameter("part");
    	String name = request.getParameter("username");
    	String birth = request.getParameter("birth");
    	
    	if(password.equals(passwordck)){
    		
    		session.setAttribute("userid", id);
    		session.setAttribute("password", password);
    		session.setAttribute("part", part);
    		session.setAttribute("name", name);
    		session.setAttribute("birth", birth);
    		
    		response.sendRedirect("RegisterServlet.jsp");
    	}
    	out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
    	
    	
	%>
</body>
</html>