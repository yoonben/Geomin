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

let numberChart = null;
let salesChart = null;

window.addEventListener('load', function(){
	
	// 현재 연도 구하기
	const currentYear = new Date().getFullYear();
	
	const yearRadio = document.querySelector('#yearRadio');
	const monthRadio = document.querySelector('#monthRadio');
	const dayRadio = document.querySelector('#dayRadio');
		
	yearChart();
	
	yearRadio.addEventListener('click', function () {
		document.querySelector('#searchButen').style.display ='none';
		yearChart();
	});

	monthRadio.addEventListener('click', function () {
		let content = '';
		document.querySelector('#searchButen').style.display ='';
	    const searchElement = document.querySelector('#searchElement');
	    const yearInput = document.querySelector('#year'); 
		
	    const currentYear = new Date().getFullYear();
	    const yearDataFromDatabase = Array.from({ length: 10 }, (_, index) => currentYear - index);

	    if (numberChart) {
	        numberChart.destroy();
	    }
	    if (salesChart) {
	        salesChart.destroy();
	    }

	    monthChart(currentYear.toString());
	    
	    content = ''
	        + '<select class="form-select" aria-label="Default select example" id="yearSelect">'
	        + '<option selected>년도 선택</option>';
	    yearDataFromDatabase.forEach(year => {
	        content += '<option value="' + year + '">' + year + '</option>';
	    })
	    content += '</select>';

	    searchElement.innerHTML = content;
	    
	    yearSelect.addEventListener('change', function () {
	    	const yearSelect = document.querySelector('#yearSelect');
	    	
	        yearInput.value = yearSelect.value; // Set the selected value to the input
	    });
	});

	dayRadio.addEventListener('click', function () {
		
	});
	
	const yearButton = document.querySelector('#yearButton'); // Assuming your button has the ID "yearButton"

	yearButton.addEventListener('click', function () {
	    monthChart(document.querySelector('#year').value); // Convert the input value to an integer
	});
})

function yearChart() {
    let ctx1 = document.getElementById('numberChart');
    let ctx2 = document.getElementById('salesChart');
    
    if (numberChart) {
        numberChart.destroy();
    }
    if (salesChart) {
        salesChart.destroy();
    }
    
    let transactioncntList = [];
    let datetotalsalesList = [];
    

        fetchPost('/geomin/yearChart',{}, (map) => {
            if (map.result == 'success') {
            	
            	 numberChart = new Chart(ctx1, {
	        	    // 그래프의 종류
	        	    type: 'line', // bar : 막대 그래프, line : 선그래프
	        	    data: {
	        	    // 하단 레이블
	        	    labels: map.yearList,
	        	    datasets: [{
	        	        // 상단 레이블
	        	        label: '거래 건수',
	        	        data: map.transactioncntList,
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
	        	salesChart = new Chart(ctx2, {
	        	    // 그래프의 종류
	        	    type: 'bar', // bar : 막대 그래프, line : 선그래프
	        	    data: {
	        	    // 하단 레이블
	        	    labels: map.yearList,
	        	    datasets: [{
	        	        // 상단 레이블
	        	        label: '판매 매출',
	        	        data: map.datetotalsalesList,
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
            } else {               
                alert(map.msg);
            }
            
        });
}

function monthChart(year) {
    let ctx1 = document.getElementById('numberChart');
    let ctx2 = document.getElementById('salesChart');
    
    console.log(year);
    
    if (numberChart) {
        numberChart.destroy();
    }
    if (salesChart) {
        salesChart.destroy();
    }
    
    let transactioncntList = [];
    let datetotalsalesList = [];
    
    let obj = {
    		year: year
    }

        fetchPost('/geomin/monthChart',obj, (map) => {
            if (map.result == 'success') {
            	
            	 numberChart = new Chart(ctx1, {
	        	    // 그래프의 종류
	        	    type: 'line', // bar : 막대 그래프, line : 선그래프
	        	    data: {
	        	    // 하단 레이블
	        	    labels: map.yearList,
	        	    datasets: [{
	        	        // 상단 레이블
	        	        label: '거래 건수',
	        	        data: map.transactioncntList,
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
	        	salesChart = new Chart(ctx2, {
	        	    // 그래프의 종류
	        	    type: 'bar', // bar : 막대 그래프, line : 선그래프
	        	    data: {
	        	    // 하단 레이블
	        	    labels: map.yearList,
	        	    datasets: [{
	        	        // 상단 레이블
	        	        label: '판매 매출',
	        	        data: map.datetotalsalesList,
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
            } else {               
                alert(map.msg);
            }
            
        });
}
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
          	<input class="form-check-input" type="radio" name="flexRadioDefault" id="yearRadio" checked="checked">
		  	<label class="form-check-label" for="yearRadio">
		    	년 매출
		  	</label>
		  	
		  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="monthRadio">
		  	<label class="form-check-label" for="monthRadio">
		    	월 매출
		  	</label>
		  	
		  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="dayRadio">
		  	<label class="form-check-label" for="dayRadio">
		    	일 매출
		  	</label>
          	</div>
          	<input type="text" id="year" name="year">
          	<div id="searchElement">
          	
          	</div>
          	<div id="searchButen" style="display: none;">
          		<button type="button" class="btn btn-primary" id="yearButton">Primary</button>
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