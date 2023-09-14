<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
</style>    	
</head>
<body>
<div id='container'>
	<%@include file="../header/header.jsp" %>
	
	<div id='section'>
            <div class='subnavi'>
            	<ul>
            		<li><b>강사마당</b></li>
                    <li><label style="cursor:pointer;"><a id="subnavi1">학습 그룹 등록</a></label></li>
                   	<li><label style="cursor:pointer;"><a id="subnavi2">그룹 가입 승인</a></label></li>
                   	<li><label style="cursor:pointer;"><a id="subnavi3">숙제 전송</a></label></li>
                   	<li><label style="cursor:pointer;"><a id="subnavi4">숙제 평가</a></label></li>
               	</ul>
				
            </div>
            <%-- <label>Title</label> <input name='title' value='<c:out value = "${board.title}" />' readonly="readonly"> --%>
            <div class='content'>
            <c:forEach items="${list1}" var="list1">
            	<%-- <c:if test ="${list1.pkgName == pkgName}"> --%>
            		<div style="display: none;">
            			<label>컨텐츠 아이디 : </label>
            			<input name='pkgId' id = "pkgId" value='<c:out value = "${list1.pkgId}" />' readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>그룹명 : </label>
            			<input type="text" id="groupid" name = "groupid" placeholder="그룹명을 입력해 주세요" ><input type='button' id='groupidCheck' name='groupidCheck'  value='중복확인버튼'>
            			<div id='result'></div>
            		</div>
            		<div>
            			<label>패키지명 : </label>
            			<input name='pkgName' value='<c:out value = "${list1.pkgName}" />' readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>학습 가능 인원 : </label>
            			<input type="text" id='groupMem'  name='groupMem' placeholder="인원 수 적기"> 명 <br>
            			<p>총 학습 가능 인원은 ${list1.personnel}명 이고, 학습 중인 총 인원은 ${list1.totalgroupMem}명으로, 최대 ${list1.possiblegroupMem }명을 입력 할 수 있어요.</p>
            			<div id='grouppersonError'></div>
            		</div>
            		<div style="display: none"><!--  -->
            			<label>최대 학습 가능 인원 : </label>
            			<input type="text" id='maxgroupperson' name='maxgroupperson' data-value="${list1.personnel}" readonly="readonly" disabled="disabled">value='<c:out value = "${list1.personnel}" />' 명
            		</div>
            		<div style="display: none"><!--  -->
            			<label>학습 가능 인원 : </label>
            			<input type="text" id='possiblegroupMem' name='possiblegroupMem' data-value="${list1.possiblegroupMem}" readonly="readonly" disabled="disabled">value='<c:out value = "${list1.possiblegroupMem}" />' 명
            		</div>
            		<div>
            			<label>학습 수준 : </label>
            			<input name='difficulty' value='<c:out value = "${list1.difficulty}" />' readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>구독 날짜 : </label>
            			<input name='subsDate' value='<c:out value = "${list1.subsDate}" />' readonly="readonly" disabled="disabled">
            		</div>
					<div>
						<label>학습 기간 : 최대 3개월</label> 
							<select id="select_yearB" class= "select_yearB"></select>
							<select id="select_monthB" class= "select_monthB"></select>
							<select id="select_dayB" class= "select_dayB"></select>
						
							~
						
							<select id="select_yearA" class= "select_yearA" ></select>
							<select id="select_monthA" class= "select_monthA"></select>
							<select id="select_dayA" class= "select_dayA"></select>
						</div>
            		<div>
						<label>학습 내용 : </label>
            			<input name='content' value='<c:out value = "${list1.pkgContent}" />' readonly="readonly" disabled="disabled">
            		</div>
				<%-- </c:if> --%>
			</c:forEach>
			
			
			
			 <c:if test="${empty pkgName}">
               	 패키지 선택 : 
               	 <select id="select_package">
        			<option selected="selected">패키지 선택</option>
        			<c:forEach items="${list2}" var="list2">
            			<option class="optPkgName">${list2.pkgName}</option>
        			</c:forEach>
    			</select>
    			<br>
               	학습 가능 인원 : <span id="personnel2"></span>명  / 등록 가능 인원 : <span id="possiblegroupMem2"></span> 명 
               	<br> 
               	 	<br>
               	 	<div> <!-- style="display: none;" -->
            			<label>컨텐츠 아이디 : </label>
            			<input name='pkgId' id = "pkgId2" value='<c:out value = "${list3.pkgId}" />' readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>그룹명 : </label>
            			<input type="text" id="groupid2" name = "groupid" placeholder="그룹명을 입력해 주세요" ><input type='button' id='groupidCheck2' name='groupidCheck'  value='중복확인버튼'>
            			<!-- <div id='result'>아이디를 확인해주세요.</div> -->
            			<div id='result'></div>
            		</div>
            		<div>
            			<label>패키지명 : </label>
            			<input name='pkgName' id ='pkgName2' value='<c:out value = "${list3.pkgName}" />' readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>학습 가능 인원 : </label>
            			<input type="text" id='groupMem2'  name='groupMem' placeholder="인원 수 적기"> 명 <br>
            			<%-- <p>총 학습 가능 인원은 ${list3.personnel}명 이고, 학습 중인 총 인원은 ${list3.totalgroupMem}명으로, 최대 ${list3.possiblegroupMem }명을 입력 할 수 있습니다.</p> --%>
            			<div id='grouppersonError2'></div>
            		</div>
            		<div>
            			<label>학습 수준 : </label>
            			<input name='difficulty' id = "difficulty2" value='<c:out value = "${list3.difficulty}" />' readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>구독 날짜 : </label>
            			<input name='subsDate' id="subsDate2" value='<c:out value = "${list3.subsDate}" />' readonly="readonly" disabled="disabled">
            		</div>
					<div>
						<label>학습 기간 : 최대 3개월</label> 
							<select id="select_yearB" class= "select_yearB"></select>
							<select id="select_monthB" class= "select_monthB"></select>
							<select id="select_dayB" class= "select_dayB"></select>
						
							~
						
							<select id="select_yearA" class= "select_yearA" ></select>
							<select id="select_monthA" class= "select_monthA"></select>
							<select id="select_dayA" class= "select_dayA"></select>
						</div>
            		<div>
						<label>학습 내용 : </label>
            			<input name='content' id="pkgContent2" value='<c:out value = "${list3.pkgContent}" />' readonly="readonly" disabled="disabled">
            		</div>
             </c:if>
            <br>
            	<button id="regStudy">학습그룹 등록</button>
			</div>
            	<div class='banner'></div>
    </div>
