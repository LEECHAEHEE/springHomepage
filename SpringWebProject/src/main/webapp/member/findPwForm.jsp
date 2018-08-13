<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<style>
	#findIdPwFormWrapper {position: relative; width: 370px; padding:15px 0; box-sizing:border-box; height: 500px; margin: auto; border:1px solid black; text-align: center; top: 100px;}
	#findIdPwFormWrapper table { width: 100%; text-align: center; }
	#findIdPwFormWrapper table td {height:50px; box-sizing: border-box;}
	
	#errorMsgName {position: relative; left:-100px}
	#errorMsgId	{position: relative; left:-100px}
	
	#findIdPwForm {position: relative;top: 25px;}
	
	.inputTextForm {width: 300px;height: 40px;}
	.inputSubmit { width: 300px;height: 40px; color:#a9a9a9; background-color: transparent; border:1px solid #a9a9a9}
	.inputSubmit:hover {color:#fff; background-color: #000}
	
 	#certiNum {visibility:hidden; width: 100%;text-align: center; margin-top: 50px} 
 	#certiNum input { margin:10px 0;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/member/default.css" />
<script type="text/javascript">
	$(function(){
		var certiNumFromCtrl = "";
		var idFromCtrl = "";
		$("#name").focus();
		
		$("#findIdPwForm").submit(function(e){
			e.preventDefault(); //form 처리를 완전히 jquery 에서 담당.
			var inputName = $("#name").val();
			var inputId = $("#id").val();
			/*form 검사*/
			if($.trim(inputName)==""){
				$("#errorMsgName").text("이름을 입력하세요");
				$("#name").focus();
			}else if($.trim(inputId)==""){
				$("#errorMsgId").text("아이디를 입력하세요");
				$("#id").focus();
			}else{
				$.ajax({
					type :"POST",
					url : "findPwByNameId.do",
					dataType : "json",
					data : {
						name : inputName,
						id : inputId
					},
					success : function(result){
						if($.isEmptyObject(result)){
							alert("입력하신 정보와 일치하는 회원이 없습니다.");
						}else{
							certiNumFromCtrl = result.certiNum;
							idFromCtrl = result.id;
							$("#certiNum").css("visibility","visible").focus();
							console.log(result.certiNum);
						}
					}
				})
			}
		})
		
		$("#CheckCertiNumBtn").click(function(){
			var inputCertiNum = $("#inputCertiNum").val();
			console.log(inputCertiNum);
			if(inputCertiNum == certiNumFromCtrl){
				location.href="changePwForm.do?id=" + idFromCtrl;
			}else{
				$("#errorMsgCertiNum").text("인증번호가 틀립니다");
			}
		})
			
		
		$("#name").keyup(function(){
			$("#errorMsgName").text("");
		})
		$("#id").keyup(function(){
			$("#errorMsgId").text("");
		})
	})
</script>
</head>
<body>
<div id="findIdPwFormWrapper">
<h2>비밀번호 찾기</h2>
<form action="findPwByNameId.do" id="findIdPwForm">
<table>
	<tr>
		<td colspan="2"><p>가입시 기입했던 이름과 아이디를 입력하세요.</p></td>
	</tr>
	<tr>
		<td>
			<input type="text" id="name" name="name" class="inputTextForm" placeholder="이름"/><br>
			<p class="errorMsg" id="errorMsgName"></p>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="id" name="id" class="inputTextForm" placeholder="아이디"/><br>
			<p class="errorMsg" id="errorMsgId"></p>
		</td>
	</tr>
	<tr>
		<td  colspan="2"><input type="submit" class="inputSubmit" value="비밀번호 찾기"/></td>
	</tr>
</table>
</form>
<div id="certiNum">
	<input type="text" name="certiNum" id="inputCertiNum" class="inputTextForm" placeholder="이메일로 받은 인증번호 6자리를 입력하세요"/><br>
	<p class="errorMsg" id="errorMsgCertiNum"></p>
	<input type="button" class="inputSubmit" id="CheckCertiNumBtn" value="인증번호 확인"/>
</div>
</div>
</body>
</html>