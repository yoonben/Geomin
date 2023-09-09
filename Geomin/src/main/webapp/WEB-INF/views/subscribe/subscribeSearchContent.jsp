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
							<td class="list_pkgName">${list.pkgName }</td> <!-- ?memberID='memberID22' --> <!-- <a href="geomin/teacher/groupRegist"></a> -->
							<td class="list_subsDate">${list.subsDate }</td>
							<td>${list.personnel}</td>
							<td>${list.finalPrice }</td>
							<td>${list.difficulty }</td>
							<c:url var="groupRegistURL" value="../teacher/groupRegist">
    							<c:param name="pkgName" value="${list.pkgName}" />
							</c:url>
							<c:choose>
								<c:when test="${list.groupid == 'NOT GROUP'}"> <!-- NULL을 N으로 변경-->
									<td><button type='button' id="regButton" name='regButton' onclick='location.href="${groupRegistURL}"'>그룹 등록</button></td>
									<%-- <td><button type='button' id="regButton" name='regButton' onclick='location.href="../teacher/groupRegist?pkgName=${list.pkgName}"'>그룹 등록</button></td> --%> 
									<%-- onclick='location.href="../teacher/groupRegist?pkgName=${list.pkgName }"' --%>
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
				<button id="recent">날짜 순서 토글</button>
				<!-- <button id="recent">날짜가 최근순</button>
				<button id="oldest">날짜가 오래된순</button> -->
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
    
    
    //날짜 순 정렬 버튼
    let sortByRecent  = true; // 초기에는 최근 순으로 정렬

    $('#recent').click(function () {
        sortByRecent = !sortByRecent;
        $('tr.data-raw').hide();
        sortDataByDate(sortByRecent);
    });

    function sortDataByDate(sortByRecent) {
        const currentDate = new Date();
        console.log("currentDate: ", currentDate);

        $('tr.data-raw').sort(function (a, b) {
            const dateA = new Date($(a).data('value'));
	        console.log("dateA: ", dateA);
            
            const dateB = new Date($(b).data('value'));
	        console.log("dateB: ", dateB);

            if (sortByRecent) {
                // 최근 순으로 정렬
                return dateB - dateA;
            } else {
                // 오래된 순으로 정렬
                return dateA - dateB;
            }
        }).each(function () {
            $(this).show();
        });
    }
    
    
    const tableBody = document.querySelector('#result-table tbody');
    //const tableBody = document.querySelector('#result-table tbody');
	//const dataRows = document.querySelectorAll("tr.data-raw");
	const dataRows = Array.from(document.querySelectorAll("tr.data-raw"));
	console.log('dataRows : ' , dataRows);
	//const sortedData = Array.from(dataRows);
	//var dataResult = null;
    $('#recent').click(function () {
    	$('tr.data-raw').hide();
    	/* sortedData.sort((rowA, rowB) => {
    		const dataA = new Date($(rowA).data('value'));
    		console.log('dataA : ' , dataA);
    		const dataB = new Date($(rowB).data('value'));
    		console.log('dataB : ' , dataB);
    		
    		var dataResult = dataA - dataB;
    		console.log('dataResult : ' , dataResult);
        	return dataA - dataB; 
    	}); */
    	dataRows.sort((rowA, rowB) => {
    	    const dateA = new Date($(rowA).find('.list_subsDate').text()); // 날짜 형식의 데이터를 Date 객체로 변환
    	    console.log('dateA : ' , dateA);
    	    const dateB = new Date($(rowB).find('.list_subsDate').text());
    	    console.log('dateB : ' , dateB);
    	    
    	    return dateA - dateB; // 오름차순 정렬
    	});
    	
    	dataRows.forEach(row => {
            tableBody.appendChild(row);
        });
    });
	
    
    
    $('#regButton').click(function () {
    	var pkgName = $(this).closest('tr').find('.list_pkgName').text();
    	$.ajax({
            type: "GET", // HTTP 요청 방식 (GET 또는 POST)
            url: "/geomin/teacher/groupRegist", // JSP 페이지의 경로 또는 서블릿 URL
            data: { pkgName: pkgName }, // 전송할 데이터
            success: function(response) {
            },
            error: function(xhr, status, error) {
            }
        });
    });
    /* $('#regButton').click(function () {
    	var pkgName = $(this).closest('tr').find('.list_pkgName').text();
    	$.ajax({
            type: "POST", // HTTP 요청 방식 (GET 또는 POST)
            url: "../teacher/groupRegist", // JSP 페이지의 경로 또는 서블릿 URL
            data: { pkgName: pkgName }, // 전송할 데이터
            success: function(response) {
            },
            error: function(xhr, status, error) {
            }
        });
    }); */
});
/*  let regButton = document.getElementById('regButton');
$('#regButton').click(function (){
	console.log('클릭완료!');
	//window.location.href = 'teacher/groupRegist.jsp?memberid='memberID22'';
	window.location.href = '../teacher/groupRegist';
}); */
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