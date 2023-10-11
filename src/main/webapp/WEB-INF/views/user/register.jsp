`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Team3Web</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- JQuery는 추후에 추가할 예정 -->
<!-- link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//다음 주소 검색 api
function searchAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
        	var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
            
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            
            document.getElementById('zipcode').value = data.zonecode; //우편번호
            document.getElementById("roadAddr1").value = roadAddr; //도로명 주소
            //document.getElementById("NOaddress").value = data.jibunAddress; //일반 주소
            
         	// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }
            var guideTextBox = document.getElementById("guide");
            
        }
   	}).open();
}

function showRegisterEvent() {
 	var Name = document.getElementById("name").value;
 	var NickName = document.getElementById("nickname").value;
    alert(Name + "님 회원가입을 축하합니다!\n닉네임 : "+ NickName);
}

</script>
<style>
/* 주소 검색 버튼 스타일 */
.searchAddress {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 6px 12px;
    border-radius: 3px;
    cursor: pointer;
}

/* 컨테이너 스타일 */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.form-container {
    max-width: 400px;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    background-color: white;
}

.form-group {
    margin-bottom: 20px;
}

#addressGroup {
    display: flex;
    align-items: center;
}

#address {
    flex: 1;
    margin-right: 10px;
}

#detailAddress {
    flex: 1;
}

.login-sub {
    display: flex;
    justify-content: space-between;
    margin-top: 15px;
}

/* 회원가입 하단 서브폼 */

.register-sub {
    display: flex;
    justify-content: space-between;
    margin-top: 15px;
}

.register-sub-item {
    list-style: none;
}

.register-link {
    color: #777777; /* 회색으로 변경 */
    text-decoration: none;
    font-size: 14px;
}

.register-sub-divider {
	color: #777777;
    margin: 0 10px;
    font-weight: bold;
}

</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<br><br><br><br>
    <div class="container">
        <div class="form-container">
            <h1 class="text-center">회원가입</h1>
            <form method="post" action="<%= request.getContextPath() %>/register">
                <div class="form-group">
                    <label for="id">아이디:</label>
                    <input type="text" id="id" name="id" class="form-control" placeholder="ex)Team3Web@Team3Web.co.kr" required>
                </div>
                <div class="form-group">
                    <label for="password">비밀번호:</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="영문,숫자,특수문자 조합 8-16자" required>
                </div>
               	<div class="form-group">
               	<label for="name">이름:</label>
        			<input type="text" id="name" name="name" class="form-control" required><br>
				</div>
				<div class="form-group">
               	<label for="nickname">닉네임:</label>
        			<input type="text" id="nickname" name="nickname" class="form-control" required><br>
				</div>
				<div class="form-group">
               	<label for="phone">전화번호:</label>
        			<input type="text" id="phone" name="phone" class="form-control" placeholder="ex)01012345678" required><br>
				</div>
				 <div class="form-group">
                    <label for="birthdate">생년월일:</label>
                    <div id="birthGroup">
                        <input type="text" id="birthday" name="birthday" class="form-control" placeholder="ex)20001231" required>
                    </div>
                </div>
				<div class="form-group">
					<label>성별:</label> <input type="radio" id="male" name="gender" class="form-check-input" value="남자" required>
					<label for="male" class="form-check-label">남자</label> 
					<input type="radio" id="female" name="gender" class="form-check-input" value="여자" required> 
					<label for="female" class="form-check-label">여자</label><br>
				</div>
				<div class="form-group">
                    <label for="addressGroup">주소:</label>
                    <div id="addressGroup">
                        <input type="text" id="roadAddr1" name="roadAddr1" class="form-control" placeholder="주소" onclick="searchAddress()" required readonly>
                        <button class="button" class="searchAddress" onclick="searchAddress()">주소 검색</button>
                    </div>
                    <input type="text" id="zipcode" name="zipcode" class="form-control" placeholder="우편번호" onclick="searchAddress()" required readonly>
                    <input type="text" id="roadAddr2" name="roadAddr2" class="form-control" placeholder="상세주소 입력" required>
                </div>
                <button type="submit" class="btn btn-primary" onclick="showRegisterEvent()">회원가입</button>
                <ul class="register-sub">
                    <li class="register-sub-item">
                        <a class="register-link" href="login">로그인</a>
                    </li>
                    <li class="register-sub-item">
                        <span class="register-sub-divider">|</span>
                    </li>
                    <li class="register-sub-item">
                        <a class="register-link" href="#">아이디 찾기</a>
                    </li>
                    <li class="register-sub-item">
                        <span class="register-sub-divider">|</span>
                    </li>
                    <li class="register-sub-item">
                        <a class="register-link" href="#">비밀번호 찾기</a>
                    </li>
                </ul>
            </form>
        </div>
    </div>
    <br><br><br>
	<jsp:include page="../footer.jsp" />
</body>
</html>