<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
    .footer {
        background-color: #f9f9f9;
        color: #333;
        padding: 40px 20px;
        font-size: 14px;
        line-height: 1.5;
    }
    .footer a {
        color: #333;
        text-decoration: none;
        transition: color 0.3s;
    }
    .footer a:hover {
        color: #555;
    }
    .footer .inner {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    .service_area, .footer_menu, .corporation_area, .notice_area {
        margin-bottom: 20px;
    }
    .service_title {
        font-size: 18px;
        margin-bottom: 10px;
    }
    .service_tel {
        color: #FFD700;
        margin-left: 10px;
    }
    .menu_box {
        margin-right: 30px;
    }
    .menu_title {
        font-size: 16px;
        margin-bottom: 15px;
    }
    .menu_list {
        list-style-type: none;
        padding: 0;
    }
    .menu_item {
        margin-bottom: 10px;
    }
    .term_list {
        display: flex;
        list-style-type: none;
        padding: 0;
        margin: 0;
        gap: 20px;
    }
    .footer_sns .sns_box {
        display: flex;
        gap: 15px;
    }
    .footer_menu {
    	display: flex;
    	justify-content: space-between;
	}
    .btn_business, .btn.solid.small {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        background-color: #FFD700;
        color: #333;
        padding: 5px 15px;
        border-radius: 5px;
        cursor: pointer;
        border: none;
        transition: background-color 0.3s, color 0.3s;
    }
    .btn_business:hover, .btn.solid.small:hover {
        background-color: #f5f5f5;
        color: #333;
    }
    .notice {
        font-size: 12px;
        opacity: 0.8;
    }
    .copyright {
        font-size: 12px;
        margin-top: 20px;
    }
</style>

</head>
<body>
<div class="footer sm">
    <div class="inner">
        <div class="service_area">
            <div class="customer_service">
                <strong class="service_title">고객센터<a href="tel:1588-0000" class="sevice_tel">1588-0000</a></strong>
                <div class="service_time">
                    <dl class="time_box">
                        <dt class="time_term">운영시간 평일 11:00 - 18:00 (토∙일, 공휴일 휴무) 점심시간 평일 13:00 - 14:00</dt>
                    </dl>
                </div>
            </div>
            <div class="footer_menu">
                <div class="menu_box">
                    <strong class="menu_title">이용안내</strong>
                    <ul class="menu_list">
                        <li class="menu_item"><a href="#" class="menu_link">검수기준</a></li>
                        <li class="menu_item"><a href="#" class="menu_link">이용정책</a></li>
                        <li class="menu_item"><a href="#" class="menu_link">페널티 정책</a></li>
                        <li class="menu_item"><a href="#" class="menu_link">커뮤니티 가이드라인</a></li>
                    </ul>
                </div>
                <div class="menu_box">
                    <strong class="menu_title">고객지원</strong>
                    <ul class="menu_list">
                        <li class="menu_item"><a href="#" class="menu_link">공지사항</a></li>
                        <li class="menu_item"><a href="#" target="_blank" class="menu_link">서비스 소개</a></li>
                        <li class="menu_item"><a href="/shop/shopmap" target="_self" class="menu_link">스토어 안내</a></li>
                        <li class="menu_item"><a href="#" target="_blank" class="menu_link">판매자 방문접수</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="corporation_area">
            <ul class="term_list">
                <li class="term_item"><a href="#" target="_blank" rel="noopener noreferrer" class="term_link">회사소개</a></li>
                <li class="term_item"><a href="#" target="_blank" rel="noopener noreferrer" class="term_link">인재채용</a></li>
                <li class="term_item" style="display:none;"><a href="#" target="_blank" rel="noopener noreferrer" class="term_link">제휴제안</a></li>
                <li class="term_item"><a href="#" class="term_link">이용약관</a></li>
                <li class="term_item privacy"><a href="#" class="term_link">개인정보처리방침</a></li>
            </ul>
            <br>
            <div class="footer_sns">
                <div class="sns_box">
                    <a href="#" aria-label="인스타그램" class="sns" style="font-size: 21px;"><i class="bi bi-instagram"></i></a>
                    <a href="#" aria-label="페이스북" class="sns" style="font-size: 21px;"><i class="bi bi-facebook"></i></a>
                    <a href="#" aria-label="깃허브" class="sns" style="font-size: 21px;"><i class="bi bi-github"></i></a>
                </div>
            </div>
            <br>
            <div class="business_info">
                <div class="info_list">
                    <dl class="info_item">
                        <dt class="business_title">NUBE 주식회사 · 대표 김김김<br>사업자등록번호 : 000-00-00000 <a href="#">사업자정보확인</a><br>통신판매업 : 제 0000-서울종로A-0000호<br>사업장소재지 : 서울시 종로구 돈화문로 26 단성 골드 빌딩 4층<br>호스팅 서비스 : 네이버 클라우드 ㈜</dt>
                    </dl>
                </div>
            </div>
        </div>
        <div class="notice_area">
            <p class="notice">NUBE(주)는 통신판매 중개자로서 통신판매의 당사자가 아닙니다. 본 상품은 개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 단, 이용약관 및 정책, 기타 거래 체결 과정에서 고지하는 내용 등에 따라 검수하고 보증하는 내용에 대한 책임은 NUBE(주)에 있습니다.</p>
            <p class="copyright">© NUBE Corp.</p>
        </div>
    </div>
</div>

</body>
</html>
