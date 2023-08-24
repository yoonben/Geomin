<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchContent페이지</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.content .today {
	margin: 0 auto;
	text-align: center;
}

/* table {
	display: inline-block;
	border: 1px solid;
	width: 100%;
}

th, td {
	width: 100%;
	border: 1px solid;
} */
table {
	border: 1px solid;
	width: 100%;
	table-layout: fixed; /* 고정된 테이블 레이아웃 사용 */
}

th, td {
	border: 1px solid;
	text-align: center; /* 텍스트 중앙 정렬 */
	padding: 8px; /* 셀 내부 여백 */
}

th:first-child, td:first-child {
	width: 10%; /* 첫 번째 열의 너비 설정 */
}

/* 나머지 열은 동일한 너비로 설정하거나 필요에 따라 조절할 수 있습니다 */
th:not(:first-child), td:not(:first-child){
width: 15%; /* 나머지 열의 너비 설정 */
}
</style>
</head>
<body>
	<%@include file="../header/header.jsp"%>
	<div id='section'>
		<div class='subnavi'>
			<div id="serviceDefaultNavi" style="display: inline;">
				<ul>
					<li><a href="">사이트 소개</a></li>
					<li><a href="">이용 가이드</a></li>
					<li><a href="">인기 콘텐츠</a></li>
					<li><a href="">이달의 콘텐츠</a></li>
				</ul>
			</div>
			<br> <br>

			<div id="helloServiceNavi" style="display: none;">
				<h3>서비스 안내</h3>
				<ul>
					<li><a href="">사이트 소개</a></li>
					<li><a href="">이용 가이드</a></li>
				</ul>
			</div>
			<br> <br>

			<div id="subscribeServiceNavi" style="display: none;">
				<h3>구독 서비스</h3>
				<ul>
					<li><a href="/Geomin/subscribe/searchContent">학습 콘텐츠 검색 및
							구독 신청</a></li>
				</ul>
			</div>
			<br> <br>

			<div id="teacherServiceNavi" style="display: none;">
				<h3>강사 마당</h3>
				<ul>
					<li><a href="">학습그룹 등록</a></li>
					<li><a href="">그룹가입 승인</a></li>
					<li><a href="">숙제 전송</a></li>
					<li><a href="">숙제 평가</a></li>
				</ul>
			</div>
			<br> <br>

			<div id="studyServiceNavi" style="display: none;">
				<h3>학습 서비스</h3>
				<ul>
					<li><a href="">학습그룹 가입신청</a></li>
					<li><a href="">숙제 제출</a></li>
				</ul>
			</div>
			<br> <br>

			<div id="adminServiceNavi" style="display: none;">
				<h3>관리 마당</h3>
				<ul>
					<li><a href="">학습 컨텐츠 등록</a></li>
					<li><a href="">게시판</a></li>
					<li><a href="">-공지사항</a></li>
					<li><a href="">-Q&A</a></li>
					<li><a href="">매출 관리</a></li>
					<li><a href="">-매출 집계</a></li>
					<li><a href="">-매출 조회</a></li>
				</ul>
			</div>

		</div>
		<div class="content">
			<div class="today">
				<h2>230824</h2>
				<h2>오늘의 기분은 어떤가요?</h2>
				<img src="/resources/img/pingwing-bee_sad.png">
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
					<th> </th>
					<th>패키지명</th>
					<th>학습 가능 인원</th>
					<th>정가</th>
					<!-- <th>구독료</th> -->
					<th>최종가</th>
					<th>학습 수준</th>
					<th>학습 내용</th>
				</tr>
				<tbody>
					<c:forEach var="list" items="${list}">
						<tr class="data-row" data-difficulty="${list.difficulty}">
							<td><input type="checkbox" name="check" value="check" id="check"></td>
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
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#searchButton').click(function() {
	        const difficulty = document.getElementById('choiceDifficulty').value;
	        const price = document.getElementById('choicePrice').value;

	        // 모든 데이터 행을 가져옴
	        const dataRows = $('tr.data-row').toArray();

	        // 가격에 따라 정렬
	        dataRows.sort(compareByPrice);

	        // 모든 데이터 행을 숨김
	        $('tr.data-row').hide();

	        // 선택한 조건에 따라 데이터 행을 보이게 함
	        dataRows.forEach(function(row) {
	            const currentDifficulty = $(row).data('difficulty');
	            const currentPrice = parseInt($(row).find('td:eq(4)').text(), 10); // 4번째 열의 가격 값 가져오기

	            if (
	                (difficulty === "전체" || currentDifficulty === difficulty) &&
	                (
	                    (price === "없음") ||
	                    (price === "높음" && currentPrice >= getNextRowPrice(row)) ||
	                    (price === "낮음" && currentPrice <= getNextRowPrice(row))
	                )
	            ) {
	                $(row).show();
	            }
	        });
	    });

	    // 다음 행의 가격 값을 가져오는 함수
	    function getNextRowPrice(row) {
	        const nextRowPrice = parseInt($(row).next().find('td:eq(4)').text(), 10);
	        return nextRowPrice;
	    }

	    // 가격 비교 함수
	    function compareByPrice(a, b) {
	        const aPrice = parseInt($(a).find('td:eq(4)').text(), 10);
	        const bPrice = parseInt($(b).find('td:eq(4)').text(), 10);

	        return aPrice - bPrice; // 오름차순 정렬
	    }
		
		
		/* $('#searchButton').click(function() {
	        const difficulty = document.getElementById('choiceDifficulty').value;
	        const price = document.getElementById('choicePrice').value;

	        const dataRows = $('tr.data-row').toArray();
	        dataRows.sort(compareByPrice); // 가격에 따라 데이터 정렬

	        $('tr.data-row').hide(); // 모든 데이터 행 숨기기

	        dataRows.forEach(function(row) {
	            const currentDifficulty = $(row).data('difficulty');
	            const subsPrice = parseInt($(row).find('td:eq(4)').text(), 10); // 4번째 열의 구독료 값 가져오기

	            // 여러 조건을 함께 처리하여 데이터 행 보이기
	            if (
	                (difficulty === "전체" || currentDifficulty === difficulty) &&
	                (
	                    (price === "없음") ||
	                    (price === "높음" && subsPrice >= getNextRowSubsPrice(row)) ||
	                    (price === "낮음" && subsPrice <= getNextRowSubsPrice(row))
	                )
	            ) {
	                $(row).show();
	            }
	        });
	    });

	    // 다음 행의 구독료 값을 가져오는 함수
	    function getNextRowSubsPrice(row) {
	        const nextRowSubsPrice = parseInt($(row).next().find('td:eq(4)').text(), 10);
	        return nextRowSubsPrice;
	    }

	    // 가격 비교 함수
	    function compareByPrice(a, b) {
	        const aPrice = parseInt($(a).find('td:eq(4)').text(), 10);
	        const bPrice = parseInt($(b).find('td:eq(4)').text(), 10);
	        
	        if (aPrice < bPrice) {
	            return -1;
	        }
	        if (aPrice > bPrice) {
	            return 1;
	        }
	        return 0;
	    } */	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/* $('#searchButton').click(function() {
	        const difficulty = document.getElementById('choiceDifficulty').value;
	        const price = document.getElementById('choicePrice').value;

	        const dataRows = $('tr.data-row').toArray();
	        dataRows.sort(compareByPrice); // 가격에 따라 데이터 정렬

	        $('tr.data-row').hide(); // 모든 데이터 행 숨기기

	        dataRows.forEach(function(row) {
	            const currentDifficulty = $(row).data('difficulty');
	            const subsPrice = parseInt($(row).find('td:eq(4)').text(), 10); // 4번째 열의 구독료 값 가져오기

	            // 여러 조건을 함께 처리하여 데이터 행 보이기
	            if (
	                (difficulty === "전체" || currentDifficulty === difficulty) &&
	                (
	                    (price === "없음") ||
	                    (price === "높음" && subsPrice >= getNextRowSubsPrice(row)) ||
	                    (price === "낮음" && subsPrice <= getNextRowSubsPrice(row))
	                )
	            ) {
	                $(row).show();
	            }
	        });
	    });

	    // 다음 행의 구독료 값을 가져오는 함수
	    function getNextRowSubsPrice(row) {
	        const nextRowSubsPrice = parseInt($(row).next().find('td:eq(4)').text(), 10);
	        return nextRowSubsPrice;
	    }

	    // 가격 비교 함수
	    function compareByPrice(a, b) {
	        const aPrice = parseInt($(a).find('td:eq(4)').text(), 10);
	        const bPrice = parseInt($(b).find('td:eq(4)').text(), 10);
	        
	        if (aPrice < bPrice) {
	            return -1;
	        }
	        if (aPrice > bPrice) {
	            return 1;
	        }
	        return 0;
	    } */
		
		
		//1. 조회 버튼
		/* $('#searchButton').click(function() {
			console.log('#searchButton 이 클릭되었습니다.');
			const difficulty = document.getElementById('choiceDifficulty').value;
			const price = document.getElementById('choicePrice').value;
			console.log('difficulty : ', difficulty);
			console.log('price : ', price);
			
			$('tr.data-row').hide();
			$('tr.data-row').each(function() {
	            const currentDifficulty = $(this).data('difficulty');
	            const finalPrice = parseInt($(this).find('td:eq(4)').text(), 10); // 4번째 열의 구독료 값 가져오기

	            // 여러 조건을 함께 처리하여 데이터 행 보이기
	            if (
	                (difficulty === "전체" || currentDifficulty === difficulty) &&
	                (
	                		(price === "없음") ||
	                        (price === "높음" && finalPrice >= getNextRowSubsPrice(this)) ||
	                        (price === "낮음" && finalPrice <= getNextRowSubsPrice(this))
	                )
	            ) {
	                $(this).show();
	            }
	        });
		});	
		
		function getNextRowSubsPrice(row) {
	        const nextRowSubsPrice = parseInt($(row).next().find('td:eq(4)').text(), 10);
	        return nextRowSubsPrice;
	    } */
	
		/* $('#reqSubscribe').click(function(){
			console.log('#reqSubscribe 이 클릭되었습니다.');
			const check = document.getElementById('check').value;
			console.log('check : ', check);
		}); */
		
		
	}); //$(document).ready EndPoint
</script>
</html>