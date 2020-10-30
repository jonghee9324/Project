<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의물 공유 글쓰기</title>
<style type="text/css">
.btndiv{
	width:600px;
	margin:10px auto; 
}

</style>
<link href="upload_write.css" rel="stylesheet"/>
</head>
<body>	
	<div>
	    <form method="post" action="upload_write_insert.jsp" enctype="Multipart/form-data">
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
		         	<td><input class="title" type="text" name="up_title"></td>
		        </tr>       
		        <tr>
		         	<th class="contentth" >내용</th>
		         	<td><textarea class="content" name="up_content" ></textarea></td>
		        </tr>
		        <tr>
				         <th class="titleth">첨부파일</th>
				         <td><input type="file" name="up_task" class = "upload_file"></td>
				</tr>
		        
		       </tbody>
		     </table>
		     <div class="btndiv" >
		     	<input class="btn" type=button value="취소"  OnClick="window.location='upload_list.jsp'">
		     	<input class="btn" type=submit value="등록" >				
			</div>
		</form>
    </div>
</body>
</html>