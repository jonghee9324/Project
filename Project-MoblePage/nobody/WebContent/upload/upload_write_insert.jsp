<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="nobodyDB.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	    // request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
	    String uploadPath = request.getRealPath("/uploadFile");
	    out.println("절대경로 : " + uploadPath +"<br/>");	     
	    int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한	     
	    String up_title ="";
	    String up_content ="";	     
	    String up_task ="";// 중복처리된 이름
	    String originalName1 ="";// 중복 처리전 실제 원본 이름
	    long fileSize =0;// 파일 사이즈
	    String fileType ="";// 파일 타입
	     
	    MultipartRequest multi =null;
	     
	    try{
	        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
	        multi =new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
	         
	        // form내의 input name="name" 인 녀석 value를 가져옴
	        up_title = multi.getParameter("up_title");
	        // name="subject" 인 녀석 value를 가져옴
	        up_content = multi.getParameter("up_content");
	         
	        // 전송한 전체 파일이름들을 가져옴
	        Enumeration files = multi.getFileNames();
	         
	        while(files.hasMoreElements()){
	            // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
	            String file1 = (String)files.nextElement();// 파일 input에 지정한 이름을 가져옴
	            // 그에 해당하는 실재 파일 이름을 가져옴
	            originalName1 = multi.getOriginalFileName(file1);
	            
	            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
	            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
	            up_task = multi.getFilesystemName(file1);
	            
	            // 파일 타입 정보를 가져옴
	            fileType = multi.getContentType(file1);
	            // input file name에 해당하는 실재 파일을 가져옴
	            File file = multi.getFile(file1);
	            // 그 파일 객체의 크기를 알아냄, 파일 length 반환타입 : long
	            fileSize = file.length();
	        }
	    }catch(Exception e){
	    	
	        e.printStackTrace();
	    }
	%>
	<!--
	    해당 페이지는 사용자에게 보여줄 필요가 없고 해당 정보를 전달만 해주면 되기 때문에 hidden으로 했다.
	 -->
	<form action="fileCheck.jsp" method="post" name="fileCheckFormName">
	    <input type="hidden" value="<%=up_title%>" name="up_title" />
	    <input type="hidden" value="<%=up_content%>" name="up_content" />
	    <input type="hidden" value="<%=up_task%>" name="up_task" />
	    <input type="hidden" value="<%=originalName1%>" name="originalName1" />
	</form>
	<%
		
		if(up_task==null){
			out.print("<script>alert(\"파일 업로드를 해주세요.\")<script>");
		}
		else {
			UploadVO uvo = new UploadVO(up_title, up_content, up_task);
			NobodyDAO udao = new NobodyDAOimpl();
			boolean result = udao.upload_insert(uvo);
			
			if(result){
				response.sendRedirect("upload_list.jsp");		
			}
			else{
				out.print("오류입니다.");
			}
		}
		
	%>
</body>
</html>