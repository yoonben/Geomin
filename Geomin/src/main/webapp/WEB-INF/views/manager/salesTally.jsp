<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
			#container>#section>.subnavi>ul{
	    		text-align: left;
	    		list-style-type: none;
	    	}
	        #container>#section>.subnavi>ul>li{
	    		padding-left: 60px;
	            margin-top: 25px;
	            font-size: 14px;
	    	}
	    	.subject{
	    		    background-color: #fbfbfb;
				    font-size: 24px;
				    color: #333;
				    font-weight: 400;
				    padding: 20px;
				    border-bottom: #e0e0e1 1px solid;
	    	}
	    	
	    	.date {
			    border-bottom: #e0e0e1 1px solid;
			    padding: 5px 10px;
			    list-style: none;
			    overflow: hidden; /* 부모 컨테이너 내에서 자식 요소를 포함하도록 설정 */
			}
			
			.date>h4{
			    margin-bottom: 0;
			}
			
			.date > li {
			    float: left;
			    width: 50%; /* 좌우로 50%씩 차지하도록 설정 */
			    box-sizing: border-box; /* 패딩과 경계선을 포함한 크기로 설정 */
			    padding: 10px 0; /* 위아래 10px 패딩 */
			    font-size: 12px;
			}
			
			.date > .right {
			    float: right;
			    text-align: right;
			}
			.dv{
				padding: 20px;
				height: 250px;
			}
			.dv2{
				padding: 20px;
			}
	</style>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" >
window.addEventListener('load', function(){
	const ctx1 = document.getElementById('numberChart');
	const ctx2 = document.getElementById('salesChart');
	
	// 현재 연도 구하기
	const currentYear = new Date().getFullYear();

	// 최근 10년의 년도 데이터 배열 생성 (내림차순)
	const yearDataFromDatabase = Array.from({ length: 10 }, (_, index) => currentYear - index).reverse();
	
	// 차트 선택
	new Chart(ctx1, {
	    // 그래프의 종류
	    type: 'line', // bar : 막대 그래프, line : 선그래프
	    data: {
	    // 하단 레이블
	    labels: yearDataFromDatabase,
	    datasets: [{
	        // 상단 레이블
	        label: '판매 수',
	        data: [],
	        borderWidth: 1
	    }]
	    },
	    options: {
	    scales: {
	        y: {
	        beginAtZero: true
	        }
	    }
	    }
	});
	
	// 차트 선택
	new Chart(ctx2, {
	    // 그래프의 종류
	    type: 'bar', // bar : 막대 그래프, line : 선그래프
	    data: {
	    // 하단 레이블
	    labels: yearDataFromDatabase,
	    datasets: [{
	        // 상단 레이블
	        label: '판매 액',
	        data: [],
	        borderWidth: 1
	    }]
	    },
	    options: {
	    scales: {
	        y: {
	        beginAtZero: true
	        }
	    }
	    }
	});
})
</script>
</head>
<body>
<div id='container'>
	<%@include file="../header/header.jsp" %>
	<div id='section'>
    <div class='subnavi'>
	    <ul>
	        <li><a href="/geomin/manager">학습콘텐츠 등록</a></li>
		    <li><a href="/geomin/board">Q&A</a></li>
		    <li><a href="/geomin/salesTally">매출 관리</a></li>
		    <li><a href="/geomin/salesTally">- 매출 집계</a></li>
		    <li><a href="/geomin/salesInquiry">- 매출 조회</a></li>
	    </ul>
	</div>
          <div class='content'>
          	<div>
          	<input type="checkbox" value="year">년 <input type="checkbox" value="month">월 <input type="checkbox" value="day">일
          	</div>
          	<div>          		
		        <canvas id="numberChart"></canvas>
		    </div>
		    <div>          		
		        <canvas id="salesChart"></canvas>
		    </div>
          </div>
          
            <div class='banner'>
            
            </div>
      </div>
      </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>