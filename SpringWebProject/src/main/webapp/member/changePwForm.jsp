<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/member/default.css" />
<style>
	#changePwFormWrapper {position: relative; width: 450px; margin: auto; text-align: center; top: 100px; border: 1px solid black; padding:10px; box-sizing: border-box;}
	
	#errorMsgPw {position: relative; left:-100px}
	#errorMsgPwCheck {position: relative; left:-100px}
	
	#findIdPwForm table { width: 100%; text-align: center;}
	#findIdPwForm table td {height: 75px; box-sizing: border-box;}
	#findIdPwForm table input {width: 300px;height: 35px;}
	#findIdPwForm table input[type="submit"] {background-color: transparent; border:1px solid black; }
	#findIdPwForm table input[type="submit"]:hover {color:#fff; background:#000}
	
</style>
<script type="text/javascript">
	$(function(){
		$("#newPw").focus();
		
		$("#findIdPwForm").submit(function(){
			var newPw = $.trim($("#newPw").val());
			var newPwCheck = $.trim($("#newPwCheck").val());
			if(newPw==""){
				$("#errorMsgPw").text("비밀번호를 입력하세요.");
				$("#newPw").focus();
				return false;
			}else if(newPwCheck==""){
				$("#errorMsgPwCheck").text("비밀번호 확인을 입력하세요.");
				$("#newPwCheck").focus();
				return false;
			}else if(newPw!=newPwCheck){
				return false;
			}else{
				return true;
			}
		})
		
		$("#newPw").keyup(function(){
			$("#errorMsgPw").text("");
		})
		$("#newPwCheck").keyup(function(){
			$("#errorMsgPwCheck").text("");
		})
	})
</script>
</head>
<body>
<div id="changePwFormWrapper">
<h2>비밀번호 변경</h2>
<form action="changePwOK.do" id="findIdPwForm" method="post">
<input type="hidden" name="id" value="${id}" />
<table>
	<tr>
		<td>
			<input type="password" id="newPw" name="newPw" placeholder="새 비밀번호"/><br>
			<p class="errorMsg" id="errorMsgPw"></p>
		</td>
	</tr>
	<tr>
		<td>
			<input type="password" id="newPwCheck" name="newPwCheck" placeholder="비밀번호 확인"/><br>
			<p class="errorMsg" id="errorMsgPwCheck"></p>
		</td>
	</tr>
	<tr>
		<td><input type="submit" id="newPwSubmit" value="비밀번호 변경" /></td>
	</tr>
</table>
</form>
</div>
</body>
</html>