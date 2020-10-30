<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moble 홈페이지</title>
<style>
/*****************************/
/* Styling Header Image Menu */
/*****************************/
/*모블로고 */
#top-header img{ 
	width:170px;
	height:80px;
	position: relative;
	left:150px;

}

#img-button{
     background: url("https://image.flaticon.com/icons/svg/860/860824.svg") no-repeat;
    border: none;
    width: 32px;
    height: 32px;
    cursor: pointer;
}
/*큰 배경 이미지*/
#header-image-menu{ 
    top: 0px; 
    position: relative;
} 
  
#header-image-menu img{ 
    width: 80%;
    height: 0%; 
    margin: none; 
    padding: none; 
    border:none;
} 

/***************************/
/* Styling Navigation Menu */
/***************************/
#menu{ 
	position: relative;
	right: 60px;
    float: right; 
    margin: 5px; 
} 

#menu ul{ 
    text-align: center; 
    float: right; 
    margin: none; 
    background: white;
} 
      
#menu li{ 
    display: inline-block; 
    padding: none; 
    margin: none; 
} 
      
#menu li a, #menu li span{ 
    display: inline-block; 
    padding: 0 13px; 
    text-decoration: none; 
    font-weight: 600; 
    text-transform: uppercase; 
    line-height: 60px; 
} 
      
#menu li a{ 
    font-size: 20px;
    color: rgb(049,096,152); 
} 
      
#menu li:hover a, #menu li span{ 
    background: #FFF; 
    color: #0074D9; 
    border-left: 1px solid #0074D9; 
    text-decoration: none; 
    
}

/**********************************/
/* Styling Main content Section 1 */
/**********************************/
#welcome 
{    overflow: hidden; 
    width: 1000px; 
    margin: 0px auto; 
} 
          
#welcome .title{ 
    margin-top: 20px; 
    padding: 20px; 
    text-align: center; 
} 
  
#welcome p{ 
    margin-bottom: 40px; 
    text-align: center; 
} 

/*****************************************/
/*     Styling Main Content Section 3    */
/*****************************************/
  
#section-2{ 
    overflow: hidden; 
    padding-top: 5em; 
    border-top: 1px solid rgba(0, 0, 0, 0.2); 
    text-align: center; 
} 
  
.image 
{ 
    display: inline-block; 
    border: none;
    border-radius: 5px; 
} 
      
/*.image img 
{
	
    display: block; 

} 
*/
      
.image-full 
{ 
    display: block; 
    width: 140px;
    height: 140px; 
    margin: 0 0 3em 0; 
} 
      
.img-title{ 
    display: block; 
    padding-bottom: 1em; 
    font-size: 1em; 
    color: rgba(0, 0, 0, 0.6); 
} 
  
/* Add fixed width for each column and 
   align text to center */
#column1, 
#column2, 
#column3
{ 
    width: 282px; 
    text-align: center;
    float: left; 
    margin-right: 50px; 
    position: relative;
    left: 330px;
} 
      

      
/*button*/

.button {
	position: relative;
	right:70px;
	margin-top: 20px;
    text-decoration: none; 
    text-align: center; 
    display: inline-block; 
    font-size: 18px; 
    position:relative;
    background-color: #81BEF7;  
    color: white;  
    border: 2px solid #81BEF7;
    padding: 16px 32px; 
    margin: 4px 2px; 
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s; 
    cursor: pointer; 
} 
      
.button:hover { 
    background-color: white; 
    color: #58ACFA; 
} 

</style>
</head>
<body style="margin:0px">

<!-- Header Menu of the Page -->
<header> 
    <!-- Top header menu containing 
         logo and Navigation bar -->
    <div id="top-header"> 
               
        <!-- Logo -->
        <div id="logo"> 
            <a href="main.jsp"><img src="../images/moble2.jpg" /></a>    
                   
        <!-- Navigation Menu -->
        <nav id="menu"> 
            <ul> 
            
            <li class="active"><a href="main.jsp">Home</a></li>
            
            <li class="active"><a href="#">About</a></li>
             
            <%String userid = (String)session.getAttribute("userid");            	
              if(userid == null ) { %>
                <li><a href="../Login/LoginForm.jsp">Login/Join</a></li> 
             <% }else { %>
             	<li><a href="../Login/logout.jsp">Logout</a></li> 
             <% } %>   
             
             <li><input type="search" placeholder="search"></li>
             <input type="button" style="WIDTH: 15pt; HEIGHT: 15pt" id="img-button" />
          
            </ul> 
        </nav> 
    </div>     
   
    <!-- Image menu in Header to contain an Image and  
         a sample text over that image -->
    <div id="header-image-menu"> 
        <img class="back" src="../images/back.png">         
    </div> 
</header>

<main>  
    <section class="container" id="section-2">
    <%String session_part=(String)session.getAttribute("userpart");    
    if(session_part == null) //비회원
     {
     %>
        <div id="row"> 
            <!-- Column 3 -->
            <div id="column3" style="margin-left:25%; float:none;"> 
                <img src="../images/applicant.png" class="image image-full"> 

                <a href="../applicant/applicantform.jsp"  class="button">Applicant Apply</a> 
            </div> 
        </div> 
    </section> 
    <%
     }
    else if(session_part.equals("학생")) //회원
    {
    %>
    <div id="row">                       
            <!-- Column 1 -->
            <div id="column1"> 
                <img src="../images/notice.png" class="image image-full"> 
            
                <a href="../notice/notice_list.jsp"  class="button">Notice</a> 
                
            </div> 
                          
            <!-- Column 2 -->
            <div id="column2"> 
                  
                <img src="../images/file.png" class="image image-full"> 
            
                <a href="../upload/upload_list.jsp"  class="button">File Upload</a> 
            </div> 
                         <!--   
            <!-- Column 3 -->
            <div id="column3"> 
              
                <img src="../images/applicant.png" class="image image-full">           
                <a href="../applicant/applicantform.jsp"  class="button">Applicant Apply</a> 
            </div> 
           
        </div> 
     <%
    }
   
    else if(session_part.equals("강사")) // 관리자 로그인 한 상태
    {
    %>
    <div id="row"> 
            <!-- Column 1 -->
            <div id="column1"> 
                <img src="../images/notice.png" class="image image-full"> 

                <a href="../notice/notice_list.jsp"  class="button">Notice</a> 
            </div> 
                          
            <!-- Column 2 -->
            <div id="column2"> 
                <img src="../images/file.png" class="image image-full"> 
          
                <a href="../upload/upload_list.jsp"  class="button">File Upload</a> 
            </div> 
                          
            <!-- Column 3 -->
            <div id="column3"> 
              
                <img src="../images/applicant.png" class="image image-full"> 
                                            
                <a href="../applicant/applist.jsp"  class="button">Applicant Confirm</a> 
            </div> 
     </div> 
    <%
    }
    %>
     <section>
        <div id="welcome">
            <h1 class="title">welcome to our website</h1>
            <p>
                <a href="https://map.naver.com/v5/entry/place/17626545?c=14153981.0407014,4412410.5838284,15,0,0,0,dh" 
                target="_blank" rel="nofollow">천안시 동남구 대흥로 255 화일빌딩 4층(천안역 도보 3분)</a></br>
                
                <a>The fourth floor of the 255-File Building in Daeheung-ro, Dongnam-gu, Cheonan-si(Cheonan Station Walk 3 Minutes)  </a>
                <b><br>Tel : 041-417-1130</b>

            </p>
        </div>
    </section>
    
</main>
</body>