<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="nobodyDB.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn{
 float:center;
 
    background-color: #E8ECF6;
    border-style: none;
   
    text-align: center;
     width: 100px;
    height: 30px;

    font-size: 15px;
}
.btn:hover{
	background-color:#999;
	color: #fff;
	cursor:pointer
}
</style>
</head>
<body>
	<%
	   request.setCharacterEncoding("utf-8");
	
	   String nt_Title = request.getParameter("nt_Title");
	   String nt_Content = request.getParameter("nt_Content");
	   NobodyDAO dao = new NobodyDAOimpl();
	   noticeVO vo = new noticeVO(nt_Title, nt_Content);
	   boolean result = dao.notice_insert(vo);
	   if(result) {
		   response.sendRedirect("notice_list.jsp");
	   }
	   else{
		   out.print("실패");
	   }
	   
	   
	%>


</body>
</html>