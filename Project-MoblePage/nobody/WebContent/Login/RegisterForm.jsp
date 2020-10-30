<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nobodyDB.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link href="join.css" rel="stylesheet"/>
<script>
function spaceCheck(){//공백이 있는지 경고하기
	   if(!document.regform.userid.value){
	      alert("아이디를 입력하세요.");
	      return false;
	   }
	   if(!document.regform.password.value){
	      alert("비밀번호를 입력하세요.");
	      return false;
	   }
	   if(!document.regform.birth.value){
	      alert("생년월일를 입력하세요.");
	      return false;
	   }
	   if(!document.regform.part.value){
	      alert("역할를 입력하세요.");
	      return false;
	   }
	   if(document.regform.password.value != document.regform.passwordck.value){
	      alert("비밀번호가 서로 다릅니다.");
	      return false;
	   }
	}
function checkNum(e) {//숫자만 입력 하게 만들기  
    if((e.keyCode >= 48) && (e.keyCode <= 57) ||e.keyCode==8||e.keyCode==9){
        return true;
    }
    else{
        alert("숫자만 입력 가능합니다.");
        document.getElementById("birth").value="";
        return false;
    }
}
</script>
</head>
<body>
    <form action = "RegisterServlet.jsp" method="post" name="regform" onSubmit="return spaceCheck()" >
    <div> &nbsp; </div>
    <div> &nbsp; </div>
        <div id="regLogodiv">
            <a href="../main/main.jsp"><img src="../images/moble2.jpg" id="regLogo"></a>
        </div>
    <div> &nbsp; </div>
    <div> &nbsp; </div>
    <div id="regWrap">   
        &nbsp;
      <label class="legend"><strong>아이디</strong></label>
      <div id="join-div" method="get">
         <input name="userid" type="text">         
      </div>   
      <label class="legend"><strong>비밀번호</strong></label>
      <div id="join-div" method="get">
         <input name="password" type="password">
        </div>
        <label class="legend"><strong>비밀번호 확인</strong></label>
      <div id="join-div" method="get">
         <input name="passwordck" type="password">
        </div>
        <label class="legend"><strong>이름</strong></label>
      <div id="join-div" method="get">
         <input name="name" type="text">         
      </div>
        <label class="legend"><strong>생년월일</strong></label>
      <div id="join-div" method="get">
         <input name="birth" type="text" onKeydown="checkNum(event)" id="birth">
      </div>
        <label class="legend"><strong>역할</strong></label>
      <div id="join-div" method="get">
         <select id = "sel" name = "part" aria-label="월">
               <option value>선택</option>
               <option value="강사">강사</option>
               <option value="학생">학생</option>
            </select>
        </div>
        <div> &nbsp; </div>
        <div> &nbsp; </div>
        <input type="submit" value="가입하기" class="reg">
        <div> &nbsp; </div>
        <div> &nbsp; </div>
        <div> &nbsp; </div>
       
    </div>
    <div> &nbsp; </div>
    <div> &nbsp; </div>
    <div> &nbsp; </div>
</form>
</body>
</html>