<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
@keyframes slide-down {
    0% {
        height: 0px;
        transform: translateY(-50%);
        opacity: 0;
    }
    100% {
        height: 40px;
        transform: translateY(0);
        opacity: 1;
    }
}

@keyframes slide-up {
    0% {
        height: 40px;
        transform: translateY(0);
        opacity: 1;
    }
    100% {
        height: 0px;
        transform: translateY(-50%);
        opacity: 0;
    }
}

.slide-down-animation {
    animation: slide-down 0.3s ease-out forwards;
}

.slide-up-animation {
    animation: slide-up 0.3s ease-out forwards;
}

/* Offcanvas Styles */
.offcanvas-body {
    padding: 20px 30px;
}

.offcanvas-body .row {
    margin: 0 -15px;
}

.offcanvas-body .col {
    padding: 0 15px;
    margin-bottom: 30px;
}

.offcanvas-body a {
    display: block;
    margin-bottom: 10px;
    color: #333;
    text-decoration: none;
    transition: color 0.3s;
}

.offcanvas-body a:hover {
    color: #777;
}

/* 주 카테고리 스타일 */
.offcanvas-body a.main-category {
    font-weight: bold;
    font-size: 18px;
    margin-bottom: 20px;
}

/* 세부 카테고리 스타일 */
.offcanvas-body a.sub-category {
    margin-left: 20px;
}

</style>
</head>
<body>
	<div>
		<nav class="navbar">
			<h1>
				<a class="navbar-brand mx-auto"
					href="<%=request.getContextPath()%>/">Team3Web</a>
			</h1>
			<ul class="navbar-nav ms-auto me-2 flex-row align-items-center">
				<li class="nav-item">
					<button class="icon-button" id="searchIcon">
						<i class="bi bi-search"></i>
					</button>
				</li>
				<li class="nav-item px-lg-2">
					<button class="icon-button" id="loginIcon"
						onclick="linkLogin('<%=request.getContextPath()%>/login')">
						<i class="bi bi-person-circle"></i>
					</button>
				</li>

				<li class="nav-item"><button class="icon-button" id="cartButton" onclick ="linkCart('<%=request.getContextPath()%>/user/cart')"> 
				<i class="bi bi-bag"></i>
				</button></li>

			

			</ul>
		</nav>
	</div>

	<div>
		<nav class="navbar-under">
			<ul class="nav nav-underline justify-content-center mb-1">
				<li class="nav-item"><a class="nav-link" href="#">남성</a></li>
				<li class="nav-item"><a class="nav-link" href="#">여성</a></li>
				<li class="nav-item"><a class="nav-link" href="#">악세사리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
				<li class="nav-item about-item"><a class="nav-link" href="<%=request.getContextPath()%>/about">About</a></li>
			</ul>
		</nav>
	</div>
	
	<button class="btn btn-primary d-none" type="button"
		data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop"
		aria-controls="offcanvasTop">Toggle top offcanvas</button>

	<div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop"
		aria-labelledby="offcanvasTopLabel">
		<div class="offcanvas-header">
			<h4 class="offcanvas-title" id="offcanvasTopLabel" style="font-weight: bold;">카테고리</h4>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<!-- 이곳에 내용이 동적으로 채워질 것입니다 -->
		</div>
	</div>

	<script>
	document.getElementById('searchIcon').addEventListener('click', function() {
	    let searchForm = document.getElementById('dynamicSearchForm');
	    if (searchForm) {
	        searchForm.className = 'slide-up-animation';  // apply slide-up animation
	        setTimeout(function() {
	            searchForm.remove();  // remove the form after animation completes
	        }, 300);  // 300ms is the duration of the animation
	        return;
	    }

	 	// 검색창 생성
	    searchForm = document.createElement('form');
	    searchForm.id = 'dynamicSearchForm';
	    searchForm.className = 'slide-down-animation';
	    searchForm.method = 'GET';
	    searchForm.action = '/search';
	    searchForm.style.marginBottom = "1px";
	    searchForm.style.zIndex = '11';

	    // input 요소 생성 및 속성 할당
	    var inputElement = document.createElement('input');
	    inputElement.className = 'form-control mb-2';
	    inputElement.setAttribute('list', 'datalistOptions');
	    inputElement.id = 'exampleDataList';
	    inputElement.placeholder = 'Type to search...';

	    // datalist 요소 생성 및 옵션 추가
	    var datalistElement = document.createElement('datalist');
	    datalistElement.id = 'datalistOptions';
	    var options = ['추후에', '동적으로', '관련 검색어', '나올', '예정'];
	    for (var i = 0; i < options.length; i++) {
	        var optionElement = document.createElement('option');
	        optionElement.value = options[i];
	        datalistElement.appendChild(optionElement);
	    }

	    // 요소들을 조립하여 검색창에 추가
	    searchForm.appendChild(inputElement);
	    searchForm.appendChild(datalistElement);

	    // 검색창을 nav-underline 바로 아래에 삽입
	    document.querySelector('.nav.nav-underline').after(searchForm);
	    document.getElementById('overlay').style.display = 'block';
	});
	
	
	
	
	
	//검색창 제출 시 처리
	//document.getElementById('dynamicSearchForm').addEventListener('submit', function(e) {
	  // 여기서는 이벤트 기본 동작을 막지 않습니다. 폼은 정상적으로 제출됩니다.
	  // 백엔드 로직이 구현되면, 서버에서 해당 검색어로 Oracle DB를 조회하고 결과를 반환해야 합니다.
	  // TODO: 백엔드 로직 구현 예정
	//});
	
	// 로그인 아이콘 클릭 시 로그인 페이지로 이동
		function linkLogin(url) {
			window.location.href = url;
			
		}

		
		function linkCart(url) {
		    // 지정된 URL로 페이지 이동
		    window.location.href = url;
		}
	
	</script>
