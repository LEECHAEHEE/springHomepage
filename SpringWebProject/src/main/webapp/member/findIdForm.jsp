<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/member/default.css" />
<style>
	.idFindFormMsg { width: 500px; margin: auto; text-align: center;}
	.idFindFormMsg p{ line-height: 2em;}
	.idFindFormMsg input[type="text"] { width: 320px; height: 45px; font-size: 20px; padding: 10px; box-sizing: border-box;}
	
	#findIdBtn { width: 54px; height: 50px ;font-size: 15px;text-align: center; border:1px solid black; background:transparent; cursor:pointer}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="idFindFormMsg">
	<p>회원 가입시 입력하신 이메일 주소를 입력하시면,<br/>
	해당 이메일로 아이디 및 비밀번호 변경 링크를 보내드립니다.</p>
	<input type="text" placeholder="이메일 형식으로 입력하세요"/>
	<button id="findIdBtn">찾기</button>
</div>
</body>
</html>