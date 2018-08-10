<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/member/default.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>아이디 찾기</title>
<style>
	input[type="text"] { height: 30px; width: 250px;}
	
	.idFindFormWrapper { width: 500px; margin: auto;}
	.idFindFormWrapper p{ line-height: 2em; text-align: center;}
	
	.idFindFormWrapper table { width: 90%; margin: auto;}
	.idFindFormWrapper table tr td{ text-align: center;}	
	.idFindFormWrapper table tr td:first-child{ text-align: left;}
	
	.msgWrapper td { }
	.msgWrapper p {line-height: 1.5em; text-align: left; padding-left: 70px;}
	
	#certiNum { position: relative; display:inline-block; left:96px;}
	#findIdOkForm {position: relative; display: inline-block;}
/*  	.certiNum {visibility:hidden;}  */
	
 	#certiNumBtn {height: 30px; margin-left: 110px;} 
	#sendEmailBtn {height: 30px; left: 10px; }
	
</style>
<script type="text/javascript">
	var regEmail = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var certiNum = "";
	var id = "";
	
	$(function(){
		$("#sendEmailBtn").click(function(){
			var name = $("#name").val();
			var email = $("#email").val();
			if(!name){
				$("#errorMsgName").text("이름을 입력하세요");
				$("#name").focus();
			}else if(!email){
				$("#errorMsgEmail").text("이메일 주소를 입력하세요");
				$("#email").focus();
			}else if(!regEmail.test(email)){
				$("#errorMsgEmail").text("올바른 이메일 형식이 아닙니다");
				$("#email").focus();
			}else{
				sendEmail(name, email);
			}
		})
		
		function sendEmail(name, email){
			$.ajax({
				url : "findIdsendEmail.do",
				type : "POST",
				dataType: "json",
				data : {
					name : name,
					email : email
				},
				success : function(result){
					/*이름과 이메일을 통한 아이디 확인이 성공하면 존재 여부를 판단후,
					존재 하지 않으면 0이 반환되고 메시지를 띄운다
					존재 한다면 아이디와 인증번호를 받게되고 인증번호를 알맞게 입력하면 아이디를 띄워준다.*/
					if(!result){
						alert("입력하신 정보와 일치하는 회원이 없습니다.");
					}else{
						certiNum = result.certiNum;
						id = result.id;
						console.log(certiNum + " " + id);
						$("#errorMsgCertiNum").text("이메일로 받은 인증번호 6자리를 입력하세요.");
						$("#certiNum").css("visibility","visible").focus();
						$("#certiNumBtn").css("visibility","visible");
					}
				} 
			})
		}
		
		/*인증번호 확인 버튼 클릭*/
		$("#findIdOkForm").submit(function(){
			var inputCertiNum = $("#certiNum").val();
			console.log("inputCertiNum : " + inputCertiNum);
			console.log("certiNum : " + certiNum);
			if(inputCertiNum==certiNum){
				location.href="findIdOK.jsp"
				return true;
			}else{
				$("#errorMsgCertiNum").text("인증번호가 틀립니다");
				$("#certiNum").focus();
				return false;
			}
		})
		
		$("#name").keyup(function(){
			$("#errorMsgName").text("");
		})
		
		$("#email").keyup(function(){
			$("#errorMsgEmail").text("");
		})
	})
</script>
</head>
<body>
<div class="idFindFormWrapper">
	<p>회원 가입시 입력하신 이름과 이메일 주소를 입력하시면,<br/>
	해당 이메일로 인증번호를 보내드립니다.</p>
	<table>
		<tr>
			<td>이름:</td>
			<td><input type="text" id="name" name="name"/></td>
		</tr>
		<tr class="msgWrapper">
			<td colspan="3"><p class="errorMsg" id="errorMsgName"></p></td>
		</tr>
		<tr>
			<td>이메일:</td>
			<td><input type="text" id="email" name="email" placeholder="abc@abc.abc"/></td>
			<td><button id="sendEmailBtn">인증번호 받기</button></td>
		</tr>
		<tr class="msgWrapper">
			<td colspan="3"><p class="errorMsg" id="errorMsgEmail"></p></td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td></td> -->
<!-- 			<td><input type="text" class="certiNum" name="certiNum" id="certiNum" placeholder="인증번호 6자리를 입력하세요" /></td> -->
<!-- 			<td><button id="certiNumBtn">확인</button></td> -->
<!-- 		</tr> -->
<!-- 		<tr class="msgWrapper"> -->
<!-- 			<td colspan="3"><p class="errorMsg" id="errorMsgCertiNum"></p></td> -->
<!-- 		</tr> -->
	</table>
	<div id="findIdOkFormWrapper">
		<input type="text" class="certiNum" name="certiNum" id="certiNum" placeholder="인증번호 6자리를 입력하세요" />
		<form action="findIdOk.do" id="findIdOkForm">
			<input type="hidden" name="paramId" id="paramId"/>
			<input type="submit" id="certiNumBtn" value="확인" />
		</form>
		<p class="errorMsg" id="errorMsgCertiNum"></p>
	</div>
</div>
</body>
</html>


<!-- 			<td> -->
<!-- 				<form action="findIdOK.do" id="findIdForm"> -->
<!-- 					<input type="text" class="certiNum" name="certiNum" id="certiNum" placeholder="인증번호 6자리를 입력하세요" readonly/> -->
<!-- 					<input type="hidden" value="" /> -->
<!-- 					<input type="submit" id="certiNumBtn" value="확인"/> -->
<!-- 				</form>		 -->
<!-- 			</td> -->