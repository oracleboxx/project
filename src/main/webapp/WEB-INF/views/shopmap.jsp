<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Team3Web</title>
		<!-- Bootstrap CSS -->
		<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
		<style>
    #staticMap {
            width: 600px;
            height: 350px;
            margin: 20px auto;
        }

        .section-divider2 {
            border-top: 1px dashed #444;
            margin-top: 20px;
        }

        .section-divider2::before,
        .section-divider2::after {
            content: "";
            flex-grow: 1;
            border-top: 1px dashed #444;
        }

        .section-text {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 20px;
        }

        .section-title {
            text-align: center;
            margin-top: 20px;
        }
</style>

	</head>
	<body>
	<jsp:include page="header.jsp" />
	<div class="section-divider"></div>
    <div class="section-title">
		<h1>본사 오시는길</h1>
    </div>
	<div id="staticMap"></div>
	<div class="section-text">
        	우 : 03138 서울특별시 종로구 돈화문로 26 단성골드빌딩 4층 TEL 1544-112
		<br>
    </div>
    
    <!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>
    <!-- Static Map Container -->
    
	<div id="staticMap"></div>
	
	<jsp:include page="footer.jsp" />
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8e0312389b0efbe8c4d5c3aede7ada4"></script>
    <script>

	var marker = {
		position : new kakao.maps.LatLng(37.57098173758384, 126.99251485760027),
		text : 'Team3Web본사'
	};

	var staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div
	staticMapOption = {
		center : new kakao.maps.LatLng(37.57098173758384, 126.99251485760027), // 이미지 지도의 중심좌표
		level : 3, // 이미지 지도의 확대 레벨
		marker : marker
	// 이미지 지도에 표시할 마커
	};

	// 이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer,
			staticMapOption);
	</script>
	</body>
</html>
