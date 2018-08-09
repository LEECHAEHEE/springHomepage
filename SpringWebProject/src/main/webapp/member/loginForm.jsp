<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
<link rel="stylesheet" href="../resources/css/member/default.css" />
<link rel="stylesheet" href="../resources/css/member/loginForm.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var log = false;
		
		$("#idCheck").click(function(){
			if($.trim($("#id").val())==""){
				/*���̵� �Է� ���� ����*/
				$("#idMsg").text("���̵� �Է��ϼ���");
			}else{
				/*�н����� �Է� ���� ����*/
				if($.trim($("#pw").val())==""){
					$("#pwMsg").text("�н����带 �Է��ϼ���");
				}else{
					/*�α��� ���� with Ajax*/
					$.ajax({
						url : "loginOK.do",
						type : "POST",
						data : { 	
								id : $("#id").val(),
								pw : $("#pw").val()
							   },
						success : function(result){
							/*�α��� ����*/
							if(result==1){
								$("#idCheckResult").text("");
								location.href="home.do";
							}else{
								$("#idCheckResult").text("���̵� Ȥ�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
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
				<input type="text" name="id" id="id" placeholder="���̵�"/><br>
				<p class="errorMsg" id="idMsg"></p>
				<input type="password" name="pw" id="pw" placeholder="��й�ȣ"/><br>
				<p class="errorMsg" id="pwMsg"></p>
				<input type="button" value="�α���" id="idCheck" />
				<p class="errorMsg" id="idCheckResult"></p>
			</div>
			<div id="findForm">
				<table>
					<tr>
						<td><a class="memberHref" href="findIdForm.do">���̵� ã��</a></td>
						<td><a class="memberHref" href="findPwForm.do">��й�ȣ ã��</a></td>
						<td><a class="memberHref" href="joinForm.do">ȸ������</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>