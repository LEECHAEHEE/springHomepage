<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<link rel="stylesheet" href="../resources/css/default.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(function(){
		$("#id").focus();
		
		$("#idCheck").click(function(){
			if($.trim($("#id").val())==""){
				alert("아이디를 입력하세요");
				$("#id").val("").focus();
			}else{
				$.ajax({
					url : "idCheck.do",
					type : "POST",
					data : { id : $("#id").val() },
					success : function(result){
						if(result==1){
							alert("아이디가 이미 존재합니다.");
						}else{
							confirm("사용가능한 아이디입니다. 사용하시겠습니까?")?
								alert("ok"):
								alert("no");
						}
					}
				})
			}
		})
	})
</script>
<body>
	<fieldset>
		<legend>아이디 중복 확인</legend>
		<input type="text" id="id" maxlength="13"/>
		<button id="idCheck">중복 확인</button>
	</fieldset>
</body>
</html>