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
            	<div>
            		학습 콘텐츠 명 : 
            		<select id="optionSelect">
        				<option selected>그룹 선택</option>
        				<c:forEach items="${list}" var="list">
            				<option value="${list.memberID}">${list.pkgName}</option>
            				<option value="${list.memberID}">${list.personnel}</option>
        				</c:forEach>
    				</select>
    				
    				<p>학습 가능 인원 : <c:out value="${personnel}"/></p>
    				<%-- 그룹 등록 인원 : <c:out value="${list.curPersonnel}"/> --%>
    			 	
    			</div>
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
            </div>
            
            <div class='banner'>
            </div>
    </div>
</div>	
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


</script>
</html>