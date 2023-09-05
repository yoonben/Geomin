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
            <%-- ${list } --%>
            <c:forEach items="${list2}" var="list2">
            	<div style="display: none;">
            		<label>그룹명 : </label>
            		<input name='pkgID' value='<c:out value = "${list2.pkgId}" />' readonly="readonly" disabled="disabled">
            	</div>
            	<div>
            		<label>그룹명 : </label>
            		<input type="text" placeholder="그룹명을 입력해 주세요">
            	</div>
            	<div>
            		<label>패키지명 : </label>
            		<input name='pkgName' value='<c:out value = "${list2.pkgName}" />' readonly="readonly" disabled="disabled">
            	</div>
            	<div>
            		<label>학습 가능 인원 : </label>
            		<input type="text" placeholder="인원 수 적기"> 명
            	</div>
            	<div>
            		<label>학습 수준 : </label>
            		<input name='difficulty' value='<c:out value = "${list2.difficulty}" />' readonly="readonly" disabled="disabled">
            	</div>
            	<div>
            		<label>구독 날짜 : </label>
            		<input name='subsDate' value='<c:out value = "${list2.subsDate}" />' readonly="readonly" disabled="disabled">
            	</div>
            	<div>
            		<label>학습 기간 : </label>
            		<input type="text" placeholder="From - To">
            	</div>
            	<div>
            		<label>학습 내용 : </label>
            		<input name='content' value='<c:out value = "${list2.pkgContent}" />' readonly="readonly" disabled="disabled">
            	</div>
            </c:forEach>
            <br>
            <button id="regStudy">학습그룹 등록</button>
		</div>
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