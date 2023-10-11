<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="carouselExampleAutoplaying" class="carousel slide"
		data-bs-ride="carousel">
		<!-- Carousel Indicators -->
		<ol class="carousel-indicators">
			<li data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="0"
				class="active"></li>
			<li data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="1"></li>
			<li data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<%=request.getContextPath()%>/resources/img/slider/sample_image_1.jpg"
					class="d-block w-100" alt="slider_image_1">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath()%>/resources/img/slider/sample_image_2.jpg"
					class="d-block w-100" alt="slider_image_2">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath()%>/resources/img/slider/sample_image_3.jpg"
					class="d-block w-100" alt="slider_image_3">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- Product Cards -->
	<div class="container mt-4">
		<div class="text-start ms-1 me-1">
			<h5 class="text-dark ms-1" style="font-weight: bold;">Just
				Dropped</h5>
			<h6 class="text-muted ms-1">신상품</h6>
			<hr>
		</div>

		<div class="row">
			<!-- Repeat the below card structure for each product -->
			<c:forEach var="i" begin="1" end="4">
				<div class="col-xl-3 col-lg-4 col-md-6 col-6 mb-2">
					<!-- Changed mb-4 to mb-2 -->
					<div class="card">
						<img src="<%=request.getContextPath()%>/resources/img/product/sample_product_${i}.jpg"
							class="card-img-top" alt="Product Image ${i}">
						<div class="card-body">
							<p class="card-title mb-0" style="font-weight: bold;">Product
								Name ${i}</p>
							<p class="card-text mb-1">Product Description ${i}</p>
							<p class="card-text mt-3" style="font-weight: bold;">10000원</p>
							<!-- Link to product details page -->
							<a href="<%=request.getContextPath()%>/product/details/${i}" class="stretched-link"></a>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- End of the repeating card structure -->
		</div>
	</div>
	
	<div class="text-center mt-0">
		<!-- Adjusted the margin-top to 2rem -->
		<a href="<%=request.getContextPath()%>/products/details" class="btn btn-outline-secondary mb-3">더보기</a>
	</div>
	
	<jsp:include page="footer.jsp" />

	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</body>
</html>
