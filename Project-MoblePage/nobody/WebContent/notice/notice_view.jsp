<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nobodyDB.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판 내용</title>
<link href="notice_view.css" rel="stylesheet"/>
</head>


<body>   
 <%
  	request.setCharacterEncoding("utf-8");
  	String title = request.getParameter("nt_Title");
  	String content = request.getParameter("nt_Content");
  	String date = request.getParameter("nt_Date");	

%>
<div>
	
	<table class="view">

		<thead>
			<tr>
				<th colspan="3" height="25" >글 보기 </th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="title" colspan="2"><%= title %></td>
				<td class="date" colspan="1"  style="text-align: center;"><%= date %></td>
			</tr>
			<tr>
				<td colspan="3" > <%= content%></td>
			</tr>
		</tbody>
					
	</table>	
	<div class="btndiv" >
		<input class="btn" type=button value="되돌아가기" OnClick="window.location='notice_list.jsp'">
	</div>
</div>
</body>
</html>