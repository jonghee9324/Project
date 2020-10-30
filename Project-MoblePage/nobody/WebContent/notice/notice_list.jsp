<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nobodyDB.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<style>
	
.writebutton:hover {
	background-color:#999;
	color: #fff;
	cursor:pointer
}
</style>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
<link href="../upload/upload_list.css" rel="stylesheet"/>
</head>
<body>
   <header> 
	    <!-- Top header menu containing 
	         logo and Navigation bar -->
	    <div id="top-header"> 
	               
	        <!-- Logo -->
	        <div id="logo"> 
	            <a href="../main/main.jsp"><img src="../images/moble2.jpg" /></a>    
	                   
	        <!-- Navigation Menu -->
	        <nav id="menu"> 
	            <ul> 
	            
	            <li class="active"><a href="../main/main.jsp">Home</a></li>
	            
	            <li class="active"><a href="../notice/notice_list.jsp">공지사항</a></li>
	            <li class="active"><a href="../upload/upload_list.jsp">강의물공유</a></li>
	            <%
	            	String userpart = (String)session.getAttribute("userpart");
	            	if(userpart.equals("학생")) { %>
	            		<li class="active"><a href="../applicant/applicantform.jsp">교육신청</a></li>
	            <% } else { %>
	            		<li class="active"><a href="../applicant/applist.jsp">교육신청목록확인</a></li>
	            <% } %>
	             
	            <%String userid = (String)session.getAttribute("userid");	            	
	              if(userid == null ) {  %>
	                <li><a href="../Login/LoginForm.jsp">Login/Join</a></li> 
	             <% }else { %>
	             	<li><a href="../Login/logout.jsp">Logout</a></li> 
	             <% } %>   
	             
	             <li><input type="search" placeholder="search"></li>
	             <input type="button" class="img-button"/>
	          
	            </ul> 
	        </nav> 
	    </div> 
	    </div></header>
    <section class="content">
    	<div>	    	
	    	<img src="../images/공지사항문구.jpg" style="margin-left:20%;margin-bottom:1%;width:250px; height:50px;">	    	
	    </div>
        <form action="notice_write.jsp" method="post">
            <table class="upload_tbl">
                <tr>
                    <th class="bordnum">번호</th>
                    <th class="bordtitle">제목</th>
                    <th class="borddate">등록일</th>                    
                </tr>
                <%
                NobodyDAO ndao = new NobodyDAOimpl();
              List<noticeVO> noticeList = ndao.notice_getList();
               int count = 0;
               for(noticeVO nvo : noticeList) { 
                  count++;               
                  if (count%2==0) { %>
                     <tr id = "<%= nvo.getnt_Content() %>" class="even">
                  <% } else {%>
                     <tr id = "<%= nvo.getnt_Content()  %>">
                  <% } %>                                       
                        <td><%= nvo.getnt_no() %></td>
                        <td><%= nvo.getnt_Title() %></td>                     
                        <td><%= nvo.getnt_Date() %></td>
                        <script type="text/javascript">
                             // 영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
                             // 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
                                document.getElementById("<%=nvo.getnt_Content()  %>").addEventListener("click", function(event) {
                                 event.preventDefault();// a 태그의 기본 동작을 막음
                                 event.stopPropagation();// 이벤트의 전파를 막음
                                 // fileName1을 utf-8로 인코딩한다.                 
                                 
                                  var ntcontent = encodeURI("<%= nvo.getnt_Content()  %>")
                                var nttitle = encodeURI("<%= nvo.getnt_Title()  %>")
                                var ntdate = encodeURI("<%= nvo.getnt_Date()  %>")
                                 // 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
                                  window.location.href ="notice_view.jsp?nt_Content="+ntcontent+"&nt_Title="+ nttitle + "&nt_Date="+ ntdate
                                
                                });
                         </script>                     
                     </tr>                  
            <%   }   %>
                
            </table>
            <div>
               <%
            		
            		if(userpart.equals("강사")) {
            	%>
            			<input type="submit" value="글쓰기" class = "writebutton">
            	<% 	} %>
            </div>
        </form>
        
    </section>
</body>
</html>