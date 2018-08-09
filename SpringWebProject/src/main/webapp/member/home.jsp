<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 프로젝트</title>
<link rel="stylesheet" href="../resources/css/member/default.css" />
<link rel="stylesheet" href="../resources/css/member/home.css" />
</head>
<body>
<div class="loginWrap">
	<div class="login">
		<c:choose>
			<c:when test="${loginMember==null}">
				<button class="loginBtn" onclick="location.href='loginForm.do'">로그인</button><br>
				<ul>
					<li><a class="find" href="findForm.do">아이디/비밀번호찾기</a></li>
					<li><a class="joinTxt" href="joinForm.do">회원가입</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<button class="loginBtn" onclick="location.href='logoutForm.do'">로그아웃</button><br>
				<a href="memberInfo.do">회원정보</a>
			</c:otherwise>
		</c:choose>
		
	</div>
</div>
</body>
</html>