</div>	
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	var model = {};
	if (model.list1.pkgName !== null) {
	//1-1. 중복 체크
	$("#groupidCheck").click(function(){
		let groupid = document.getElementById('groupid').value;
		console.log('groupid : ' , groupid);
		
		if(groupid.length == 0){
			$('#result').text("공백은 허용되지 않습니다");
			$("#result").attr("style", "color:#f00"); 
			return;
		}
		
		$.ajax({
	        url:'/geomin/teacher/groupidCheck', //Controller에서 요청 받을 주소
	        type:'POST', //POST 방식으로 전달
	        data:{groupid : groupid},
	        success:function(data){ //컨트롤러에서 넘어온 cnt값을 받는다 
	        	console.log('cnt : ' , data);
	            if(data == 1){ //cnt가0이 아니면(=1일 경우) -> 사용 불가능한 아이디 
	                $('#result').text("이미 사용중인 그룹명 입니다."); 
	                $("#result").attr("style", "color:#f00"); 
	            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	            	$('#result').text("사용가능한 그룹명 입니다."); 
	            	$("#result").attr("style", "color:#00f");
	            }
	        }
	    });//$.ajax
	})//#groupidCheck
	
	//1-2. 인원 수 유효성 검사
    const groupMem = document.getElementById("groupMem");		//사용자가 입력한 값
    const groupMemValue = groupMem.value;
    const possiblegroupMem = document.getElementById("possiblegroupMem");
    const possiblegroupMemValue = possiblegroupMem.value;
    const personErrorElement = document.getElementById("grouppersonError");
    const regGroupperson = /^[0-9]+$/;
    
    groupMem.addEventListener('input', function () {
    	hideErrorMessage(personErrorElement);
	});
	 
	groupMem.addEventListener('focusout', function () {
	    const groupMemValue = parseInt(groupMem.value.trim());
	    console.log("groupMemValue : " , groupMemValue);
	    const possiblegroupMemValue = parseInt(possiblegroupMem.getAttribute("data-value"));
	    console.log("possiblegroupMemValue : " , possiblegroupMemValue);
	    
	    //빈칸일 경우 아무것도 출력X
	    if (groupMemValue.length === 0) {
	        return;
	    }
	    
	    if (possiblegroupMemValue.length === 0){
	    	return;
	    }
	    
	    if (!regGroupperson.test(groupMem.value)) {
	        displayErrorMessage(personErrorElement, "숫자만 입력 가능합니다.");
	        return;
	    }

	    if(groupMemValue > possiblegroupMemValue){
	    	displayErrorMessage(personErrorElement, "학습 가능한 인원을 초과하였습니다.");
	    	return;
		}
	});//groupMem.addEventListener
    
	function displayErrorMessage(element, message) {
	    element.textContent = message;
	    element.style.color = "#f00";
	}
	function hideErrorMessage(element) {
	    element.textContent = "";
	}
	}// endpoint if(model.list1.pkgName !== null)
	
	//2-1. 셀렉트 및 인풋 데이터 불러오기
    $("#select_package").change(function() {
        // 선택된 option 요소의 값을 가져옵니다.
       var pkgName = $(this).val();
       console.log('pkgName : ' , pkgName);
       
       $.ajax({
    	   url: "/geomin/teacher/groupRegist2",
    	   type : 'POST',
    	   data : {pkgName : pkgName},
    	   success : function(data) {
    		   console.log(data);
    		   var list3 = data[0];
    		   //console.log("ListL2.groupId");
    		   $('#pkgId2').val(list3.pkgId); // 예시로 pkgId 필드 업데이트
    		   $('#pkgName2').val(list3.pkgName); // 예시로 pkgName 필드 업데이트
    		   $('#difficulty2').val(list3.difficulty);
    		   $('#pkgContent2').val(list3.pkgContent);
    		   $('#subsDate2').val(list3.subsDate);
    		   $('#personnel2').text(list3.personnel);
    		   $('#possiblegroupMem2').text(list3.possiblegroupMem);
    	   }
       });
    }); //#select_package
	
  //2-2. 중복처리
	$("#groupidCheck2").click(function(){
		let groupid2 = document.getElementById('groupid2').value;
		console.log('groupid2 : ' , groupid2);
		
		if(groupid2.length == 0){
			$('#result').text("공백은 허용되지 않습니다");
			$("#result").attr("style", "color:#f00"); 
			return;
		}
		
		$.ajax({
	        url:'/geomin/teacher/groupidCheck', //Controller에서 요청 받을 주소
	        type:'POST', //POST 방식으로 전달
	        data:{groupid : groupid2},
	        success:function(data){ //컨트롤러에서 넘어온 cnt값을 받는다 
	        	console.log('cnt : ' , data);
	            if(data == 1){ //cnt가0이 아니면(=1일 경우) -> 사용 불가능한 아이디 
	                $('#result').text("이미 사용중인 그룹명 입니다."); 
	                $("#result").attr("style", "color:#f00"); 
	            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	            	$('#result').text("사용가능한 그룹명 입니다."); 
	            	$("#result").attr("style", "color:#00f");
	            }
	        }
	    });//$.ajax
	})//#groupidCheck2
    
	//2-3. 인원 수 유효성 검사
    const groupMem2 = document.getElementById("groupMem2");		//사용자가 입력한 값
    const groupMemValue2 = groupMem2.value;
    const possiblegroupMem2 = document.getElementById("possiblegroupMem2");
    const possiblegroupMemValue2 = possiblegroupMem2.value;
    const personErrorElement2 = document.getElementById("grouppersonError2");
    
    groupMem2.addEventListener('input', function () {
    	hideErrorMessage(personErrorElement2);
	});
	 
    groupMem2.addEventListener('focusout', function () {
	    const groupMemValue2 = parseInt(groupMem2.value.trim());
	    console.log("groupMemValue2 : " , groupMemValue2);
	    const possiblegroupMemValue2 = parseInt(possiblegroupMem2.getAttribute("data-value"));
	    console.log("possiblegroupMemValue2 : " , possiblegroupMemValue2);
	    
	    //빈칸일 경우 아무것도 출력X
	    if (groupMemValue2.length === 0) {
	        return;
	    }
	    
	    if (possiblegroupMemValue2.length === 0){
	    	return;
	    }
	    
	    if (!regGroupperson.test(groupMem2.value)) {
	        displayErrorMessage(personErrorElement2, "숫자만 입력 가능합니다.");
	        return;
	    }

	    if(groupMemValue2 > possiblegroupMemValue2){
	    	displayErrorMessage(personErrorElement2, "학습 가능한 인원을 초과하였습니다.");
	    	return;
		}
	});//groupMem.addEventListener
    
    
    
    var start_year = "2023"; // 시작할 년도
    var today = new Date();
    var today_year = today.getFullYear();
    var indexB = 0;
    var indexA = 0;
    for (var y = start_year; y <= today_year; y++) {
        document.getElementById('select_yearB').options[indexB] = new Option(y, y);
        document.getElementById('select_yearA').options[indexA] = new Option(y, y);
        indexB++;
        indexA++;
    }

    indexB = 0;
    indexA = 0;
    for (var m = 1; m <= 12; m++) {
        document.getElementById('select_monthB').options[indexB] = new Option(m, m);
        document.getElementById('select_monthA').options[indexA] = new Option(m, m);
        indexB++;
        indexA++;
    }

    // 오늘의 날짜를 기본값으로 설정
    var today_day = today.getDate();
    $('#select_yearB').val(today_year);
    $('#select_monthB').val(today.getMonth() + 1); // 월은 0부터 시작하므로 1을 더해줍니다.
    $('#select_dayB').val(today_day);

    $('#select_yearA').val(today_year);
    $('#select_monthA').val(today.getMonth() + 1);
    $('#select_dayA').val(today_day);

    $('#select_yearB, #select_monthB').on('change', function () {
        lastdayB();
    });

    $('#select_yearA, #select_monthA').on('change', function () {
        lastdayA();
    });

    lastdayB();
    lastdayA();

