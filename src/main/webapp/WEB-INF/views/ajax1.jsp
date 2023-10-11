<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
	border-collapse: collapse;
	width: 900px;
}

td, th {
	border: 1px solid #000;
	height: 30px;
    padding: 0 10px;
	text-align: center;
    
}
</style>
<script type="text/javascript" src="./jquery-1.12.3.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	$.ajax({
		url: "./camping_items.json", // 경로
		type: "GET", // 전송방식(GET: 주소형태, POST: 주소 헤더형태)
		dataType: "json", //데이터 형태
		success: function(res) { // 성공했을때 결과를 res에 받고 함수 실행
			var html = "";
			
            var cate = [];
            for(var a of Object.keys(res)){
                cate.push(a);
            }
            
			for(var data of res.tent){				               
				html +="<tr>";
                html +="<td>"+ cate[0] +" </td>";
				html +="<td>"+ data.id +" </td>";
				html +="<td>"+ data.name +" </td>";
				html +="<td>"+ data.price +" </td>";
				html +="<td>"+ data.thumbnail+" </td>";
				html +="<td>"+ data.merit+" </td>";
				html +="</tr>";
			}

			for(var data of res.stove){				               
				html +="<tr>";
                html +="<td>"+ cate[1] +" </td>";
				html +="<td>"+ data.id +" </td>";
				html +="<td>"+ data.name +" </td>";
				html +="<td>"+ data.price +" </td>";
				html +="<td>"+ data.thumbnail+" </td>";
				html +="<td>"+ data.merit+" </td>";
				html +="</tr>";
			}
			
			$("tbody").html(html); 
		}, 
		error : function(request, status, error) { // 실패했을때 함수 실행
			console.log(request.responseText); // 실패 상세 내역
		}
	})
});
</script>
</head>
<body>
<table>
	<thead>
        <tr>
            <th colspan="6">판매리스트</th>
        </tr>
		<tr>
            <th>카테고리</th>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>이미지</th>
			<th>상품설명</th>	
		</tr>
	</thead>
	<tbody></tbody>
</table>
</body>
</html>