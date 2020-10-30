<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
h2 {
	color: rgb(42, 123, 245);
}
img{
	width: 200px;
	height: 100px;
	align:"center";
}
a {
	font-size: 50;
	color: rgb(049,096,152); 
}
</style>
<title>교육 가입 신청서</title>
</head>
<body>
	<form action="applicant.jsp" method="post">
		<table class="form"width="300" border="0" align="center">
			<tbody>
			<tr>
				<td align="center">
				<a href="../main/main.jsp"><img src="../images/moble2.jpg" /></a>
				</td>
			</tr>
		</tbody></table>
		<hr width="600" align="center">
		<table width-"300"="" border="0" align="center">
			<tbody>
			<tr>
				<td colspan="2" align="center" height="50">
				<a><기본 입력 사항></a>
				</td>
			</tr>
			<tr>
				<td width="100">이름 : </td>
				<td>
					<input type="text" name="ac_Name" size="15" autofocus="">
				</td>
			</tr>
			<tr>
				<td width="100">전화번호 : </td>
				<td>
					<input type="text" name="ac_Phone" size="15">
				</td>
			</tr>
			<tr>
				<td width="100">생년월일 : </td>
				<td><select name="birth_year">
						<option value="2000" selected>2000</option>
						<option value="1999" selected>1999</option>
						<option value="1998" selected>1998</option>
						<option value="1997" selected>1997</option>
						<option value="1996" selected>1996</option>
						<option value="1995" selected>1995</option>
						<option value="1994" selected>1994</option>
						<option value="1993" selected>1993</option>
						<option value="1992" selected>1992</option>
						<option value="1991" selected>1991</option>
						<option value="1990" selected>1990</option>
					</select>
				년
				<select name="birh_month">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				월
				<select name="user_birth_day">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>
				일
				</td>
			</tr>
		</tbody></table>
		<br>
		<table width="300" border="0" align="center">
			<tbody>
			<tr>
				<td colspan="2" align="center" height="50">
				<a><추가 입력 사항></a>
				</td>
			</tr>
			<tr>
				<td width="400"><h4>관심 있는 프로그래밍 기술은?</h4></td>
			</tr>
			<tr>
				<td width="80">
					<input type="checkbox" name="ac_Lang" value="Python">Python
				</td>
				<td>
					<input type="checkbox" name="ac_Lang" value="C++">C++
				</td width="80">
			</tr>
			<tr>
				<td width="80">
					<input type="checkbox" name="ac_Lang" value="C">C
				</td>
				<td width="80">
					<input type="checkbox" name="ac_Lang" value="JAVA">JAVA
				</td>
			</tr>     
		</table>
		<table width="300" border="0" align="center">
			<tbody>
			<br>
			<tr>
				<td><input type="submit" value="가입신청"></td>
				<td></td>
				<td><input type="reset" value="다시쓰기"></td>
			</tr>

		</tbody></table>
	</form>   


</body>
</html>