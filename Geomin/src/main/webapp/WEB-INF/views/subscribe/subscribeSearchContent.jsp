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
				<div class="today">
					<h2>230830</h2>
					<h2>오늘의 기분은 어떤가요?</h2>
					<img src="/resources/img/pingwing-bee_sad.png">
				</div>
				
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
						<th> </th>
						<th>학습 관리자</th>
						<th>콘텐츠 이름</th>
						<th>콘텐츠 구독 날짜</th>
						<th>콘텐츠 최종 가격</th>
						<th>콘텐츠 수준</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="list" items="${list}">
						<tr id="data-raw" class="data-raw" data-value="${list.subsDate}">
							<td><input type="checkbox" name="check" value="check" id="check"></td>
							<td>${list.memberID }</td>
							<td>${list.pkgName }</td>
							<td>${list.subsDate }</td>
							<td class="list_finalPrice">${list.finalPrice }</td>
							<td>${list.difficulty }</td>
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
	const tableBody = document.querySelector('#result-table tbody');
    //$('tr.data-raw').show(); // Initially show all rows

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
    
    $('#recent').click(function () {
    	$('tr.data-raw').hide();
        sortDataByDate('desc');
    });
    $('#oldest').click(function () {
    	$('tr.data-raw').hide();
        sortDataByDate('asc');
    });
	
    
    function sortDataByDate(order) {
        const rows = $('tr.data-row').get();
        rows.sort(function (a, b) {
            const aDate = new Date($(a).data('value'));
            const bDate = new Date($(b).data('value'));
            if (order === 'desc') {
                return bDate - aDate;
            } else {
                return aDate - bDate;
            }
        });

        //$('#table-body').empty();
        $.each(rows, function (index, row) {
        	tableBody.appendChild(row);
            //$('tr.data-raw').append(row);
        });
    }
});

</script>
</html>