</body>
</html>

<script>
	
document.addEventListener("DOMContentLoaded", function() {
    const categoryLinkMapping = {
             "남성": {
                 "path": "<%=request.getContextPath()%>/mens",
                 "셔츠": "<%=request.getContextPath()%>/mens/shirts",
                 "바지": "<%=request.getContextPath()%>/mens/pants"
             },
             "여성": {
                 "path": "<%=request.getContextPath()%>/womens",
                 "드레스": "<%=request.getContextPath()%>/womens/dresses",
                 "스커트": "<%=request.getContextPath()%>/womens/skirts"
             },
             "액세서리": {
                 "path": "<%=request.getContextPath()%>/accessories",
                 "시계": "<%=request.getContextPath()%>/accessories/watches",
                 "목걸이": "<%=request.getContextPath()%>/accessories/necklaces"
             },
             "고객센터": {
                 "path": "<%=request.getContextPath()%>/help",
                 "FAQ": "<%=request.getContextPath()%>/help/faq",
                 "문의하기": "<%=request.getContextPath()%>/help/contact"
             }
         };


         function closeSearchForm() {
             const searchForm = document.getElementById('dynamicSearchForm');
             if (searchForm) {
                 searchForm.remove();
             }
         }

         function closeOffcanvas() {
             const offcanvasInstance = new bootstrap.Offcanvas(document.getElementById("offcanvasTop"));
             offcanvasInstance.hide();
         }

         const navItems = document.querySelectorAll(".nav-underline .nav-item a");
         navItems.forEach(item => {
             // "about" 항목을 제외하고 이벤트 리스너를 추가합니다.
             if (item.textContent.trim().toLowerCase() !== "about") {
                 item.addEventListener("click", function(event) {
                     event.preventDefault();

                     const offcanvasBody = document.querySelector("#offcanvasTop .offcanvas-body");
                     offcanvasBody.innerHTML = '<div class="row"></div>';

                     const rowElement = offcanvasBody.querySelector(".row");

                     for (const [mainCategory, subCategoriesLinks] of Object.entries(categoryLinkMapping)) {
                         const columnElement = document.createElement("div");
                         columnElement.classList.add("col");

                         const mainCategoryElem = document.createElement("a");
                         mainCategoryElem.textContent = mainCategory;
                         mainCategoryElem.href = categoryLinkMapping[mainCategory].path;
                         mainCategoryElem.className = "main-category";  
                         columnElement.appendChild(mainCategoryElem);

                         Object.entries(subCategoriesLinks).forEach(([subCategory, link]) => {
                             // "path"는 추가하지 않습니다.
                             if (subCategory !== "path") {
                                 const subCategoryElem = document.createElement("a");
                                 subCategoryElem.textContent = subCategory;
                                 subCategoryElem.href = link;
                                 subCategoryElem.className = "sub-category";
                                 columnElement.appendChild(subCategoryElem);
                             }
                         });

                         rowElement.appendChild(columnElement);
                     }

                     closeSearchForm(); 

                     const offcanvasInstance = new bootstrap.Offcanvas(document.getElementById("offcanvasTop"));
                     offcanvasInstance.show();
                 });
             }
         });

         document.getElementById('searchIcon').addEventListener('click', function() {
             closeOffcanvas();
         });
     });
	    </script>
	</body>
	</html>

