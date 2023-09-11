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
				난이도 : 
				<select id="choiceDifficulty">
					<option value="전체" selected="selected">전체</option>
					<option value="초급">초급</option>
					<option value="중급">중급</option>
					<option value="고급">고급</option>
				</select> 
				가격 : 
				<select id="choicePrice">
					<option value="" selected="selected">선택하기</option>
					<option value="높음">가격 높은 순</option>
					<option value="낮음">가격 낮은 순</option>
				</select>
				내용 검색 :
				<input id="searchContent" type="text" width="150px" placeholder="내용을 검색해 주세요">
				<button id="searchButton">조회</button>
				<br>
			<div class="content">
				<table id="result-table">
					<thead>
					<tr>
						<th style="font-weight: 900;">ㅁ</th>
						<th>패키지명</th>
						<th>학습 인원</th>
						<th>정가</th>
						<th>최종가</th>
						<th>학습 수준</th>
						<th>학습 내용</th>
						<!-- <th>구독</th> -->
					</tr>
					</thead>
					<tbody>
					<c:forEach var="list" items="${list}">
					
						<tr id="data-raw" class="data-raw" data-value="${list.difficulty }">
								<c:choose>
									<c:when test="${list.pkgId eq list2.pkgId}">
										<td><input type="checkbox" name="check" value="check" id="check" disabled="disabled"></td>
									</c:when>
									<c:otherwise>
										<td><input type="checkbox" name="check" value="check" id="check"></td>
									</c:otherwise>
								</c:choose>
							<td style="display: none;">${list.pkgId }</td>
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
			<!-- <div class='banner'></div> -->
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('input[type="checkbox"][name="check"]').click(function(){
			 
			if($(this).prop('checked')){
		 
				$('input[type="checkbox"][name="check"]').prop('checked',false);
			 
			    $(this).prop('checked',true);
			 
			 }
		});
		
		const dataRows = document.querySelectorAll("tr.data-raw");
		$('#searchButton').click(function() {
			$('tr.data-raw').hide();
			
			//난이도와 검색어에 해당하는 데이터 정렬
			const choiceDifficulty = document.getElementById('choiceDifficulty').value; // 선택한 값을 저장
			const sortedData = Array.from(dataRows);
			const searchContent = document.getElementById('searchContent').value;
			console.log('입력한 searchContent : ' , searchContent);
			sortedData.forEach(row => {
				const difficultyValue = row.getAttribute("data-value");
				const content = row.querySelector("td:nth-child(8)").textContent;
				console.log('출력한 content : ' , content);
				if((choiceDifficulty === "전체" || difficultyValue === choiceDifficulty)&&(searchContent === "" || content.includes(searchContent))){
					/* $('tr.data-raw').show(); */
					row.style.display = 'table-row';
				}
			});
			
			//난이도와 검색어 + 가격에 해당하는 데이터 정렬
			const selectedPrice = choicePrice.value;
	        if (selectedPrice === "높음") {
	            sortedData.sort((rowA, rowB) => {
	                const priceA = parseFloat(rowA.querySelector(".list_finalPrice").textContent);
	                console.log('priceA : ' , priceA);
	                const priceB = parseFloat(rowB.querySelector(".list_finalPrice").textContent);
	                return priceB - priceA;
	            });
	        } else if (selectedPrice === "낮음") {
	            sortedData.sort((rowA, rowB) => {
	                const priceA = parseFloat(rowA.querySelector(".list_finalPrice").textContent);
	                const priceB = parseFloat(rowB.querySelector(".list_finalPrice").textContent);
	                return priceA - priceB;
	            });
	        }
	        const tableBody = document.querySelector('#result-table tbody');
        	sortedData.forEach(row => {
 	        	tableBody.appendChild(row);
        		//row.style.display = 'table-row';
 	        });
		});
			//1. 첫 번째 조건문
			/* if(choiceDifficulty == "전체"){
				$('tr.data-raw').show();
			}else {
				$('tr.data-raw[data-value="' + choiceDifficulty + '"]').show();
			} */
			
			//2. 최종 가격
			/* const selectedPrice = choicePrice.value;
			console.log('selectedPrice : ' , selectedPrice);
		    const sortedData = Array.from(dataRows);
		    
		    const list_finalPrice = $(".list_finalPrice").text();
		    console.log('list_finalPrice : ' , list_finalPrice);
		    
		    if (selectedPrice === "높음") {
		    	sortedData.sort((rowA, rowB) => {
		        	const priceA = rowA.querySelector(".list_finalPrice").textContent;
            		const priceB = rowB.querySelector(".list_finalPrice").textContent;
		        	return priceB - priceA;
		    	});
	   	    } else if (selectedPrice === "낮음") {
		        sortedData.sort((rowA, rowB) => {
		        	const priceA = rowA.querySelector(".list_finalPrice").textContent;
            		const priceB = rowB.querySelector(".list_finalPrice").textContent;
		        	return priceA - priceB;
		        });
		    } */ 
		  	
		  //3. 세 번째 조건문
		 	/*const searchContent = document.getElementById('searchContent').value;
			   console.log("searchContent : " , searchContent);
		        sortedData.forEach(row => {
		            const contentCell = row.querySelector("td:last-child"); // 마지막 td 셀 (pkgContent)
		            const content = contentCell.textContent; // 대소문자 구분 없이 비교하기 위해 소문자로 변환

		            // 검색어가 포함되어 있으면 해당 데이터를 보여줌
		            if (content.includes(searchContent)) {
		                row.style.display = 'table-row';
		            }
		      }); */
		
		$('#reqSubscribe').click(function() {
			var checked_Data = [];

		    $('input[name="check"]:checked').each(function() {
		        var $row = $(this).closest('tr');
		        var rowData = {
		        	pkgId: $row.find('td:eq(1)').text(),
		            pkgName: $row.find('td:eq(2)').text(),
		            Personnel: $row.find('td:eq(3)').text(),
		            fixedPrice: $row.find('td:eq(4)').text(),
		            finalPrice: $row.find('td:eq(5)').text(),
		            difficulty: $row.find('td:eq(6)').text(),
		            pkgContent: $row.find('td:eq(7)').text()
		        };
		        checked_Data.push(rowData);
		    });

		    console.log(checked_Data);
		    
		   $.ajax({
		        url: '/geomin/subscribe/searchContent',
		        type: 'POST',
		        data: JSON.stringify(checked_Data),
                contentType: "application/json",
                dataType: "json",
		        success: function(response) {
		            //alert('성공');
		            //console.log(response);
		        },
		        error: function(error) {
		            //alert('실패');
		            //console.error(error);
		        }
		    });
		}); 
	}); //$(document).ready EndPoint
	
	
	// const choiceDifficulty = document.getElementById('choiceDifficulty').value;
    //console.log('choiceDifficulty : ' , choiceDifficulty);
    /*const searchContent = document.getElementById('searchContent').value;
    const sortedData = Array.from(dataRows);
    //console.log('sortedData : ' , sortedData);
    const tableBody = document.querySelector('#result-table tbody');
    sortedData.forEach(row => {
        const difficultyValue = row.getAttribute("data-value");
        //console.log('difficultyValue : ' , difficultyValue);
        const content = row.querySelector("td:nth-child(8)").textContent;
			//console.log('content : ' , content);
        
        // 첫 번째와 세 번째 조건을 순차적으로 적용
        if ((choiceDifficulty === "전체" || difficultyValue === choiceDifficulty) &&
            (searchContent === "" || content.includes(searchContent))
        ){
            row.style.display = 'tr.data-raw';
        }
    }); 
    
    // 두 번째 조건 적용
    const selectedPrice = choicePrice.value;

    if (selectedPrice === "높음") {
        sortedData.sort((rowA, rowB) => {
            const priceA = parseFloat(rowA.querySelector(".list_finalPrice").textContent);
            console.log('priceA : ' , priceA);
            const priceB = parseFloat(rowB.querySelector(".list_finalPrice").textContent);
            return priceB - priceA;
        });
    } else if (selectedPrice === "낮음") {
        sortedData.sort((rowA, rowB) => {
            const priceA = parseFloat(rowA.querySelector(".list_finalPrice").textContent);
            const priceB = parseFloat(rowB.querySelector(".list_finalPrice").textContent);
            return priceA - priceB;
        });
    }
    
	//sortedData.forEach(row => {
     	tableBody.appendChild(row);
     });      
});*/
</script>

</html>