<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.PreparedStatement" %>
<%@page import = "java.sql.ResultSet" %>
<%@page import = "java.sql.SQLException" %>
<%@page import = "java.util.List" %>
<%@page import = "nobodyDB.*" %>
    
	<%
		NobodyDAO dao = new NobodyDAOimpl();
		List<applicantVO> list = dao.getList();		
	%>

<!DOCTYPE html>
<html>
<head>
<style>
h2 {
color: rgb(049,096,152);

}
table{
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
   padding:8px;
}
th, td {
  border-bottom: 1px solid #444444;
  padding: 10px;
  text-align: center;
}
  th {
    background-color: #bbdefb;
  }
  td {
    background-color: #e3f2fd;
  }

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>■■■■■신청자 리스트■■■■■</h2>

<table class="list">
 	<thead>
   	<tr>
   		<th>No</th>
      	<th>Name</th>
      	<th>Phone</th>
      	<th>Birth</th>
      	<th>Like Language</th>
   </tr>
 	</thead>
 	<tbody>
 	<%
 	for(applicantVO vo : list) {
 	%>
   <tr>
   	  <td width=""><%=vo.getNo() %></td>
      <td width=""><%=vo.getName() %></td>
      <td width=""> <%=vo.getPhone() %></td>
      <td width=""> <%=vo.getBirth() %></td>
	  <td width=""> <%=vo.getLang() %></td>
   </tr>
   <%
      }
   %>
 	</tbody> 
</table>
</body>
</html>