<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의물 공유 게시판 내용</title>
<style>
	
</style>
<link href="upload_view.css" rel="stylesheet"/>
</head>
<body>
	<%
		 request.setCharacterEncoding("UTF-8");        
	    // input type="name" 의 value값을 가져옴
	    String up_title = request.getParameter("up_title");
	    // input type="subject" 의 value값을 가져옴
	    String up_content = request.getParameter("up_content");
	    // 중복방지용으로 만들어져 넘겨진 파일명을 가져옴
	    String up_task = request.getParameter("up_task"); 
	    String up_date = request.getParameter("up_date");
	    // 본래의 파일명을 가져옴	    
	%>	         
	
	<table class="view">

		<thead>
			<tr>
				<th colspan="3" height="25" >글 보기 </th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="title" colspan="2"><%= up_title %></td>
				<td class="date" colspan="1"  style="text-align: center;"><%= up_date %></td>
			</tr>
			<tr>
				<td colspan="3" > <%= up_content%></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="2" class= "task"><a id="downA" href="#"><%=up_task%></a></td>
				<script type="text/javascript">
			        // 영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
			        // 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
			        document.getElementById("downA").addEventListener("click", function(event) {
			            event.preventDefault();// a 태그의 기본 동작을 막음
			            event.stopPropagation();// 이벤트의 전파를 막음
			            // fileName1을 utf-8로 인코딩한다.
			            var fName = encodeURIComponent("<%=up_task%>");
			             
			            // 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
			            window.location.href ="upload_FileDown.jsp?up_task="+fName;
			        });
			    </script>
			</tr>
			
		</tbody>
					
	</table>	
	<div class="btndiv" >
		<input class="btn" type=button value="되돌아가기" OnClick="window.location='upload_list.jsp'">
	</div>
</div>
</body>
</html>