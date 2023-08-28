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

table{
	border: 1px solid;
}
th, tr, td{
	border: 1px solid;
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
					<li><a href="/geomin/subscribe/searchContent">학습 콘텐츠 검색 및
							구독 신청</a></li>
				</ul>
			</div>
			<div class="content">
				<div class="today">
					<h2>230828</h2>
					<h2>오늘의 기분은 어떤가요?</h2>
					<img src="/resources/img/pingwing-bee_angry.png">
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
					<thead>
					<tr>
						<th> </th>
						<th>패키지명</th>
						<th>학습 가능 인원</th>
						<th>정가</th>
						<th>최종가</th>
						<th>학습 수준</th>
						<th>학습 내용</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="list" items="${list}">
						<tr id="data-raw" class="data-raw" data-value="${list.difficulty }">
							<td><input type="checkbox" name="check" value="check" id="check"></td>
							<td>${list.pkgName }</td>
							<td>${list.personnel }</td>
							<td>${list.fixedPrice }</td>
							<td class="list_finalPrice">${list.finalPrice }</td>
							<td>${list.difficulty }</td>
							<td>${list.pkgContent }</td>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		const dataRows = document.querySelectorAll("tr.data-raw");
		//$('tr.data-raw').show();
		$('tr.data-raw').show();
		$('#searchButton').click(function() {
			$('tr.data-raw').hide();
			
			//1. 학습 수준
			const choiceDifficulty = document.getElementById('choiceDifficulty').value; // 선택한 값을 저장
			
			if(choiceDifficulty == "전체"){
				$('tr.data-raw').show();
			}else {
				$('tr.data-raw[data-value="' + choiceDifficulty + '"]').show();
			}
			
			//2. 최종 가격
			const selectedPrice = choicePrice.value;
		    //const sortedData = Array.from(dataRows);
		    
		    const list_finalPrice = $(".list_finalPrice").text();
		    console.log('list_finalPrice : ' , list_finalPrice);
		    
		   if (selectedPrice === "높음") {
		    	sortedData.sort((priceA, priceB) => {
		    	 //const list_finalPrice = $(".list_finalPrice").text();
		    	 const priceA = $(".list_finalPrice").text();
				 console.log('priceA : ' , priceA);
		    	 //const priceA = parseInt(rowA.querySelector("td:nth-child(5)").textContent);
		          //console.log('priceA : ' , priceA);
		          //const priceA = $('.list_finalPrice').text();
		          //const priceB = parseInt(rowB.querySelector("td:nth-child(5)").textContent);
		          const priceB = $(".list_finalPrice").text();
		          conosle.log('priceB : ' , priceB);
		          return priceA - priceB;
		    });
	   	
		     } else if (selectedPrice === "낮음") {
		        sortedData.sort((rowA, rowB) => {
		          const priceA = parseInt(rowA.querySelector("td:nth-child(5)").textContent);
		          const priceB = parseInt(rowB.querySelector("td:nth-child(5)").textContent);
		          return priceB - priceA;
		        });
		        $('#data-raw').html('');
		     } 
		    
		    
		    
		   /*  sortedData.forEach(row => {
	            $(row).show(); // 각 정렬된 데이터를 보이도록 설정
	        }); */
		    
		   // $('tr.data-raw[' + sortedData + ']').show();
		    
		    /* $(sortedData).each(function() {
	            $(this).show(); // 각 정렬된 데이터를 보이도록 설정
	        }); */
			
		});
	}); //$(document).ready EndPoint
</script>
</html>