<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
	
<head>
<meta charset="UTF-8">
<title>searchContent페이지</title>
<style type="text/css">
#container>#section>.subnavi>ul {
	text-align: center;
	list-style-type: none;
	margin-top: 25px;
}

#container>#section>.subnavi>ul>li {
	padding-left: 8px;
	padding-top: 15px;
	margin-top: 25px;
	font-size: 14px;
}

#section>.subNavi {
	width: 180px;
	height: 600px;
	float: left;
	border-right: 1px solid #D9D9D9;
	box-sizing: border-box;
	margin-top: 25px;
	margin-left: 20px;
}



 .cont {
    width: 200px;
  }
.checkCont {
   width: 10px;
  }
  .titleCont {
   width: 130px;
  }

#container>#section>.subNavi>ul {
	/* text-align: left; */
	list-style-type: none;
	width: 150px;
	height: 200px;
	text-align: center;
}

#container>#section>.subNavi>ul>a {
	/*   margin-top: 25px; */
	font-size: 15px;
	width: 140px;
	height: 50px;
	text-align: center;
	padding: auto;
	margin-top: 25px;
	font-family: 'GmarketSansMedium';
}

#container>#section>.subNavi>ul>li {
	margin-top: 15px;
	padding-top: 15px;
	font-size: 14px;
	cursor: pointer;
	width: 140px;
	height: 50px;
	text-align: center;
	border-top: 1px solid #002A51;
	border-bottom: 1px solid #002A51;
	font-family: 'GmarketSansMedium';
}

#container>#section>.subNavi>ul>li:hover {
	margin-top: 15px;
	padding-top: 10px;
	font-size: 13px;
	cursor: pointer;
	color: #003C72;
	width: 140px;
	height: 50px;
	text-align: center;
	box-shadow: 0px 3px 6px rgba(0, 0, 0.2, 0.2);
	border-top: 1px solid #002A51;
	border-bottom: 1px solid #002A51;
	background-color: #CDE6FD;
	font-size: 1.2rem;
	font-weight: 600;
	font-family: 'GmarketSansMedium';
}

#reqSubscribe{
	height:45px; 
   	width:170px;
   	background-color: #FFFFFF;
   	border:1px solid #666666;
   	border-radius: 8px;
   	cursor: pointer;
   	color:#000000;
   	font-size: 16px;
   	font-weight: 600;
   	margin-left:230px;
}
#reqSubscribe:hover{
	height:45px; 
   	width:170px;
   	background-color: #003769;
   	color:#FFFFFF;
   	border:1px solid #666666;
   	border-radius: 5px;
   	cursor: pointer;
   	font-size: 16px;
   	font-weight: 600;
   	margin-left:230px;
}

#regTitle{
	margin-top : 30px;
	font-size: 35px;
	text-align:center;
	font-family: 'GmarketSansMedium';
}

hr {
  border : 5px solid #003A6F;
}
	#searchButton{
	height:30px; 
   	width:60px;
   	background-color: #FFFFFF;
   	border:1px solid #666666;
   	border-radius: 8px;
   	cursor: pointer;
   	color:#000000;
   	font-size: 16px;
   	font-weight: 600;
   	font-weight: 600;	
}
#searchButton:hover{
	height:30px; 
   	width:60px;
   	background-color: #002F5A;
   	color:#FFFFFF;
   	border:1px solid #666666;
   	border-radius: 5px;
   	cursor: pointer;
  	font-size: 16px;
  	font-weight: 600;
  	font-weight: 600;
}

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

