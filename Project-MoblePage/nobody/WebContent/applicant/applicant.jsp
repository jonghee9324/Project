<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page import="nobodyDB.*" %>


<%
	request.setCharacterEncoding("UTF-8");
	String ac_Name = request.getParameter("ac_Name");
	String ac_Phone = request.getParameter("ac_Phone");
	String ac_Birth = request.getParameter("birth_year");
	String ac_Month = request.getParameter("birh_month");
	String ac_Day = request.getParameter("user_birth_day");
	String[] ac_Lang_arr = request.getParameterValues("ac_Lang");
	String ac_Lang="";
	if(ac_Lang != null){
		ac_Lang = ac_Lang_arr[0];
		for(int i =1;i<ac_Lang_arr.length;i++)
		{ ac_Lang += ","+ac_Lang_arr[i]; }
	}
	
	ac_Birth += "-"+ ac_Month + "-" + ac_Day;
	NobodyDAO dao = new NobodyDAOimpl();
	
	Date date = Date.valueOf(ac_Birth);
	
	applicantVO vo = new applicantVO(ac_Name, ac_Phone, date, ac_Lang);
	
	
	dao.insert(vo);
	
	response.sendRedirect("../main/main.jsp");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>