function lastdayB() {
    var yearB = $('#select_yearB').val();
    var monthB = $('#select_monthB').val();
    var dayB = new Date(new Date(yearB, monthB, 1) - 86400000).getDate();
    var $selectDayB = $('#select_dayB');
    var dayindex_lenB = $selectDayB.find('option').length;

    if (dayB > dayindex_lenB) {
        for (var i = dayindex_lenB + 1; i <= dayB; i++) {
            $selectDayB.append($('<option>', {
                value: i,
                text: i
            }));
        }
    } else if (dayB < dayindex_lenB) {
        $selectDayB.find('option:gt(' + (dayB - 1) + ')').remove();
    }
}//lastdayB()

function lastdayA() {
    var yearA = $('#select_yearA').val();
    var monthA = $('#select_monthA').val();
    var dayA = new Date(new Date(yearA, monthA, 1) - 86400000).getDate();
    var $selectDayA = $('#select_dayA');
    var dayindex_lenA = $selectDayA.find('option').length;

    if (dayA > dayindex_lenA) {
        for (var i = dayindex_lenA + 1; i <= dayA; i++) {
            $selectDayA.append($('<option>', {
                value: i,
                text: i
            }));
        }
    } else if (dayA < dayindex_lenA) {
        $selectDayA.find('option:gt(' + (dayA - 1) + ')').remove();
    }
}//lastdayA()

	$('#regStudy').click(function() {
		const groupid = document.getElementById('groupid').value;
		const groupMem = document.getElementById('groupMem').value;
		const pkgId = document.getElementById('pkgId').value;
		
		var yearB = document.getElementById('select_yearB').value;
		var monthB = document.getElementById('select_monthB').value;
		var dayBB = document.getElementById('select_dayB').value;
		const dateB = new Date(yearB, monthB - 1, dayBB);
		const totalDateB = dateB.toISOString().slice(0, 10);

		var yearA = document.getElementById('select_yearA').value;
		var monthA = document.getElementById('select_monthA').value;
		var dayAA = document.getElementById('select_dayA').value;
		const dateA = new Date(yearA, monthA - 1, dayAA);
		const totalDateA = dateA.toISOString().slice(0, 10);
		
		const timeDiff = dateA - dateB;
    	const daysDiff = timeDiff / (1000 * 3600 * 24);

    	if(groupMem == null){
    		alert('인원 수를 입력해주세요')
    		return;
    	}
    	
    	// 3개월은 대략 90일로 가정
    	const threeMonthsInDays = 90;

    	if (daysDiff > threeMonthsInDays) {
        	alert('학습기간은 최대 3개월을 넘을 수 없습니다.');
        	return; // 간격이 3개월을 넘으면 AJAX 요청을 보내지 않고 종료
    	}
		
			const groupData = [];
			const rowData = {
				groupid: groupid,
				pkgId : pkgId,
				groupMem : groupMem,
				studyStartDate : totalDateB,
				studyEndDate : totalDateA
			}
			groupData.push(rowData);

			console.log('groupData : ' , groupData);

			$.ajax({
				url: '/geomin/teacher/groupRegist',
				type: 'POST',
				data: JSON.stringify(groupData),
				contentType: "application/json",
				dataType: "json",
				success: function(response) {
		    		alert('성공');
		    		//console.log(response);
		    		location.href = "../subscribe/subscribeSearchContent";
				},
				error: function(error) {
		    		//alert('실패');
		    		location.href = "../subscribe/subscribeSearchContent";
				}
			});
		});	//endpoint $('#regStudy').click
	
		
	
	
		
	    
	    
	   /*  const groupMem2 = document.getElementById("groupMem2");		//사용자가 입력한 값
	    const groupMem2Value = groupMem2.value;
	    const possiblegroupMem2 = document.getElementById("possiblegroupMem2");
	    
	    
	    const possiblegroupMemValue2 = parseInt(possiblegroupMem2.getAttribute("data-value"));	//DB에서 불러온 값(최종)
	    
	    //console.log('possibleCurgroup : ' , possibleCurgroup);
	    const regGroupperson = /^[0-9]+$/;
	    
		const personErrorElement = document.getElementById("grouppersonError");
		const personErrorElement2 = document.getElementById("grouppersonError2");
		//const personErrorElement2 = document.getElementById("grouppersonError2");

		
		
		
		
		if(groupMem2 != null){
			groupMem2.addEventListener('input', function () {
		    	hideErrorMessage(personErrorElement2);
			});
		}
		// 
		groupMem2.addEventListener('focusout', function () {
			console.log('possiblegroupMemValue : ' , possiblegroupMemValue);
			console.log('possiblegroupMemValue2 : ' , possiblegroupMemValue2);
		    const groupMemValue2 = parseInt(groupMem2.value.trim()); //내가 입력한 값(최종)
		    console.log('groupMemValue2 : ' , groupMemValue2);
		    //const grouppersonValue2 = groupperson2.value.trim();
		    
		    //빈칸일 경우 아무것도 출력X
		    if (groupMemValue2.length === 0) {
		        return;
		    }
		    
		    if (possiblegroupMemValue2.length === 0){
		    	return;
		    }
		    
		    if (!regGroupperson.test(groupMem2.value)) {
		        displayErrorMessage(personErrorElement2, "숫자만 입력 가능합니다.");
		        return;
		    }

		    if(groupMemValue2 > possiblegroupMemValue2){
		    	console.log('groupMemValue2 : ' , groupMemValue2);
		    	console.log('possiblegroupMemValue2 : ' , possiblegroupMemValue2);
		    	displayErrorMessage(personErrorElement2, "학습 가능한 인원을 초과하였습니다.");
		    	return;
			}
		});//groupMem.addEventListener
		
		function displayErrorMessage(element, message) {
		    element.textContent = message;
		    element.style.color = "#f00";
		}
		function hideErrorMessage(element) {
		    element.textContent = "";
		} */
		
		//if(groupMem2 != null)
});


