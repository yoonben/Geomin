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
	width: 150px;
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
	width: 150px;
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
	width: 150px;
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

	#delSubscribe{
	height:40px; 
   	width:200px;
   	margin-left:220px;
   	background-color: #FFFFFF;
   	border:1px solid #666666;
   	border-radius: 8px;
   	cursor: pointer;
   	color:#000000;
   	font-size: 16px;
   	font-weight: 600;
   	font-weight: 600;	
}
#delSubscribe:hover{
	height:40px; 
   	width:200px;
   	margin-left:220px;
   	background-color: #002F5A;
   	color:#FFFFFF;
   	border:1px solid #666666;
   	border-radius: 5px;
   	cursor: pointer;
  	font-size: 16px;
  	font-weight: 600;
  	font-weight: 600;
}

	.dayBtn{
	height:30px; 
   	width:60px;
   	margin-left:7px;
   	background-color: #FFFFFF;
   	border:1px solid #666666;
   	border-radius: 8px;
   	cursor: pointer;
   	color:#000000;
   	font-size: 14px;
   	font-weight: 600;	
	}
	.dayBtn:hover{
		height:30px; 
	   	width:60px;
	   	margin-left:7px;
	   	background-color: #002F5A;
	   	color:#FFFFFF;
	   	border:1px solid #666666;
	   	border-radius: 5px;
	   	cursor: pointer;
	  	font-size: 14px;
	  	font-weight: 600;
	}


	#regButton{
		height:30px; 
	   	width:80px;
	   	background-color: #FFFFFF;
	   	border:1px solid #666666;
	   	border-radius: 8px;
	   	cursor: pointer;
	   	color:#000000;
	   	font-size: 15px;
	   	font-weight: 600;	
	}
	#regButton:hover{
		height:30px; 
	   	width:80px;
	   	background-color: #002F5A;
	   	color:#FFFFFF;
	   	border:1px solid #666666;
	   	border-radius: 5px;
	   	cursor: pointer;
	  	font-size: 15px;
	  	font-weight: 600;
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
			
			<div class="content">
					<p id='regTitle'>나의 학습콘텐츠</p>	
		            <hr> 
				<button id="1day" class='dayBtn'>1일 전</button>
				<button id="3day"class='dayBtn'>3일 전</button>
				<button id="1month"class='dayBtn'>1달 전</button>
				<button id="3month"class='dayBtn'>3달 전</button>
				<button id="6month"class='dayBtn'>6달 전</button>
				<button id="1year"class='dayBtn'>1년 전</button>				
				
				<!-- <button id="searchButton">조회</button> -->
				<br><br>
				
				<table id="result-table" class="table" border="1px solid" style="height: 50%; weight: 100%">
				
					<thead>
						<tr  class="table-primary">
							<th>ㅁ</th>
							<th style="display: none;">학습 관리자</th>
							<th>콘텐츠 <br>이름</th>
							<th>콘텐츠 <br>구독날짜</th>
							<th>최대 <br>학습<br>인원</th>
							<th>학습 <br>가능<br>인원</th>
							<th>콘텐츠 <br>최종<br>가격</th>
							<th>학습 <br>난이도</th>
							<th>학습그룹<br> 등록</th>
						</tr>
					</thead>
					
					<tbody>
					<c:forEach var="list" items="${getSubList}">
						<tr id="data-raw" class="data-raw" data-value="${list.subsDate}">
							<td><input type="checkbox" name="check" class="check" value="check"></td>
							<!-- <td><input type="checkbox" name="check" value="check" id="check"></td> -->
							<td style="display: none;">${list.memberID }</td>
							<td class="list_pkgName" id="list_pkgName">${list.pkgName }</td> <!-- ?memberID='memberID22' --> <!-- <a href="geomin/teacher/groupRegist"></a> -->
							<td class="list_subsDate">${list.subsDate }</td>
							<td id = "personnel">${list.personnel}</td>
							<td id = "possiblegroupMem">${list.possiblegroupMem }</td>
							<td>${list.finalPrice }</td>
							<td>${list.difficulty }</td>
							<%-- <td>${list.pkgContent }</td> --%>
							<c:url var="groupRegistURL" value="../teacher/groupRegist">
    							<c:param name="pkgName" value="${list.pkgName}" />
							</c:url>
							<%-- <c:choose>
								<c:when test="${list.groupid == 'NOT GROUP'}">  --%>
									<td><button type='button' id="regButton" name='regButton' onclick='location.href="${groupRegistURL}"'>그룹 등록</button></td>
									<%-- <td><button type='button' id="regButton" name='regButton' onclick='location.href="../teacher/groupRegist?pkgName=${list.pkgName}"'>그룹 등록</button></td> --%>
								<%-- </c:when>
								<c:otherwise>
									<td>등록 완료</td>
								</c:otherwise>
							</c:choose> --%>
						</tr> 
					</c:forEach>
					</tbody>
				</table>
				
				<br>
				
				<button id="delSubscribe">구독 철회</button>
				<!-- <button id="recent">날짜 순서 토글</button> -->
				<!-- <button id="recent">날짜가 최근순</button>
				<button id="oldest">날짜가 오래된순</button> -->
			</div>
		<!--  배너 -->
		<div class='banner' >
			<%@include file="../header/banner.jsp" %>
		</div>
		</div>
	</div>
	
	<%@include file="../header/footer.jsp" %>	
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	/* $("#check").on("change", function () {
		console.log('클릭됨');
        if (this.checked) {
            var $row = $(this).closest("tr"); // 현재 행 선택
            var personnel = $row.find("#personnel").text(); // personnel 데이터 가져오기
            var possiblegroupMem = $row.find("#possiblegroupMem").text(); // possiblegroupMem 데이터 가져오기

            console.log("personnel 값: " + personnel);
            console.log("possiblegroupMem 값: " + possiblegroupMem);
            
            $('#delSubscribe').click(function(){
        		console.log('구독철회 버튼 클릭');
            
            });
        }
    }); */
    $(".check").off("change").on("change", function () {
        console.log('체크박스가 변경되었습니다.');

        if (this.checked) {
            const $row = $(this).closest("tr"); // 현재 행 선택
            const pkgName = $row.find("#list_pkgName").text(); // personnel 데이터 가져오기
            const personnel = $row.find("#personnel").text(); // personnel 데이터 가져오기
            const possiblegroupMem = $row.find("#possiblegroupMem").text(); // possiblegroupMem 데이터 가져오기

            $('#delSubscribe').off("click").click(function(){
                console.log('구독철회 버튼 클릭');
                console.log("pkgName 값 : " + pkgName);
                console.log("personnel 값: " + personnel);
                console.log("possiblegroupMem 값: " + possiblegroupMem);
                
                if(personnel == possiblegroupMem){
                	console.log('같아요');
                	if (confirm("구독을 철회하시겠습니까?")) {
                		$.ajax({
        	    	        url:'/geomin/teacher/groupDelete', 
        	    	        type:'POST', //POST 방식으로 전달
        	    	        data:{pkgName : pkgName},
        	    	        success:function(data){ 
        	    	        	if(data == 1){ 
        	    	        		alert('철회가 완료되었습니다.');
        	    	        		location.href = "../subscribe/subscribeSearchContent"
        	 		            } else {
        	 		            	console.log('처리가 완료되지 못하였습니다.');
        	 		            }
        	    	        }
        	    	    });
                	} else {
                		alert('취소되었습니다.');
                	}
                }
                if(personnel != possiblegroupMem){
                	alert('이미 학습하는 인원이 있는 패키지는 환불이 불가능합니다. 자사의 환불규칙을 확인하시기 바랍니다.')
                }
                
            });
        }
    });
	
	$('input[type="checkbox"][name="check"]').click(function(){
		if($(this).prop('checked')){
			$('input[type="checkbox"][name="check"]').prop('checked',false);
		    $(this).prop('checked',true);
		 }
	});
	
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
    
    
    /* const tableBody = document.querySelector('#result-table tbody');
	const dataRows = Array.from(document.querySelectorAll("tr.data-raw"));
	console.log('dataRows : ' , dataRows);
    $('#recent').click(function () {
    	$('tr.data-raw').hide();
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
    }); */
});
</script>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
	</script>
	
	
</html>