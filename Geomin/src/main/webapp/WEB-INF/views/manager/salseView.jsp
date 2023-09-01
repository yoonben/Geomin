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
		
		document.querySelector('#searchElement').style.display ='none';
		yearChart();
		
	});

	monthRadio.addEventListener('click', function () {
		let content = '';
		document.querySelector('#searchElement').style.display ='';
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
	        + '<option selected value="'+currentYear+'">년도 선택</option>';
	    yearDataFromDatabase.forEach(year => {
	        content += '<option value="' + year + '">' + year + '년</option>';
	    })
	    content += '</select>';

	    searchElement.innerHTML = content;
	    
	    yearSelect.addEventListener('change', function () {
	    	const yearSelect = document.querySelector('#yearSelect');
	    	
	        yearInput.value = yearSelect.value;
	        
	        monthChart(yearInput.value);
	    });
	});

	dayRadio.addEventListener('click', function () {
		let content = '';
		document.querySelector('#searchElement').style.display ='';
	    const searchElement = document.querySelector('#searchElement');
	    const yearInput = document.querySelector('#year'); 
	    const monthInput = document.querySelector('#month');
	    const yearCheck = document.querySelector('#yearCheck');
	    const monthCheck = document.querySelector('#monthCheck');
		
	    const currentYear = new Date().getFullYear();
	    const currentMonth = new Date().getMonth() + 1;
	    const yearDataFromDatabase = Array.from({ length: 10 }, (_, index) => currentYear - index);
		
	    if (numberChart) {
	        numberChart.destroy();
	    }
	    if (salesChart) {
	        salesChart.destroy();
	    }
	    
	    dayChart(currentYear,currentMonth);
	    yearCheck.value = '0';
	    monthCheck.value = '0';
	    content = ''
	        + '<select class="form-select" aria-label="Default select example" id="yearSelect2">'
	        + '<option selected value="'+currentYear+'">년도 선택</option>';
	    yearDataFromDatabase.forEach(year => {
	        content += '<option value="' + year + '">' + year + '년</option>';
	    })
	    content += '</select>'
			    + '<select class="form-select" aria-label="Default select example" id="monthSelect">' // 변경된 아이디
			    + '<option selected value="' + currentMonth + '">월 선택</option>'
			    + '<option value="1">1월</option>'
			    + '<option value="2">2월</option>'
			    + '<option value="3">3월</option>'
			    + '<option value="4">4월</option>'
			    + '<option value="5">5월</option>'
			    + '<option value="6">6월</option>'
			    + '<option value="7">7월</option>'
			    + '<option value="8">8월</option>'
			    + '<option value="9">9월</option>'
			    + '<option value="10">10월</option>'
			    + '<option value="11">11월</option>'
			    + '<option value="12">12월</option>'
			    + '</select>';

	    searchElement.innerHTML = content;
	    
	    yearSelect2.addEventListener('change', function () {
	    	const yearSelect = document.querySelector('#yearSelect2');
	    	
	    	yearCheck.value = '1';
	        yearInput.value = yearSelect.value;
	        
	        if(yearCheck.value == 1 && monthCheck.value == 1){
	        	console.log("monthInput.valu : "+monthInput.value);
	        	dayChart(yearInput.value,monthInput.value);
	        }
	    })
	    
	    monthSelect.addEventListener('change', function () {
	    	const monthSelect = document.querySelector('#monthSelect');
	    	
	    	monthCheck.value = '1';
	    	monthInput.value = monthSelect.value;
	    	
	    	if(yearCheck.value == 1 && monthCheck.value == 1){
	    		console.log("monthInput.valu : "+monthInput.value);
	    		dayChart(yearInput.value,monthInput.value);
	        }
	    })
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
	        	    labels: map.monthList,
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
	        	        	max : 30
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
	        	    labels: map.monthList,
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
	        	        max: 200000
	        	        }
	        	    }
	        	    }
	        	});
            } else {               
                alert(map.msg);
            }
            
        });
}

function dayChart(year,month) {
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
    		year: year,
    		month: month
    }
	console.log(obj);
        fetchPost('/geomin/dayChart',obj, (map) => {
            if (map.result == 'success') {
            	
            	 numberChart = new Chart(ctx1, {
	        	    // 그래프의 종류
	        	    type: 'line', // bar : 막대 그래프, line : 선그래프
	        	    data: {
	        	    // 하단 레이블
	        	    labels: map.dayList,
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
	        	        	max : 20
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
	        	    labels: map.dayList,
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
	        	        max: 100000
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
          	<input type="hidden" id="year" name="year">
          	<input type="hidden" id="month" name="month">
          	<input type="hidden" id="yearCheck" name="yearCheck" value='0'>
          	<input type="hidden" id="monthCheck" name="monthCheck" value='0'>
          	<div id="searchElement">
          	
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