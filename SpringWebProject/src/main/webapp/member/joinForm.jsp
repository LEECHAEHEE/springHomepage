<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="../resources/css/default.css" />
<link rel="stylesheet" href="../resources/css/joinForm.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	var pwCheck = false;
	
	$(function(){
		$("#email3").change(function(){
			var email3=$("#email3").val();
			if(email3=="직접입력"){
				$("#email2").val("").focus();
			}else{
				$("#email2").val($("#email3").val());	
			}
		})
		
		$("#pw1").keyup(function(){
			var pw1Length = $("#pw1").val().length;
			if(pw1Length<8){
				$("#pw1Check").text("비밀번호는 8자 이상이어야 합니다.").css("color","red");
				pwCheck=false;
			}else{
				$("#pw1Check").text("사용가능한 비밀번호 입니다.").css("color","blue");
			}
		})
		
		$("#pw2").keyup(function(){
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();
			if(pw1!=pw2){
				$("#pw2Check").text("비밀번호가 일치하지 않습니다.").css("color","red");
				pwCheck=false;
			}else{
				$("#pw2Check").text("비밀번호가 일치합니다.").css("color","blue");
				pwCheck=true;
			}
		})
		
		$("#joinForm").submit(function(){
			if(pwCheck==false){
				alert('비밀번호를 확인하세요');
				return false;
			}else{
				if(joinCheck()){
					alert('회원가입을 축하합니다! 로그인 후 서비스를 이용하실 수 있습니다.');
					return true;
				}else{
					alert('회원가입이 취소 되었습니다');
					return false;
				}
			}
		})
		
		function joinCheck(){
			return confirm("회원가입 하시겠습니까?");
		}
		
		$("#idCheck").click(function(){
			window.open('idCheck.jsp','_blank','top=100, left=100, width=400, height=250, resizable=no, location=no',true);
		})
	})
	
		
</script>
</head>
<body>
	<div class="joinForm">
	<h1>회원가입</h1>
	<form action="joinOK.do" id="joinForm" method="POST">
		<table>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" id="name" placeholder="이름" required>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" id="id" placeholder="아이디" required readonly>
					<button id="idCheck">아이디 중복 확인</button>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pw" id="pw1" placeholder="비밀번호" required>
					<span id="pw1Check"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input type="password" id="pw2" placeholder="비밀번호 확인" required>
					<span id="pw2Check"></span>
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<select name="birthYear" id="year">
						<c:forEach var="year" begin="1980" end="1999" step="1">
							<option value="${year}">${year}</option>
						</c:forEach>
					</select>
					<span>년</span>
					<select name="birthMonth" id="month">
						<c:forEach var="month" begin="1" end="12" step="1">
							<option value="${month}">${month}</option>
						</c:forEach>
					</select>
					<span>월</span>
					<select name="birthDay" id="day">
						<c:forEach var="day" begin="1" end="31" step="1">
							<option value="${day}">${day}</option>
						</c:forEach>
					</select>
					<span>일</span>
				</td>
			</tr>		
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email" id="email1" required>@
					<input type="text"  id="email2">.
					<select id="email3">
						<option selected>직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
					</select>
				</td>
			</tr>
		</table>
		<input type="submit" id="submit" value="회원가입"/>
		<input type="button" value="취소" onclick="history.back()" />
	</form>
</div>
</body>
</html>