<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nobodyDB.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
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
	NobodyDAO udao = new NobodyDAOimpl();
	ArrayList<UserInfoVO> list = udao.info_getList();
	for(int i=0;i<list.size();i++){
		if(list.get(i).getUser_Id().equals(id)){			
			if(list.get(i).getUser_Password().equals(password)){
				UserInfoVO vo = udao.getInfo(id);
				session.setAttribute("userid", id);
				session.setAttribute("userpassword", password);
				session.setAttribute("username", vo.getUser_Name());
				session.setAttribute("userpart", vo.getUser_Part());
				session.setAttribute("userbirth", vo.getUser_Birth());				
				response.sendRedirect("../main/main.jsp");
				break;
			}
		}
	}	
	out.println("<script>alert('회원정보가 틀렸습니다.'); history.back();</script>");

	
	
	
	%>
	<h1></h1>
</body>
</html>