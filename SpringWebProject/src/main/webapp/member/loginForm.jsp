<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
<link rel="stylesheet" href="../resources/css/member/default.css" />
<link rel="stylesheet" href="../resources/css/member/loginForm.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var log = false;
		
		$("#idCheck").click(function(){
			if($.trim($("#id").val())==""){
				/*아이디 입력 하지 않음*/
				$("#idMsg").text("아이디를 입력하세요");
			}else{
				/*패스워드 입력 하지 않음*/
				if($.trim($("#pw").val())==""){
					$("#pwMsg").text("패스워드를 입력하세요");
				}else{
					/*로그인 로직 with Ajax*/
					$.ajax({
						url : "loginOK.do",
						type : "POST",
						data : { 	
								id : $("#id").val(),
								pw : $("#pw").val()
							   },
						success : function(result){
							/*로그인 성공*/
							if(result==1){
								$("#idCheckResult").text("");
								location.href="home.do";
							}else{
								$("#idCheckResult").text("아이디 혹은 비밀번호가 일치하지 않습니다.");
							}
						}
					})
				}
			}
		})//$("#idCheck").click(function(){
		
		$("#id").keyup(function(){
			$("#idMsg").text("");
		})
		
		$("#pw").keyup(function(){
			$("#pwMsg").text("");
		})	
		
	})
</script>
</head>
<body>
<div>
	<div id="idFormOuterWrapper">
		<div id="idFormInnerWrapper">
			<div id="idForm">
				<input type="text" name="id" id="id" placeholder="아이디"/><br>
				<p class="errorMsg" id="idMsg"></p>
				<input type="password" name="pw" id="pw" placeholder="비밀번호"/><br>
				<p class="errorMsg" id="pwMsg"></p>
				<input type="button" value="로그인" id="idCheck" />
				<p class="errorMsg" id="idCheckResult"></p>
			</div>
			<div id="findForm">
				<table>
					<tr>
						<td><a class="memberHref" href="findIdForm.do">아이디 찾기</a></td>
						<td><a class="memberHref" href="findPwForm.do">비밀번호 찾기</a></td>
						<td><a class="memberHref" href="joinForm.do">회원가입</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>