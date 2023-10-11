<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team3web</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
body {
    margin: 0;
    padding: 0;
    background-color: #f8f9fa;
  }
  /* 컨테이너 스타일 */
  .container {
    display: flex;
    flex-direction: column;
    align-items: center;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
    max-width: 400px;
    margin: 100px auto 0;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    background-color: white;
  }

  /* 카드 스타일 */
  .card {
    border: none;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
  }

  /* 카드 내부 컨텐츠 스타일 */
  .card-body {
    text-align: center;
    padding: 2rem;
  }

  /* 가입 방법 선택 버튼 스타일 */
  .btn-primary {
    background-color: #007bff;
    border: none;
  }

  .btn-primary:hover {
    background-color: #0056b3;
  }

  /* 가입 방법 로그인 버튼 스타일 */
	.btn-icon {
    height: 52px;
    width: 100%;
    margin-top: 10px;
  }
  
  .btn-register {
    background-color: #007bff;
    border: none;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    margin-top: 10px;
    padding: 10px 0;
    color: white;
}

  .btn-login:hover {
    background-color: #16712c;
  }

  /* 버튼 아이콘 스타일 */
  .btn-icon img {
    height: 40px;
    width: auto;
    margin-right: 5px;
    vertical-align: middle;
  }
</style>
<script>
  function openNaver() {
    var popup = window.open('${naverUrl}', '네이버 로그인', 'width=600,height=400');
    window.addEventListener('message', function(event) {
      if (event.data === 'loginSuccess') {
        popup.close();
      }
    });
  }

  function openKakao() {
    var popup = window.open('${kakaoUrl}', '카카오톡 로그인', 'width=600,height=400');
    window.addEventListener('message', function(event) {
      if (event.data === 'loginSuccess') {
        popup.close();
      }
    });
  }
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="container">
  <div class="row">
    <div class="col-md-12 mt-5">
      <div class="card">
        <div class="card-body">
          <h3 class="card-title">회원가입 선택</h3>
          <p class="card-text">원하는 가입 방법을 선택하세요.</p>
          <div class="d-grid gap-2">
            <a href="register" class="btn btn-primary">이메일로 가입하기</a>
            <button class="btn btn-register" onclick="openNaver()">
              <img src="<%=request.getContextPath()%>/resources/img/icon/naverLogin_white.png" class="btn-icon" alt="네이버로 가입하기">
            </button>
            <button class="btn btn-register" onclick="openKakao()">
              <img src="<%=request.getContextPath()%>/resources/img/icon/kakao_login_medium_wide.png" class="btn-icon" alt="카카오로 가입하기">
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<br><br><br>
<jsp:include page="../footer.jsp" />

</body>
</html>
