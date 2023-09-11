<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html lang="en">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<head>
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
    	#introduction1{
    		width: 630px;
    		text-align: center;
    	}
    	#introduction1>h3{
    		float: left;
		    width: 310px;
		    font-size: 1.1rem;
		    line-height: 80px;
		    font-weight: 900;
    	}
    	#introduction1>h5{
    		font-size: 0.9rem;
    		line-height: 50px;
    	}
    	/* #introduction1img{
    	
    		float:left;
    		margin-right : 10px;
    		margin-top : 15px;
    		width: 300px;
    	} */
    	#introduction1img{
    	 height:5%;
    	 weight:100%;
    	 margin-bottom:30px;
    	 
    	 }
    	#introduction2{
    		display: none;
    	}


    	
    	.box_title01 {
		    margin-bottom: 24px;
		    width: 500px;
		    border-bottom: 2px solid black;
		}
		

    </style>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    
    window.addEventListener('load', function(){
    	
   	 	const subnavi1 = document.getElementById('subnavi1');
    	const subnavi2 = document.getElementById('subnavi2');
    	const subnavi3 = document.getElementById('subnavi3');
    	const subnavi4 = document.getElementById('subnavi4');
    	let introductionbtn = document.getElementById('introductionbtn');
    	
    	$('#subnavi1').click(function (){
    		console.log('#subnavi1 작동 개시');
    		/* $('#introduction1').show ();
    		$('#introduction2').hide();
    		$('#introduction3').hide();
    		$('#introduction4').hide(); */
    		//location.href="../teacher/groupRegist";
    		redirectToGroupRegist("");
    	});
    	
    	function redirectToGroupRegist(pkgName) {
    	    // pkgName 파라미터를 이용하여 페이지 이동
    	    if (pkgName !== "") {
    	        location.href = `../teacher/groupRegist?pkgName=${pkgName}`;
    	    } else {
    	        location.href = "../teacher/groupRegist";
    	    }
    	}
    	
    	$('#subnavi2').click(function (){
    		console.log('#subnavi2 작동 개시');
    		$('#introduction2').show();
    		$('#introduction1').hide();
    		$('#introduction3').hide();
    		$('#introduction4').hide();
    	});
    	$('#subnavi3').click(function (){
    		console.log('#subnavi3 작동 개시');
    		/* $('#introduction3').show();
    		$('#introduction1').hide();
    		$('#introduction2').hide();
    		$('#introduction4').hide(); */
    		location.href="../teacher/homeworkMain";
    	});
    	$('#subnavi4').click(function (){
    		location.href="../teacher/homeworkEvaluation";
    	});
    	
    	
  	
    	$('#contentSelect').click(function (){
			console.log('#contentSelect 작동 개시');

			console.log('클릭되었어요');
			
			let obj = {
		        	   memberid : document.getElementById('memberid').value
		        }
		        
			console.log(obj);
		
			fetchPost('/geomin/groupidCheck', obj, (map) => {
			
		})
	
	});
    		


    	
    	// 그룹 승인  페이지 
		let contentSelect = document.getElementById('contentSelect');
		let contentList = document.getElementById('contentList');
		
		// contentSelect 엘리먼트에서 옵션 값을 가져와 Set 객체를 생성 (배열에서 중복값 제거)
		let contentSelectOptions = Array.from(contentSelect.options);
		let set = new Set(contentSelectOptions.map(option => option.value));
		
		console.log(set.size);
		console.log(set);
		
		// set을 다시 배열로 변환
		let setAsArray = Array.from(set);
		
		// 기존 옵션 삭제
		contentSelect.innerHTML = '';

		// setAsArray 배열을 사용하여 옵션 생성 및 업데이트
		setAsArray.forEach(optionValue => {
		    let option = document.createElement('option');
		    option.value = optionValue;
		    option.text = optionValue;
		    contentSelect.appendChild(option);
		});
		
			//배열로 변환한 후에 인덱스를 사용 (Set 객체에는 change 이벤트가 없어서 작동X)
			contentSelect.addEventListener('change', function(){
			    let selectedValue = contentSelect.value;
			    console.log('선택된 값:', selectedValue);
			    
			    
			    let obj = {
			        pkgname: selectedValue
			    };
			    
			fetchPost('/geomin/contentId', obj, (map) => {
				
				console.log('map : ', map);
				
				
				// 이 부분은 테이블의 <thead> 부분을 그대로 유지합니다.
				let thead = document.querySelector('.table-success');
				let table = document.querySelector('.table');
				let groupidOutput = document.querySelector('.groupidOutput');
				let personOutput = document.querySelector('.personOutput');
				
			    
				// contentList 요소를 초기화 (이전 데이터를 지움)
		        contentList2.innerHTML = '';

				
		       // 기존의 <thead> 부분을 테이블에 추가합니다.
        		//contentList.appendChild(thead);
		       
		        let selectedData = map.membervo;

		        // selectedData 배열을 이용하여 데이터를 출력 또는 처리
		        selectedData.forEach(membervo => {
		            // membervo에 있는 데이터를 이용하여 필요한 처리 수행
		            let row = document.createElement('tr');

		            // 체크박스 열 추가
		            let checkboxCell = document.createElement('td');
		            checkboxCell.innerHTML = '<input type="checkbox" name="rowCheck">';
		            row.appendChild(checkboxCell);
					
		            // 나머지 열 추가
		            let memberidCell = document.createElement('td');
		            memberidCell.innerHTML = membervo.memberid;
		            row.appendChild(memberidCell);
		            
		            let snameCell = document.createElement('td');
		            snameCell.innerHTML = membervo.sname;
		            row.appendChild(snameCell);

		            let mbirthdateCell = document.createElement('td');
		            mbirthdateCell.innerHTML = membervo.mbirthdate;
		            row.appendChild(mbirthdateCell);

		            let mphoneCell = document.createElement('td');
		            mphoneCell.innerHTML = membervo.mphone;
		            row.appendChild(mphoneCell);

		            let memailCell = document.createElement('td');
		            memailCell.innerHTML = membervo.memail;
		            row.appendChild(memailCell);

		            let groupResDateCell = document.createElement('td');
		            groupResDateCell.innerHTML = membervo.groupResDate;
		            row.appendChild(groupResDateCell);

		            let joinStatusCell = document.createElement('td');
		            joinStatusCell.innerHTML = membervo.joinStatus;
		            row.appendChild(joinStatusCell);

		            contentList2.appendChild(row);
		            
		         
		        });
		     // 기존의 <thead> 부분을 테이블에 추가합니다.
		        contentList2.insertBefore(thead, contentList2.firstChild);

		        // 그룹 선택 버튼을 보이게 함 (마지막에 설정)
		        introductionbtn.style.display = 'block';
		    });

		    // 그룹 선택 버튼을 보이게 함 (선택하기 전에도 설정)
		    introductionbtn.style.display = 'block';
			});    
				/*  기존 코드 
				let selectedData = map.membervo.filter(membervo => membervo.pkgname === selectedValue);

		        // selectedData 배열을 이용하여 데이터를 출력 또는 처리
		        selectedData.forEach(membervo => {
		            // membervo에 있는 데이터를 이용하여 필요한 처리 수행
		            document.getElementById('pkgname').innerHTML = membervo.pkgname;
		            document.getElementById('groupidOutput').textContent  = membervo.groupid;
		            document.getElementById('personOutput').textContent  = membervo.person;
		            document.getElementById('snameOutput').textContent  = membervo.sname;
		            document.getElementById('mbirthdateOutput').textContent  = membervo.mbirthdate;
		            document.getElementById('mphoneOutput').textContent  = membervo.mphone;
		            document.getElementById('memailOutput').textContent  = membervo.memail;
		            document.getElementById('groupResDateOutput').textContent  = membervo.groupResDate;
		            document.getElementById('joinStatusOutput').textContent = membervo.joinStatus;
					}) */
			

		
		
		   
		  // 목록 전체선택 /부분선택
			$(function(){
				var chkObj = document.getElementsByName('rowCheck');
				var rowCnt = chkObj.length;
				
				$("input[name='allCheck']").click(function(){
					var chk_listArr = $("input[name='rowCheck']");
					for(var i=0; i<chk_listArr.length; i++){
						chk_listArr[i].checked = this.checked;
					}
				});
				
				$("input[name='rowCheck']").click(function(){
					if($("input[name='rowCheck']:checked").length == rowCnt){
						$("input[name='allCheck']")[0].checked = true;
					} else {
						$("input[name='allCheck']")[0].checked = false;
					}
				});
			});
		  


				
		        /* 
			$('#introductionbtn').click(function() {
				approveSelected();
				var vo = [];

			    $('input[name="rowCheck"]:checked').each(function() {
			        var rowData = {
				        	groupid		: document.getElementById('groupid').innerHTML,
				            sname		: document.getElementById('snameOutput').innerHTML
			        };
			        vo.push(rowData);
			    });

			    console.log(vo);
			    
			   $.ajax({
			        url: '/geomin/joinStatus',
			        type: 'POST',
			        data: JSON.stringify(vo),
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
			 */
			 
	});
	
	/* $('#introductionbtn').click(function() {
		console.log('introductionbtn 클릭');
   	//그룹 가입 승인 처리
   		var memberidOutput_list = [];
   	$('input[name="rowCheck"]:checked').each(function() {
   		console.log('input[name="rowCheck"]:checked');
   		var $row = $(this).closest('tr');
   		var rowData = {
   				memberidOutput: $row.find('td:eq(1)').text()
   		}
   		memberidOutput_list.push(memberidOutput)
   	});
   		console.log('memberidOutput_list');
	}); */
	
	
	function approveSelected() {
    	var memberidOutput_list = [];
   		$('input[name="rowCheck"]:checked').each(function() {
   			console.log('input[name="rowCheck"]:checked');
   			var $row = $(this).closest('tr');
   			var rowData = {
   					sname: $row.find('td:eq(1)').text()
   			}
   			var rowData2 = {
   					memberid : document.getElementById("memberid").value
   			}
   		memberidOutput_list.push(rowData);
   		memberidOutput_list.push(rowData2);
   	});
   	console.log('memberidOutput_list : ' ,  memberidOutput_list);
   	
    $.ajax({
        url: '/geomin/joinStatus',
        type: 'POST',
        data: JSON.stringify(memberidOutput_list),
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
   		
    }
  
    /* function approveSelected() {
		 console.log('클릭됨');
		 var memberidOutputElement = document.getElementById("memberidOutput");
		 console.log('memberidOutputElement : ' , memberidOutputElement);
		 var memberid = memberidOutputElement.textContent;
     	 console.log('memberid : ' , memberid);
  	
   $.ajax({
       url: '/geomin/joinStatus',
       type: 'POST',
       data: JSON.stringify(memberidOutput_list),
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
  		
   } */
	// 선택한 체크박스의 값을 수집
    //const checkboxes = document.querySelectorAll('input[name="rowCheck"]:checked');
		//const memberidOutput = document.querySelectorAll('td[id="memberidOutput"]');
		//const memberidOutput2 = document.getElementById('memberidOutput').value;
		//const memberidOutput4 = document.getElementById('memberidOutput4').value;
		//console.log('memberidOutput2 : ' , memberidOutput2);
		//console.log('memberidOutput : ' , memberidOutput);
		//console.log('memberidOutput4 : ' , memberidOutput4);
		//console.log('checkboxes : ' , checkboxes);
		//const memberIds = Array.from(checkboxes).map(checkbox => (checkbox.value)); // 문자열을 정수로 변환
	//console.log('memberIds : ', memberIds);
	
    // 서버로 데이터를 전송
    /* const obj = {
        memberIds: memberIds // 선택한 학습자의 memberid 배열
        // 기타 필요한 데이터도 추가 가능
    }

    fetchPost('/joinStatus', obj, (map) => {
        // 서버 응답 처리 로직 추가
    }); */
	
    function fetchPost(url, obj, callback){
    	try{
    		// url 요청
    		fetch(url
    				, {
    					method : 'post'
    					, headers : {'Content-Type' : 'application/json'}
    					, body : JSON.stringify(obj)
    				})
    			// 요청결과 json문자열을 javascript 객체로 반환
    			.then(response => response.json())
    			// 콜백함수 실행
    			.then(map => callback(map));			
    	}catch(e){
    		console.log('fetchPost', e);
    	}
    }
    
 
  /*
	//승인 버튼 클릭시 
	function joinStatusValue(){
		var url = "/geomin/teacher/homeworkMain";    // 컨트롤러로 보내고자 하는 URL
		var valueArr = new Array();
		var list = $("input[name='rowCheck']");
		
		for(var i=0; i<list.length; i++){
			if(list[i].checked){   //선택되어 있으면 배열에 값을 저장함
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length == 0){
			alert("학습자를 선택해주세요.");
		} else{
			var chk = confirm("그룹가입 신청을 승인하시겠습니까?");
			$.ajax({
				url : "/geomin/teacher/homeworkMain",   //전송 url
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr     //보내려는 data변수 설정
				},
				success : function(jdata){
				console.log()
				console.log("=============진입 2");
					if(jdata.result == "success"){
				console.log("=============진입 3");
						alert("승인처리되었습니다.");
						var form = document.createElement("form");
					    form.setAttribute("method", "post");
					    form.setAttribute("action", "/geomin/teacher/teacherMain");
					    
					    document.getElementById("updateJoinStatus").appendChild(form);
					    
					    form.submit();
                    } else{
						alert("승인 처리에 실패하였습니다.");
					}
				}
			});
		}
	}   
*/
	</script>
	
	
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
             <div class='content'>
             
             	<!-- 학습 그룹 등록 페이지 -->
             	<div id="introduction1">
             	
          	 	</div>
             	
             	

             	<!-- 그룹 가입 승인 페이지 -->
             	<div id="introduction2">
             		<div>
             			<h1><b>그룹 가입 승인</b></h1><br>
             		</div>
             		
             		<div>
		      				<select id='contentSelect' class="form-select" aria-label="Default select example">
							 	<option selected>학습컨텐츠 선택</option>
							 <c:forEach var="contentRes" items="${contentRes }">
							  	<option value="${contentRes.pkgname}">${contentRes.pkgname}</option>
							 </c:forEach>
							</select>           		
             		</div>
					<div  id='contentList'>
	             			그룹명 : <div class='groupidOutput'></div>
	             			가입입원 : <div class='personOutput'></div>
           			 
	             		<form id='updateJoinStatus' name='updateJoinStatus'>
	           			<input type="hidden" name="groupid" id='groupid' value="${membervo.groupid}">
	           			<input type="hidden" name="sname"  id='sname' value="${membervo.sname}">
	           			<input type="hidden" name="pkgname"  id='pkgname' value="${member.pkgname}">
	           			<input type="hidden" name="memberid"  id='memberid' value="${membervo.memberid}">
	           			
			                <table class="table" border="1px solid" style="height:50%;weight:100%">
								  <thead>
								    <tr class="table-success">
								      <th><input type='checkbox' id='allCheck' name='allCheck'></th>
								      <th>학습자명</th>
								      <th>나이</th>
								      <th>연락처</th>
								      <th>이메일</th>
								      <th>가입신청 일자</th>
								      <th>승인 여부</th>
								    </tr>
								  </thead>
								  
							    <tbody id='contentList2'>
								    <c:forEach var="membervo" items="${map.membervo}">
								        <tr>
								            <td rowspan='3' scope="row"><input type='checkbox' name='rowCheck'></td> 
								            <td><div class='snameOutput'>${membervo.sname }</div></td>
								            <td><div class='mbirthdateOutput'>${membervo.mbirthdate }</div></td>
								            <td><div class='mphoneOutput'>${membervo.mphone }</div></td>
								            <td><div class='memailOutput'>${membervo.memail }</div></td>
								            <td><div class='groupResDateOutput'>${membervo.groupResDate }</div></td>
								            <td><div class='joinStatusOutput'>${membervo.joinStatus }</div></td>
				                        <c:choose>
											<c:when test="${membervo.joinstatus == 'N'}"> 
												<td><div class='joinStatusOutput'>${membervo.joinStatus }</div></td>
											</c:when>
											<c:otherwise>
												<td><div class='joinStatusOutput'>${membervo.joinStatus }</div></td>
											</c:otherwise>
										</c:choose>
								          </tr>
   									 </c:forEach>
							  </tbody>
							  
							</table>
							
	             			<div class="d-grid gap-2 col-6 mx-auto">
	             				<button type="button" class="btn btn-success" id="introductionbtn" name='introductionbtn' 
	             						onclick="approveSelected()">그룹가입 승인</button><!--  -->
             				</div>
	             		</form>
             		</div>	
             	</div>


             	<!-- 숙제 전송 페이지-->
             	<div id="introduction3">
             		
          	 	</div>



             	<!-- 숙제 평가 페이지 -->
             	<div id="introduction4">
             	
          	 	</div>
          	 	
            </div>
            
            <div class='banner'>
            </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        
</body>
</html>