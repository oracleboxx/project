<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team3Web</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script>
function checkNickname(){
	var nicknameCheck = $("#nicknameCheck").val();
	var nickname = $("#nickname").val();
	var regExp =  /^[가-힣|a-z|A-Z|0-9|]+$/;

	if(nicknameCheck == null || nicknameCheck == ""){
		alert("닉네임을 입력 해주세요");
		return false;
	}
	if(!regExp.test(nicknameCheck)){
		alert("닉네임은 한글, 영어, 숫자만 4 ~10자리로 입력 가능합니다.");
		return false;
	}
	$.ajax({
		type : 'POST',
		url : '/user/registerInput',
		data : {nickname:nicknameCheck },
		dataType : 'json',
		success : function(data){
			console.log(data)
			if(data.JavaData == 'YES'){
				alert("사용가능한 닉네임 입니다.");
				$("#nickname").val(nicknameCheck);
			}else{
				alert("이미 존재하는 닉네임 입니다.");
				$("#nicknameCheck").val("");
			}
		},
		error: function(xhr, status, error){
			alert(error);
		}
	});
}


function register(){
	var registerData =common.serializeObject($("form[name=userRegisterForm]"));
	if(registerData.nickname == null || registerData.nickname == ""){
		alert("닉네임 중복 체크를 해주세요");
		return false;
	}
	var phoneNum = registerData.phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3")
	registerData.phone = phoneNum
	
	$.ajax({
		type : 'POST',
		url : '/user/checkRegister',
		data : registerData,
		dataType : 'json',
		success : function(data){
			if(data.JavaData == "YES"){
				alert("가입되었습니다.");
				location.href = '/user/login'
			}else{
				alert("가입에 실패했습니다.");
			}
		},
		error: function(xhr, status, error){
			alert("가입에 실패했습니다."+error);
		}
	});
}
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
<form name="userRegisterForm" id="userRegisterForm" method="POST">
	<input type="hidden"  id="email" name="email" value="${email}"/>
	<input type="hidden"  id="password" name="password"  value="${password}">
	<input type="hidden"  id="id" name="id"  value="${password}">
	<input type="hidden"  id="phone" name="phone"  value="${address}">
	<table>
		<thead>
			<tr>
				<th colspan="3">신규 가입 추가 정보 설정</th>
			</tr>
		</thead>
		<tbody>
			
			<tr>
				<td class="text">닉네임</td>
				<td>
					<input id="nicknameCheck" name="nicknameCheck">
					<input type="hidden" id="nickname" name="nickname">
				</td>
				<td><button id="dupliButton" type="button" onclick="checkNickname()">중복체크</button></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" id="regiButton" onclick="register()" value="회원가입" /></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form>
<jsp:include page="../footer.jsp" />
<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</body>
</html>