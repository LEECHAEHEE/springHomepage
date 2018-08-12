<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#findOKWrapper {position: relative; top: 100px; width: 40%; height: 200px; margin: auto; border:1px solid black; text-align: center; }
	#findOKWrapper table { text-align: center; width: 100%;}
	#findOKWrapper table button{ margin:0 50px;}
</style>
</head>
<body>
<div id="findOKWrapper">
<table>
	<tr>
		<td><h3>아이디 확인</h3></td>
	</tr>
	<tr>
		<td><p>${name}님의 아이디는<b> ${id} </b>입니다</p></td>
	</tr>
	<tr>
		<td>
			<button onclick="location.href='loginForm.do'">로그인</button>
			<button onclick="location.href='home.do'">홈페이지로</button>
		</td>
	</tr>
</table>
</div>
</body>
</html>