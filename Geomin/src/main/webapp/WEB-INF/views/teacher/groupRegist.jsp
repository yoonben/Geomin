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
            <div class='content'>
            	<%-- <c:forEach items="${list}" var="list">
            		<p>학습 콘텐츠 명 : ${list.pkgName}</p>
            		<p>학습 가능 인원 : ${list.personnel}</p>
            		<p>그룹 등록 인원 : ${list.pkgName}</p>
        		</c:forEach> --%>
            <table>
				<thead>
					<tr>
						<th>그룹명</th>
						<th>패키지명</th>	<!-- 수정못하게 -->
						<th>학습 가능 인원</th>
						<th>학습 수준</th> <!-- 수정못하게 -->
						<th>학습 기간</th>
						<th>학습 내용</th> <!-- 수정못하게 -->
					</tr>
				</thead>
				<tbody>
				<!-- 여기 코드를 수정해야 해요!!!!!!!!!!!!!!!! -->
						<input type="text" placeholder="그룹 명을 입력해 주세요"/>														
					<c:forEach var="list" items="${list}">
						<tr id="data-raw" class="data-raw" data-value="${list.difficulty }">
							<td readonly>${list.pkgName }</td>
						</tr>
					</c:forEach>	
						<input type="text" placeholder="학습 가능한 인원을 입력해 주세요"/>
					<c:forEach var="list" items="${list}">		
						<td readonly>${list.difficulty }</td>
					</c:forEach>
					<c:forEach var="list" items="${list}">	
						<td readonly>${list.pkgContent }</td>
					</c:forEach>
				</tbody>
			</table>
		</div>
            	<%-- <c:set var="pkgName" value="${list.pkgName}"/>
				<c:set var="personnel" value="${list.personnel}"/>
            	<div>
            		<p>학습 콘텐츠 명 : <c:out value="${pkgName}"/></p> 
            		<p>학습 가능 인원 : <c:out value="${personnel}"/></p> 
    			</div> --%>
            	
            	
            	<%-- <p>${list }</p> --%>
            	<%-- <div>
            		학습 콘텐츠 명 : 
            		<select id="optionSelect">
        				<option selected>그룹 선택</option>
        				<c:forEach items="${list}" var="list">
            				<option value="${list.memberID}">${list.pkgName}</option>
        				</c:forEach>
    				</select>
    				    				
    				<p id="personnelInfo">학습 가능 인원 : 명</p>
    			</div> --%>
    				<%-- <p id="curPersonnelInfo">그룹 등록 인원 : <c:out value="${list[5]}"/>명</p> --%>
    			
            	<%-- 학습 콘텐츠명 : ${list.pkgName} 학습 가능 인원 : ${list.Personnel} 그룹 등록 인원 : ${list.curPersonnel} --%>
            	
            	<!-- <table>
            		<thead>
            			<tr>
            			
            			</tr>
          	 		</thead>
          	 		<tbody>
          	 			<td></td>
          	 		
          	 		</tbody>
          	 	</table> -->
            
            
            <div class='banner'>
            </div>
    </div>
</div>	
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

/* var listData = ${list.pkgname};
console.log('listData : ' , listData); */
    /* console.log("여기는 아닌거같아요..");
$(document).ready(function() {
	var listData = ${list};
	console.log('listData : ' , listData);
    var $selectElement = $("#optionSelect");
    var $personnelInfo = $("#personnelInfo");
	
    
    $selectElement.on("change", function () {
        console.log("여기에요!!")
    	var selectedValue = $selectElement.val();

        var selectedData = null;
        $.each(listData, function (index, item) {
            if (item.memberID === selectedValue) {
                selectedData = item;
                return false; // 반복문 종료
            }
        });

        if (selectedData) {
            $personnelInfo.text("학습 가능 인원 : " + selectedData.personnel);
           
        } else {
            $personnelInfo.text("학습 가능 인원 : ");
            
        }
    });
}); */
/* $(document).ready(function() {
    var $selectElement = $("#optionSelect");
    var $personnelInfo = $("#personnelInfo");

    $selectElement.on("change", function () {
        var selectedValue = $selectElement.val();

        var selectedData = null;
        $.each(list, function (index, item) {
            if (item.memberID === selectedValue) {
                selectedData = item;
                return false; // 반복문 종료
            }
        });

        if (selectedData) {
            $personnelInfo.text("학습 가능 인원 : " + selectedData.personnel);
           
        } else {
            $personnelInfo.text("학습 가능 인원 : ");
            
        }
    });
}); */
/* var $curPersonnelInfo = $("#curPersonnelInfo"); */
/* $curPersonnelInfo.text("현재 학습 중 : " + selectedData.curpersonnel); */
 /* $curPersonnelInfo.text("현재 학습 중 : "); */
</script>
</html>