</style>
</head>
<body>
	<div id='container'>
		<%@include file="../header/header.jsp"%>
		<div id='section'>
			<div class="subNavi">
				<ul>
					<a><b>구독 서비스</b></a>
					<li><a href="/geomin/subscribe/searchContent">학습콘텐츠 구독</a></li>
					<li><a href="/geomin/subscribe/subscribeSearchContent">나의 학습콘텐츠</a></li>
				</ul>
			</div>
			<div class='content'>
				<p id='regTitle'>학습콘텐츠 구독신청</p>	
		            <hr> 
		            
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
			
				<table id="result-table" class="table" border="1px solid" style="height: 50%; weight: 100%">
				
			    <thead>
			        <tr class="table-primary">
			            <th style="font-weight: 600;" class='checkCont'>□</th>
			            <th class='titleCont'>패키지명</th>
			            <th>학습 인원</th>
			            <th>정가</th>
			            <th>최종가</th>
			            <th>학습 수준</th>
			            <th class='cont'>학습 내용</th>
			            <!-- <th>구독</th> -->
			        </tr>
			    </thead>
			    
			    <tbody>
			        <c:forEach var="pkgIdItem" items="${pkgId}">
			            <p id="pkgIdItem" data-value= "${pkgIdItem.pkgId}"></p>
			        </c:forEach>
			        <c:forEach var="list" items="${list}">
			            <tr data-pkgid="${list.pkgId}" id="data-raw" class="data-raw" data-value="${list.difficulty }">
			                <td><input type="checkbox" name="check" value="check" class="check"></td>
			                <td style="display: none" id="listpkgId">${list.pkgId}</td>
			                <td>${list.pkgName}</td>
			                <td>${list.personnel}</td>
			                <td>${list.fixedPrice}</td>
			                <td class="list_finalPrice">${list.finalPrice}</td>
			                <td>${list.difficulty}</td>
			                <td>${list.pkgContent}</td>
			                <%-- <td style="display: none">${sessionScope.member.memberid }</td> --%>
			            </tr>
			        </c:forEach>
			    </tbody>
			</table>
			<nav aria-label="Page navigation example" id="pageNavi">
					
				  	</nav>
				  	
			<br>
				 <button id="reqSubscribe">구독 신청</button>
				<!--<form method="post" action="/kakaoPay">
    				<button>카카오페이로 결제하기</button>
				</form> -->
			</div>
		</div>
				<!--  배너 -->
				<div class='banner' >
					<%@include file="../header/banner.jsp" %>
				</div>
		
		</div>
	</div>
<%-- 	카카오페이 결제가 정상적으로 완료되었습니다.
 
결제일시:     [[${info.approved_at}]]<br/>
주문번호:    [[${info.partner_order_id}]]<br/>
상품명:    [[${info.item_name}]]<br/>
상품수량:    [[${info.quantity}]]<br/>
결제금액:    [[${info.amount.total}]]<br/>
결제방법:    [[${info.payment_method_type}]]<br/>
<h2>[[${info}]]</h2> --%>

