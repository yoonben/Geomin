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
					<li><a href="/geomin/subscribe/searchContent">학습 콘텐츠 검색 및 구독 신청</a></li>
					<li><a href="/geomin/subscribe/subscribeSearchContent">구매한 학습 콘텐츠 검색</a></li>
				</ul>
			</div>
			<div class="content">
				<!-- <div class="today">
					<h2>230901</h2>
					<h2>오늘의 기분은 어떤가요?</h2>
					<img src="/resources/img/pingwing-bee_angry.png">
				</div> -->
				
				<button id="1day">1일 전</button>
				<button id="3day">3일 전</button>
				<button id="1month">1달 전</button>
				<button id="3month">3달 전</button>
				<button id="6month">6달 전</button>
				<button id="1year">1년 전</button>				
				구독날짜 : 
				<!-- <select>
					
				</select> -->
				
				<button id="searchButton">조회</button>
				<br>
				<table id="result-table">
					<thead>
					<tr>
						<th style="font-weight: 900;">ㅁ</th>
						<th>학습 관리자</th>
						<th>콘텐츠 이름</th>
						<th>콘텐츠 구독 날짜</th>
						<th>학습 가능 인원</th>
						<th>콘텐츠 최종 가격</th>
						<th>콘텐츠 수준</th>
						<th>학습 그룹 등록</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="list" items="${list}">
						<tr id="data-raw" class="data-raw" data-value="${list.subsDate}">
							<td><input type="checkbox" name="check" value="check" id="check"></td>
							<td>${list.memberID }</td>
							<td><a href="geomin/teacher/groupRegist">${list.pkgName }</a></td><!-- ?memberID='memberID22' -->
							<td class="list_subsDate">${list.subsDate }</td>
							<td>${list.personnel}</td>
							<td>${list.finalPrice }</td>
							<td>${list.difficulty }</td>
							<c:choose>
								<c:when test="${list.groupid == 'NOT GROUP'}"> <!-- NULL을 N으로 변경-->
									<td><button type='button' id="regButton" name='regButton' 
												onclick='location.href="../teacher/groupRegist"'>그룹 등록</button></td>
								</c:when>
								<c:otherwise>
									<td>등록 완료</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<button id="reqSubscribe">구독 철회</button>
				<button id="recent">날짜가 최근순</button>
				<button id="oldest">날짜가 오래된순</button>
			</div>
			<div class='banner'></div>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {

    $('#1day').click(function () {
    	console.log('1일전 버튼 클릭');
    	$('tr.data-raw').hide();
        filterDataByDate(-1);
    });
    
    $('#3day').click(function () {
    	console.log('3일전 버튼 클릭');
    	$('tr.data-raw').hide();
        filterDataByDate(-3);
    });
    
    $('#1month').click(function () {
    	console.log('1달전 버튼 클릭');
    	$('tr.data-raw').hide();
        filterDataByDate(-30); 
    });
    
    $('#3month').click(function () {
    	console.log('3달전 버튼 클릭');
    	$('tr.data-raw').hide();
        filterDataByDate(-90); 
    });
    
    $('#6month').click(function () {
    	console.log('6달전 버튼 클릭');
    	$('tr.data-raw').hide();
        filterDataByDate(-180); 
    });
    
    $('#1year').click(function () {
    	console.log('1년전 버튼 클릭');
    	$('tr.data-raw').hide();
        filterDataByDate(-365); 
    });

    function filterDataByDate(daysAgo) {
        const currentDate = new Date();
        console.log("currentDate : " , currentDate);
        const targetDate = new Date(currentDate);
        targetDate.setDate(currentDate.getDate() + daysAgo);

        $('tr.data-raw').each(function () {
            const rowDate = new Date($(this).data('value'));
            if (rowDate >= targetDate) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }
    
    const tableBody = document.querySelector('#result-table tbody');
	const dataRows = document.querySelectorAll("tr.data-raw");
	const sortedData = Array.from(dataRows);
	//var dataResult = null;
    $('#recent').click(function () {
    	$('tr.data-raw').hide();
    	sortedData.sort((rowA, rowB) => {
    		//const dataA = rowA.querySelector(".list_subsDate").textContent;
    		//const dataA = $(rowA).data('value');
    		const dataA = new Date($(rowA).data('value'));
    		//const dataA = new Date($(rowA).data('value')).getTime();
    		console.log('dataA : ' , dataA);
    		//const dataB = rowB.querySelector(".list_subsDate").textContent;
    		//const dataB = $(rowB).data('value');
    		const dataB = new Date($(rowB).data('value'));
    		//const dataB = new Date($(rowB).data('value')).getTime();
    		console.log('dataB : ' , dataB);
    		//CONSOLE.LOG('dataA - dataB : ' , dataA - dataB);
    		
    		var dataResult = dataA - dataB;
    		console.log('dataResult : ' , dataResult);
        	//return dataA - dataB; 
        	return dataA - dataB; 
    	});
    });
    
	
    sortedData.forEach(row => {
    	//console.log('여기로 왔나요?');
    	tableBody.appendChild(row);
    	//tableBody.innerHTML = '여기는 TABLEBODY';
    	//tableBody.innerHTML = dataResult;
 	});
    
   /*  let regButton = document.getElementById('regButton');
    $('#regButton').click(function (){
    	console.log('클릭완료!');
    	//window.location.href = 'teacher/groupRegist.jsp?memberid='memberID22'';
    	window.location.href = '../teacher/groupRegist';
    }); */
    
});

/* $('#recent').click(function () {
$('tr.data-raw').hide();
sortDataByDate('desc');
});
$('#oldest').click(function () {
$('tr.data-raw').hide();
sortDataByDate('asc');
});

function sortDataByDate(order) {
	const tableBody = document.querySelector('#result-table tbody');
const dataRows = document.querySelectorAll("tr.data-raw");
const sortedData = Array.from(dataRows);
console.log('sortedData : ', sortedData);
//const rows = $('tr.data-row').get();
if (order === 'desc') {
	sortedData.sort((rowA, rowB) => {
		const dataA = rowA.querySelector(".list_subsDate").textContent;
		const dataB = rowB.querySelector(".list_subsDate").textContent;
		console.log('여기에요! DESC');
    	return dataA - dataB;
	});
}else if (order === 'asc') {
	sortedData.sort((rowA, rowB) => {
		const dataA = rowA.querySelector(".list_subsDate").textContent;
		const dataB = rowB.querySelector(".list_subsDate").textContent;
		console.log('여기에요! ASC');
    	return dataB - dataA;
	});
}

sortedData.forEach(row => {
	console.log('여기로 왔나요?');
	tableBody.appendChild(row);
});

} */
/* sortedData.sort(function (a, b) {
console.log('여기에요!');
const aDate = new Date($(a).data('value'));
console.log('aDate : ' , aDate);
const bDate = new Date($(b).data('value'));
console.log('bDate : ' , bDate);
if (order === 'desc') {
	console.log('여기에요! DESC');
    return bDate - aDate;
} else if(order === 'asc'){
	console.log('여기에요! ASC');
    return aDate - bDate;
}
}); */

//$('#table-body').empty();
/* $.each(rows, function (index, row) {
	tableBody.appendChild(row);
    //$('tr.data-raw').append(row);
}); */
</script>
</html>