</script>




<script>
/* $('#regStudy').click(function() {
const groupid = document.getElementById('groupid').value;
const groupperson = document.getElementById('groupperson').value;
const pkgId = document.getElementById('pkgId').value;
console.log('pkgId : ' , pkgId);

var yearB = document.getElementById('select_yearB').value;
var monthB = document.getElementById('select_monthB').value;
var dayBB = document.getElementById('select_dayB').value;
const dateB = new Date(yearB, monthB - 1, dayBB);
const totalDateB = dateB.toISOString().slice(0, 10);
console.log('dateB : ' , dateB);
//console.log('formattedDateB : ' , formattedDateB);

var yearA = document.getElementById('select_yearA').value;
var monthA = document.getElementById('select_monthA').value;
var dayAA = document.getElementById('select_dayA').value;
const dateA = new Date(yearA, monthA - 1, dayAA);
const totalDateA = dateA.toISOString().slice(0, 10);
console.log('dateA : ' , dateA);
//console.log('formattedDateA : ' , formattedDateA);
	
	const groupData = [];
	const rowData = {
		groupid: groupid,
		pkgId : pkgId,
		Personnel : groupperson,
		studyStartDate : totalDateB,
		studyEndDate : totalDateA
	}
	groupData.push(rowData);

	console.log('groupData : ' , groupData);

	$.ajax({
		url: '/geomin/teacher/groupRegist',
		type: 'POST',
		data: JSON.stringify(groupData),
		contentType: "application/json",
		dataType: "json",
		success: function(response) {
    		alert('성공');
    		//console.log(response);
		},
		error: function(error) {
    		alert('실패');
    		//console.error(error);
		}
	});

}); */

