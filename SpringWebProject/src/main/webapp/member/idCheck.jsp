<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<link rel="stylesheet" href="../resources/css/member/default.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(function(){
		$("#id").focus();
		/*비동기 통신으로 아이디 중복 검사.*/
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
							if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
								/*부모창에 입력된 아이디 전달 후 창 닫음*/
								$(opener.document).find("#id").val($("#id").val());
								self.close();
							}else{
								$("id").focus();
							}
						}
					}
				})
			}
		})
	})
</script>
<body>
	<fieldset id="idFieldset">
		<legend>아이디 중복 확인</legend>
		<input type="text" id="id" maxlength="13"/>
		<button id="idCheck">중복 확인</button>
	</fieldset>
</body>
</html>