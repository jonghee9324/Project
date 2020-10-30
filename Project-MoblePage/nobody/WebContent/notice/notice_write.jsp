<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.text.*" %>

<html>
<head>
<title>공지사항 글쓰기</title>
<link href="notice_write.css" rel="stylesheet"/>
</head>
<body>
    <div>
    <form method=post action="notice_write_insert.jsp">
     <table class="view"  width=600px height=400px>
     <colgroup>
		<col style="width:100px;" />
		<col />
	</colgroup>
       <tbody>
       <tr>
			<th class="emdfhr" colspan="2" >등록</th>
		</tr>
       	<tr>
         <th class="titleth">제목</th>
         <td><input class="title" type="text" name="nt_Title"></td>
        </tr>       
        <tr>
         <th class="contentth" >내용</th>
         <td><textarea class="content" name="nt_Content" ></textarea></td>
        </tr>
        
       </tbody>
     </table>
     <div class="btndiv"  >
     	<input class="btn" type=button value="취소"  OnClick="window.location='notice_list.jsp'">
     	<input class="btn" type=submit value="등록" >
		
		</div>
		</form>
    </div>


</body>
</html>

 