/*
 			window.onload = disablePreviousDates;
			// 현재 날짜 가져오기
			const currentDate = new Date();

			// 이전 기간을 선택하지 못하게 하는 함수
			function disablePreviousDates() {
			    const yearBSelect = document.getElementById('select_yearB');
			    const monthBSelect = document.getElementById('select_monthB');
			    const dayBSelect = document.getElementById('select_dayB');

			    // 현재 연도 가져오기
			    const currentYear = currentDate.getFullYear();

			    // 현재 월 가져오기 (0부터 시작하므로 +1 해줌)
			    const currentMonth = currentDate.getMonth() + 1;

			    // 현재 일 가져오기
			    const currentDay = currentDate.getDate();

			    // 이전 연도, 월, 일을 선택하지 못하게 처리
			    for (let year = currentYear; year >= 1900; year--) {
			        if (yearBSelect) {
			            const option = document.createElement('option');
			            option.value = year;
			            option.text = year;
			            yearBSelect.add(option);
			            if (year === currentYear) {
			                yearBSelect.value = currentYear;
			            }
			        }
			    }

			    for (let month = 1; month <= 12; month++) {
			        if (monthBSelect) {
			            const option = document.createElement('option');
			            option.value = month;
			            option.text = month;
			            monthBSelect.add(option);
			            if (month === currentMonth) {
			                monthBSelect.value = currentMonth;
			            }
			        }
			    }

			    for (let day = 1; day <= 31; day++) {
			        if (dayBSelect) {
			            const option = document.createElement('option');
			            option.value = day;
			            option.text = day;
			            dayBSelect.add(option);
			            if (day === currentDay) {
			                dayBSelect.value = currentDay;
			            }
			        }
			    }
			} 
 */
 /* lastdayB();
	function lastdayB(){ //년과 월에 따라 마지막 일 구하기 
		var yearB = document.getElementById('select_yearB').value;
		var monthB = document.getElementById('select_monthB').value;
		var dayB = new Date(new Date(yearB,monthB,1)-86400000).getDate();
		var dayBB = document.getElementById('select_yearB').value;
	
		var dayindex_lenB=document.getElementById('select_dayB').length;
		if(dayB>dayindex_lenB){
			for(var i=(dayindex_lenB+1); i<=dayB; i++){
				document.getElementById('select_dayB').options[i-1] = new Option(i, i);
			}
		}
		else if(dayB<dayindex_lenB){
			for(var i=dayindex_lenB; i>=dayB; i--){
				document.getElementById('select_dayB').options[i]=null;
			}
		}
	} */

	/* lastdayA();
	function lastdayA(){ //년과 월에 따라 마지막 일 구하기 
		var yearA = document.getElementById('select_yearA').value;
		var monthA = document.getElementById('select_monthA').value;
		var dayA = new Date(new Date(yearA,monthA,1)-86400000).getDate();

		var dayindex_lenA=document.getElementById('select_dayA').length;
		if(dayA>dayindex_lenA){
			for(var i=(dayindex_lenA+1); i<=dayA; i++){
				document.getElementById('select_dayA').options[i-1] = new Option(i, i);
			}
		}
		else if(dayA<dayindex_lenA){
			for(var i=dayindex_lenA; i>=dayA; i--){
				document.getElementById('select_dayA').options[i]=null;
			}
		}
	} */
	
	
	
	/* var pkgName = document.getElementById('pkgNameElement').getAttribute('data-pkgName');
    document.getElementById('receivedData').textContent = "Received Data: " + pkgName; */
	
	//var pkgName = document.getElementById('pkgNameElement').getAttribute('data-pkgName');
	//console.log('pkgName : ' , pkgName);
	//const pkgName = document.getElementById('pkgName').value;
	
	<%-- <c:forEach items="${list1}" var="list1">
            	<c:if test ="${list1.pkgName == list.pkgName}"> --%>
            		<%-- <div style="display: none;">
            			<label>컨텐츠 아이디 : </label>
            			<input name='pkgId' id = "pkgId2" value='<c:out value = "${list1.pkgId}" />' readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>그룹명 : </label>
            			<input type="text" id="groupid2" name = "groupid" placeholder="그룹명을 입력해 주세요" ><input type='button' id='groupidCheck' name='groupidCheck'  value='중복확인버튼'>
            			<div id='result'></div>
            		</div>
            		<div>
            			<label>패키지명 : </label>
            			<input name='pkgName' id="pkgName2" value='<c:out value = "${list1.pkgName}" />' readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>학습 가능 인원 : </label>
            			<input type="text" id='groupperson2'  name='groupperson' placeholder="인원 수 적기"> 명 / ${list1.personnel}명
            			<div id='grouppersonError'></div>
            		</div>
            		<div style="display: none"><!--  -->
            			<label>최대 학습 가능 인원 : </label>
            			<input type="text" id='maxgroupperson2' name='maxgroupperson' data-value="${list1.personnel}" readonly="readonly" disabled="disabled">value='<c:out value = "${list1.personnel}" />' 명
            		</div>
            		<div>
            			<label>학습 수준 : </label>
            			<input name='difficulty' id="difficulty2"value='<c:out value = "${list1.difficulty}" />' readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>구독 날짜 : </label>
            			<input name='subsDate' id="subsDate2"value='<c:out value = "${list1.subsDate}" />' readonly="readonly" disabled="disabled">
            		</div>
					<div>
						<label>학습 기간 : 최대 3개월</label> 
							<select id="select_yearB" class= "select_yearB" onchange="javascript:lastdayB();"></select>
							<select id="select_yearB" class= "select_yearB"></select>
							<select id="select_monthB" class= "select_monthB" onchange="javascript:lastdayB();"></select>
							<select id="select_monthB" class= "select_monthB"></select>
							<select id="select_dayB" class= "select_dayB"></select>
						
							~
						
							<select id="select_yearA" class= "select_yearA" ></select>
							<select id="select_monthA" class= "select_monthA"></select>
							<select id="select_yearA" class= "select_yearA" onchange="javascript:lastdayA();"></select>
							<select id="select_monthA" class= "select_monthA" onchange="javascript:lastdayA();"></select>
							<select id="select_dayA" class= "select_dayA"></select>
						</div>
            		<div>
						<label>학습 내용 : </label>
            			<input name='content' id = "content2" value='<c:out value = "${list1.pkgContent}" />' readonly="readonly" disabled="disabled">
            		</div> --%>
				<%--</c:if>
			 </c:forEach> --%>
			 		<%-- <div style="display: none;">
            			<label>컨텐츠 아이디 : </label>
            			<input name='pkgId' id = "pkgId2" readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>그룹명 : </label>
            			<input type="text" id="groupid2" name = "groupid" placeholder="그룹명을 입력해 주세요" ><input type='button' id='groupidCheck' name='groupidCheck'  value='중복확인버튼'>
            			<div id='result'></div>
            		</div>
            		<div>
            			<label>패키지명 : </label>
            			<input name='pkgName' id="pkgName2" readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>학습 가능 인원 : </label>
            			<input type="text" id='groupperson2'  name='groupperson' placeholder="인원 수 적기"> 명 / ${list1.personnel}명
            			<div id='grouppersonError'></div>
            		</div>
            		<div style="display: none"><!--  -->
            			<label>최대 학습 가능 인원 : </label>
            			<input type="text" id='maxgroupperson2' name='maxgroupperson' readonly="readonly" disabled="disabled">value='<c:out value = "${list1.personnel}" />' 명
            		</div>
            		<div>
            			<label>학습 수준 : </label>
            			<input name='difficulty' id="difficulty2"  readonly="readonly" disabled="disabled">
            		</div>
            		<div>
            			<label>구독 날짜 : </label>
            			<input name='subsDate' id="subsDate2" readonly="readonly" disabled="disabled">
            		</div>
					<div>
						<label>학습 기간 : 최대 3개월</label> 
							<!-- <select id="select_yearB" class= "select_yearB" onchange="javascript:lastdayB();"></select> -->
							<select id="select_yearB" class= "select_yearB"></select>
							<!-- <select id="select_monthB" class= "select_monthB" onchange="javascript:lastdayB();"></select> -->
							<select id="select_monthB" class= "select_monthB"></select>
							<select id="select_dayB" class= "select_dayB"></select>
						
							~
						
							<select id="select_yearA" class= "select_yearA" ></select>
							<select id="select_monthA" class= "select_monthA"></select>
							<!-- <select id="select_yearA" class= "select_yearA" onchange="javascript:lastdayA();"></select>
							<select id="select_monthA" class= "select_monthA" onchange="javascript:lastdayA();"></select> -->
							<select id="select_dayA" class= "select_dayA"></select>
						</div>
            		<div>
						<label>학습 내용 : </label>
            			<input name='content' id = "content2" readonly="readonly" disabled="disabled">
            		</div> --%>
	
</script>
</html>