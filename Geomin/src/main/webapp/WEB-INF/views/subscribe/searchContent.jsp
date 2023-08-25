<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchContent페이지</title>
<style type="text/css">
#container>#section>.subNavi>ul {
	text-align: left;
	list-style-type: none;
}

#container>#section>.subNavi>ul>li {
	padding-left: 60px;
	margin-top: 25px;
	font-size: 14px;
}
#section>.subNavi {
    width: 205px;
    height: 600px;
    float: left;
    border-right: 1px solid #D9D9D9;
    box-sizing: border-box;
    margin-right: 5px;
}
</style>
</head>
<body>
	<div id='container'>
		<%@include file="../header/header.jsp"%>
		<div id='section'>
			<div class="subNavi">
				<h3>구독 서비스</h3>
				<ul>
					<li><a href="/Geomin/subscribe/searchContent">학습 콘텐츠 검색 및
							구독 신청</a></li>
				</ul>
			</div>
			<div class="content">
				<div class="today">
					<h2>230825</h2>
					<h2>오늘의 기분은 어떤가요?</h2>
					<img src="/resources/img/pingwing-bee_happy.png">
				</div>

				난이도 : 
				<select id="choiceDifficulty">
					<option value="전체" selected="selected">전체</option>
					<option value="초급">초급</option>
					<option value="중급">중급</option>
					<option value="고급">고급</option>
				</select> 
				가격 : 
				<select id="choicePrice">
					<option value="없음" selected="selected">선택 안함</option>
					<option value="높음">가격 높은 순</option>
					<option value="낮음">가격 낮은 순</option>
				</select>
				<button id="searchButton">조회</button>
				<br>
				<table>
					<tr>
						<th></th>
						<th>패키지명</th>
						<th>학습 가능 인원</th>
						<th>정가</th>
						<!-- <th>구독료</th> -->
						<th>최종가</th>
						<th>학습 수준</th>
						<th>학습 내용</th>
					</tr>
					<!-- <td><input type="checkbox" name="check" value="check" id="check"></td> -->
					<tbody>
						<c:forEach var="list" items="${list}">
							<tr class="data-row" data-difficulty="${list.difficulty}">
								<td>${list.pkgName}</td>
								<td>${list.personnel}</td>
								<td>${list.fixedPrice}</td>
								<td>${list.finalPrice}</td>
								<%-- <td>${list.subsPrice}</td> --%>
								<td>${list.difficulty}</td>
								<td>${list.pkgContent}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button id="reqSubscribe">구독 신청</button>
			</div>
			<div class='banner'></div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#searchButton').click(function() {
			const difficulty = document.getElementById('choiceDifficulty').value;
			const price = document.getElementById('choicePrice').value; // 모든 데이터 행을 가져옴
			const dataRows = $('tr.data-row').toArray(); // 가격에 따라 정렬
			//dataRows.sort(compareByPrice);
			// 모든 데이터 행을 숨김
			$(dataRows).hide();
			
			const currentDifficulty = $(dataRows).data('difficulty');
			console.log('currentDifficulty : ', currentDifficulty);
			if(difficulty === "전체" || currentDifficulty === difficulty){
				$(dataRows).show();
			}
			
			// 선택한 조건에 따라 데이터 행을 보이게 함
			/* dataRows.forEach(function(row) {
				const currentDifficulty = $(row).data('difficulty');
				const currentPrice = parseInt($(row).find('td:eq(4)').text(),10); // 4번째 열의 가격 값 가져오기
				if ((difficulty === "전체" || currentDifficulty === difficulty) && ((price === "없음") 
						|| (price === "높음" && currentPrice >= getNextRowPrice(row)) 
						|| (price === "낮음" && currentPrice <= getNextRowPrice(row)))) {
							$(row).show();
				}
			}); */
			
			/* const rows = $('.data-row');
	        rows.sort(function(a, b) {
	            const aValue = parseFloat($(a).find('td:eq(3)').text()); // finalPrice 열 값
	            const bValue = parseFloat($(b).find('td:eq(3)').text());
	            
	            if (price === '높음') {
	                return aValue - bValue;
	                $(row).show();
	            } else if (price === '낮음') {
	                return bValue - aValue;
	                $(row).show();
	            }
	        }); */
			
		});
	}); //$(document).ready EndPoint
</script>
</html>