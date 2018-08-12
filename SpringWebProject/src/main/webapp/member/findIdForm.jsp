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
	.msgWrapper p {line-height: 1.5em; text-align: left; padding-left: 70px; visibility:hidden;}
	
	#certiNum { position: relative; display:inline-block; left:96px;}
	#findIdOkForm {position: relative; display: inline-block;}
	
	#findIdOkFormWrapper { visibility: hidden; }
	
 	#certiNumBtn {height: 30px; margin-left: 110px;} 
	#sendEmailBtn {height: 30px; left: 10px; }
	
</style>
<script type="text/javascript">
	var regEmail = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var certiNumFromCtlr = "";
	var nameFromCtlr = "";
	var idFromCtlr = "";
	
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
					존재 하지 않으면 null(undifined)이 반환되고 메시지를 띄운다
					존재 한다면 아이디와 인증번호를 받게되고 인증번호를 알맞게 입력하면 아이디를 띄워준다.*/
					
					/*result 는 JSON 형태이다. 해당 아이디가 없으면 빈 Map 객체가 반환되므로 빈 JSON 객체("{}")이다
						이를 확인 하는 jquery 함수가 isEmptyObject() 이다.
					*/
					if($.isEmptyObject(result)){
						alert("입력하신 정보와 일치하는 회원이 없습니다.");
					}else{
						/*입력한 인증번호가 맞다면 전역변수로 선언된 name과 id에 받아온 값을 넣는다.*/
						certiNumFromCtlr = result.certiNum;
						nameFromCtlr = result.name;
						idFromCtlr = result.id;
						console.log(certiNumFromCtlr);
						$("#errorMsgCertiNum").text("이메일로 받은 인증번호 6자리를 입력하세요.");
						$("#findIdOkFormWrapper").css("visibility","visible");
						$("#certiNum").focus();
					}
				},
				error : function(){
					console.log("error");
				}
			})
		}
		
		/*인증번호 확인 버튼 클릭
		preventDefault 는 a 태그 처럼 클릭 이벤트 외에 별도의 브라우저 행동을 막기 위해 사용된다.
		submit에서 페이지 이동을 막아버림. 혹은 #(앵커)만 썼을때 페이지가 상단으로 이동하는것을 막는다.
		*/
		$("#findIdOkForm").submit(function(e){
			var inputCertiNum = $("#certiNum").val();	//입력한 번호
			if(inputCertiNum==certiNumFromCtlr){
				$("#paramName").val(nameFromCtlr);		//동적으로 input의 value 지정.
				$("#paramId").val(idFromCtlr);
				return true;
			}else{
				$("#errorMsgCertiNum").text("인증번호가 틀립니다");
				$("#findIdOkFormWrapper certiNum").focus();
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
	</table>
	<div id="findIdOkFormWrapper" >
		<input type="text" class="certiNum" name="certiNum" id="certiNum" maxlength="6" placeholder="인증번호 6자리를 입력하세요" />
		<form id="findIdOkForm" action="findIdOK.do" method="post">
			<input type="hidden" name="paramName" id="paramName"/>
			<input type="hidden" name="paramId" id="paramId"/>
			<input type="submit" id="certiNumBtn" value="확인" />
		</form>
		<p class="errorMsg" id="errorMsgCertiNum"></p>
	</div>
</div>
</body>
</html>