<%-- <%@include file="../header/footer.jsp" %> --%>
	
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$("#check_module").click(function () {
	var checkedData = [];

    $('input[name="check"]:checked').each(function() {
        var $row = $(this).closest('tr');
        var rowData = {
        	pkgId: $row.find('td:eq(1)').text(),
            pkgName: $row.find('td:eq(2)').text(),
            Personnel: $row.find('td:eq(3)').text(),
            fixedPrice: $row.find('td:eq(4)').text(),
            finalPrice: $row.find('td:eq(5)').text(),
            difficulty: $row.find('td:eq(6)').text(),
            pkgContent: $row.find('td:eq(7)').text(),
            //memberID : $row.find('td:eq(8)').text()
        };
        checkedData.push(rowData);
    });

    console.log(checkedData);
    
   /* $.ajax({
        url: '/kakaoPay',
        type: 'POST',
        data: JSON.stringify(checked_Data),
        contentType: "application/json",
        dataType: "json",
        success: function(response) {
        	console.log('데이터 전달 성공')
            //alert('성공');
            //console.log(response);
        },
        error: function(error) {
            //alert('실패');
            //console.error(error);
        }
    }); */
    $.ajax({
        url: '/kakaoPay',
        type: 'POST',
        //data: JSON.stringify(checked_Data), // 데이터를 JSON 문자열로 직렬화
        //contentType: MediaType.APPLICATION_JSON_UTF8_VALUE, // Content-Type 설정
        //data: $.param({ checkedData: JSON.stringify(checked_Data) }), 
        data: {checkedData : checkedData}, 
        //contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        dataType: "json", // 서버에서 반환하는 데이터 형식 (옵션)
        success: function(response) {
            console.log('데이터 전달 성공')
            // 성공 처리 로직 추가
        },
        error: function(error) {
            console.log('데이터 전달 실패')
            // 실패 처리 로직 추가
        }
    });
	
		var IMP = window.IMP; // 생략가능
		IMP.init('imp58336322'); 
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: '주문명 : 아메리카노',
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: 2000,
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name: '이름',
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_postcode: '123-456',
			}, function (rsp) {
				console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount;
				// success.submit();
				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
				// 자세한 설명은 구글링으로 보시는게 좋습니다.
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
</script>
<script type="text/javascript">

	//fetch()
	//.then((response) => response.json())
  	//.then((data) => console.log(data))
  	
	$(document).ready(function() {
		$('input[type="checkbox"][name="check"]').click(function(){
			 
			if($(this).prop('checked')){
		 
				$('input[type="checkbox"][name="check"]').prop('checked',false);
			 
			    $(this).prop('checked',true);
			 
			 }
		});
	    
	    $('.check').prop('disabled', function () {
	    
	    var pkgIdValues = []; // 데이터 속성 값을 저장할 배열을 만듭니다.

	    // 여러 개의 요소를 선택합니다.
	    var pkgIdItems = document.querySelectorAll('#pkgIdItem');	//구독한 컨텐츠의 아이디

	    // 각 요소의 데이터 속성 값을 배열에 저장합니다.
	    pkgIdItems.forEach(function (element) {
	        var pkgIdItemValue = element.getAttribute('data-value');
	        pkgIdValues.push(pkgIdItemValue); // 배열에 값을 추가합니다.
	    });
		console.log('pkgIdValues : ' , pkgIdValues);
		
	    	var listpkgId = $(this).closest('tr').data('pkgid'); // 현재 행의 pkgId 값을 가져옵니다.
			console.log('listpkgId : ' , listpkgId);
	        
	        // pkgIdValues 배열을 순회하면서 현재 행의 pkgId와 비교합니다.
	        for (var i = 0; i < pkgIdValues.length; i++) {
	            if (listpkgId === pkgIdValues[i]) {
	                return true; // 현재 행의 pkgId가 배열에 포함된 경우 checkbox를 비활성화합니다.
	            }
	        }
	        
	        return false; // 현재 행의 pkgId가 배열에 포함되지 않은 경우 checkbox를 활성화합니다.
	    });
	    
		const dataRows = document.querySelectorAll("tr.data-raw");
		$('#searchButton').click(function() {
			console.log('#searchButton 버튼 클릭');
			$('tr.data-raw').hide();
			
			//난이도와 검색어에 해당하는 데이터 정렬
			const choiceDifficulty = document.getElementById('choiceDifficulty').value; // 선택한 값을 저장
			console.log('choiceDifficulty : ' , choiceDifficulty);
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
		            pkgContent: $row.find('td:eq(7)').text(),
		            //memberID : $row.find('td:eq(8)').text()
		        };
		        checked_Data.push(rowData);
		    }); //endpoint $('input[name="check"]:checked').each(function()

		    console.log(checked_Data);
		    
		   $.ajax({
		        url: '/geomin/subscribe/searchContent',
		        type: 'POST',
		        data: JSON.stringify(checked_Data),
                contentType: "application/json",
                dataType: "json",
		        success: function(data) {
		        	if(data == 1){ 
    	        		alert('구독 신청이 완료되었습니다.');
    	        		if (confirm("학습 그룹을 등록하시겠습니까?")) {
    	        			location.href = "../subscribe/subscribeSearchContent"
    	        		}else{
    	        			location.href = "../subscribe/subscribeContent"
    	        		}
    	        		
 		            } else {
 		            	console.log('처리가 완료되지 못하였습니다.');
 		            }
    	        }
		    });//endpoint $.ajax
		}); //endpoint #reqSubscribe
	}); //endpoint $(document).ready
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
	</script>
</html>