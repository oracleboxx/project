<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/cart.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script type="text/javascript">
	//이벤트 리스너 등록

	document
			.addEventListener(
					'DOMContentLoaded',
					function() {

						// "선택 상품 삭제" 버튼 클릭

						document.querySelector('.basketrowcmd a:first-child')
								.addEventListener('click', function() {

									basket.delCheckedItem();

								});

						// "장바구니 비우기" 버튼 클릭

						document.querySelector('.basketrowcmd a:nth-child(2)')
								.addEventListener('click', function() {

									basket.delAllItem();

								});

						// 장바구니 행 "삭제" 버튼 클릭

							document.querySelectorAll('.basketcmd a').forEach(
	
							function(item) {
	
								item.addEventListener('click', function() {
	
									basket.delItem();
	
								});
	
							}
	
							);
						let basket = {

							totalCount : 0, //전체 갯수 변수

							totalPrice : 0, //전체 합계액 변수

							//체크한 장바구니 상품 비우기

							delCheckedItem : function() {

								document
										.querySelectorAll(
												"input[name=buy]:checked")
										.forEach(
												function(item) {

													item.parentElement.parentElement.parentElement
															.remove();

												});

								//AJAX 서버 업데이트 전송

								//전송 처리 결과가 성공이면

								this.reCalc();

								this.updateUI();

							},

							//장바구니 전체 비우기

							delAllItem : function() {

								document.querySelectorAll('.row.data').forEach(
										function(item) {

											item.remove();

										});

								//AJAX 서버 업데이트 전송

								//전송 처리 결과가 성공이면

								this.totalCount = 0;

								this.totalPrice = 0;

								this.reCalc();

								this.updateUI();

							},

							//재계산

							reCalc : function() {

								this.totalCount = 0;

								this.totalPrice = 0;

								document
										.querySelectorAll(".p_num")
										.forEach(
												function(item) {

													var count = parseInt(item
															.getAttribute('value'));
													9999

													this.totalCount += count;

													var price = item.parentElement.parentElement.previousElementSibling.firstElementChild
															.getAttribute('value');

													this.totalPrice += count
															* price;

												}, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg

							},

							//화면 업데이트

							updateUI : function() {

								document.querySelector('#sum_p_num').textContent = '상품갯수: '
										+ this.totalCount.formatNumber() + '개';

								document.querySelector('#sum_p_price').textContent = '합계금액: '
										+ this.totalPrice.formatNumber() + '원';

							},

							//개별 수량 변경

							changePNum : function(pos, event) {

								var item = document
										.querySelector('input[name=p_num' + pos
												+ ']');

								var p_num = parseInt(item.getAttribute('value'));

								var newval = event.target.classList
										.contains('up') ? p_num + 1
										: event.target.classList
												.contains('down') ?

										p_num - 1 : event.target.value;

								if (parseInt(newval) < 1
										|| parseInt(newval) > 99) {
									return false;
								}

								item.setAttribute('value', newval);

								item.value = newval;

								var price = item.parentElement.parentElement.previousElementSibling.firstElementChild
										.getAttribute('value');

								item.parentElement.parentElement.nextElementSibling.textContent = (newval * price)
										.formatNumber()
										+ "원";

								//AJAX 업데이트 전송

								//전송 처리 결과가 성공이면    

								this.reCalc();

								this.updateUI();

							},

							//상품 삭제

							delItem : function() {

								event.target.parentElement.parentElement.parentElement
										.remove();

							}

						}

						// 수량변경 - 이벤트 델리게이션으로 이벤트 종류 구분해 처리

						document
								.querySelectorAll('.updown')
								.forEach(

										function(item, idx) {

											//수량 입력 필드 값 변경

											item
													.querySelector('input')
													.addEventListener(
															'keyup',
															function(event) {

																basket
																		.changePNum(idx + 1, event);

															});

											//수량 증가 화살표 클릭

											item.children[1]
													.addEventListener(
															'click',
															function(event) {

																basket
																		.changePNum(idx + 1,event);

															});

											//수량 감소 화살표 클릭

											item.children[2]
													.addEventListener(
															'click',
															function(event) {

																basket
																		.changePNum(idx + 1);

															});

										}

								);

						//앵커 # 대체해 스크롤 탑 차단

						document.querySelectorAll('a[href="#"]').forEach(
								function(item) {

									item.setAttribute('href',
											'javascript:void(0)');

								});

					});
	// 숫자 3자리 콤마찍기

	Number.prototype.formatNumber = function() {
	    let value = Number(this);

	    if (isNaN(value))
	        return 0;

	    let nstr = value.toLocaleString();
		return nstr;
	};
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	
	<form name="orderform" id="orderform" method="post" class="orderform"
		action="/Order">

		<div class="basket" id="basket">

			<!-- "장바구니 헤더" -->

			<div class="row head">

				<div class="check">선택</div>

				<div class="img">이미지</div>

				<div class="pname">상품명</div>

				<div class="basketprice">가격</div>

				<div class="num">수량</div>

				<div class="sum">합계</div>

				<div class="basketcmd">삭제</div>

			</div>

			<!-- "장바구니 상품 목록" -->

			<div class="row data">

				<div class="check">
					<input type="checkbox" name="buy" value="260" checked="">&nbsp;
				</div>

				<div class="img">
					<img
						src="<%=request.getContextPath()%>/resources/img/product/sample_product_1.jpg"
						width="60" height="60">
				</div>

				<div class="pname">

					<span>새틴 립스틱(XJ-92214/1)</span>

				</div>

				<div class="basketprice">
					<input type="hidden" name="p_price" id="p_price1" class="p_price"
						value="32200">32,200원
				</div>

				<div class="num">
					<!-- "장바구니 수량 변경" -->
					<div class="updown">
						<input type="text" name="p_num1" id="p_num1" size="2"
							maxlength="4" class="p_num" value="1"> <span><i
							class="bi bi-arrow-up-circle up"></i></span> <span><i
							class="bi bi-arrow-down-circle down"></i></span>
					</div>
				</div>


				<!-- "장바구니 상품 합계" -->

				<div class="sum">32,200원</div>

				<div class="basketcmd">
					<a href="#" class="abutton">삭제</a>
				</div>

			</div>

		</div>
		<!-- "장바구니 상품 목록" -->
		<div class="row data">
			<div class="check">
				<input type="checkbox" name="buy" value="270" checked="">&nbsp;
			</div>
			<div class="img">
				<img
					src="<%=request.getContextPath()%>/resources/img/product/sample_product_4.jpg"
					width="100" height="60">
			</div>
			<div class="pname">
				<span>운동화(ABC-12345)</span>
			</div>
			<div class="basketprice">
				<input type="hidden" name="p_price" id="p_price2" class="p_price"
					value="50000">50,000원
			</div>
			<div class="num">
				<!-- "장바구니 수량 변경" -->
				<div class="updown">
					<input type="text" name="p_num2" id="p_num2" size="2" maxlength="4"
						class="p_num" value="1"> <span><i
						class="bi bi-arrow-up-circle up"></i></span> <span><i
						class="bi bi-arrow-down-circle down"></i></span>
				</div>
			</div>
			<!-- "장바구니 상품 합계" -->
			<div class="sum">50,000원</div>
			<div class="basketcmd">
				<a href="#" class="abutton">삭제</a>
			</div>
		</div>

		<div class="row data">
			<div class="check">
				<input type="checkbox" name="buy" value="290" checked="">&nbsp;
			</div>
			<div class="img">
				<img
					src="<%=request.getContextPath()%>/resources/img/product/sample_product_3.jpg"
					width="100" height="60">
			</div>
			<div class="pname">
				<span>우편물 스티커(DEF-54321)</span>
			</div>
			<div class="basketprice">
				<input type="hidden" name="p_price" id="p_price4" class="p_price"
					value="1500">1,500원
			</div>
			<div class="num">
				<!-- "장바구니 수량 변경" -->
				<div class="updown">
					<input type="text" name="p_num4" id="p_num4" size="2" maxlength="4"
						class="p_num" value="1"> <span><i
						class="bi bi-arrow-up-circle up"></i></span> <span><i
						class="bi bi-arrow-down-circle down"></i></span>
				</div>
			</div>
			<!-- "장바구니 상품 합계" -->
			<div class="sum">1,500원</div>
			<div class="basketcmd">
				<a href="#" class="abutton">삭제</a>
			</div>
		</div>


		<!-- "장바구니 기능 버튼" -->

		<div class="right-align basketrowcmd">

			<a href="#" class="abutton_del">선택상품삭제</a> <a href="#"
				class="abutton_del2">장바구니비우기</a>

		</div>

		<!-- "장바구니 전체 합계 정보" -->

		<div class="bigtext right-align sumcount" id="sum_p_num">상품갯수:
			3개</div>

		<div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액:
			32,200원</div>



		<div id="goorder" class="">

			<div class="clear"></div>

			<div class="buttongroup center-align cmd">

				<a href="#">선택한 상품 주문</a>

			</div>

		</div>

	</form>
</body>
</html>