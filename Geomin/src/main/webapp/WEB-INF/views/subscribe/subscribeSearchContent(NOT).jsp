<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");

	Calendar cal = Calendar.getInstance();
	
	// 시스템 오늘날짜
	int ty = cal.get(Calendar.YEAR);
	int tm = cal.get(Calendar.MONTH)+1;
	int td = cal.get(Calendar.DATE);
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	// 파라미터 받기
	String sy = request.getParameter("year");
	String sm = request.getParameter("month");
	
	if(sy!=null) { // 넘어온 파라미터가 있으면
		year = Integer.parseInt(sy);
	}
	if(sm!=null) {
		month = Integer.parseInt(sm);
	}
	
	cal.set(year, month-1, 1);
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH)+1;
	
	int week = cal.get(Calendar.DAY_OF_WEEK); // 1(일)~7(토)
%>


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

.calendar {
	width: 280px;
	margin: 30px auto;
}
.calendar .title{
	height: 37px;
	line-height: 37px;
	text-align: center;
	font-weight: 600;
}

.calendar table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

.calendar table thead tr:first-child{
	background: #f6f6f6;
}

.calendar table td{
	padding: 10px;
	text-align: center;
	border: 1px solid #ccc;
}

.calendar table td:nth-child(7n+1){
	color: red;
}
.calendar table td:nth-child(7n){
	color: blue;
}
.calendar table td.gray {
	color: #ccc;
}
.calendar table td.today{
	font-weight:700;
	background: #E6FFFF;
}

.calendar .footer{
	height: 25px;
	line-height: 25px;
	text-align: right;
	font-size: 12px;
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
			<div class="content">
				<div class="today">
					<h2>230830</h2>
					<h2>오늘의 기분은 어떤가요?</h2>
					<img src="/resources/img/pingwing-bee_angry.png">
				</div>
				학습관리자 : 
				<input type="text" id="sub_memberid">
				
				구독날짜 : 
				<input type="text" id="sub_date">
				
				<button id="searchButton">조회</button>
				<br>
				<table id="result-table">
					<thead>
					<tr>
						<th> </th>
						<th>학습 관리자</th>
						<th>콘텐츠 이름</th>
						<th>콘텐츠 구독 날짜</th>
						<th>콘텐츠 최종 가격</th>
						<th>콘텐츠 수준</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="list" items="${list}">
						<tr id="data-raw" class="data-raw" data-value="${list.difficulty }">
							<td><input type="checkbox" name="check" value="check" id="check"></td>
							<td>${list.memberID }</td>
							<td>${list.pkgName }</td>
							<td>${list.subsDate }</td>
							<td class="list_finalPrice">${list.finalPrice }</td>
							<td>${list.difficulty }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<button id="reqSubscribe">구독 철회</button>
			</div>
			<div class='banner'></div>
		</div>
	</div>
</body>

<div class="calendar">
	<div class="title">
		<form name="frm" method="post">
			<select name="year" class="selectField" onchange="change()">
				<% for(int i=year-5; i<=year+5; i++){ %>
					<option value="<%=i%>" <%=year==i?"selected='selected'":"" %>><%=i%>년</option>
				<%} %>
			</select>
			<select name="month" class="selectField" onchange="change()">
				<% for(int i=1; i<=12; i++){ %>
					<option value="<%=i%>" <%=month==i?"selected='selected'":"" %>><%=i%>월</option>
				<%} %>
			</select>
		</form>
	</div>
	
	<table>
		<thead>
			<tr>
				<td>일</td>
				<td>월</td>
				<td>화</td>
				<td>수</td>
				<td>목</td>
				<td>금</td>
				<td>토</td>
			</tr>
		</thead>
		<tbody>
<%
			// 1일 앞 달
			Calendar preCal = (Calendar)cal.clone();
			preCal.add(Calendar.DATE, -(week-1));
			int preDate = preCal.get(Calendar.DATE);
			
			out.print("<tr>");
			// 1일 앞 부분
			for(int i=1; i<week; i++) {
				//out.print("<td>&nbsp;</td>");
				out.print("<td class='gray'>"+(preDate++)+"</td>");
			}
			
			// 1일부터 말일까지 출력
			int lastDay = cal.getActualMaximum(Calendar.DATE);
			String cls;
			for(int i=1; i<=lastDay; i++) {
				cls = year==ty && month==tm && i==td ? "today":"";
				
				out.print("<td class='"+cls+"'>"+i+"</td>");
				if(lastDay != i && (++week)%7 == 1) {
					out.print("</tr><tr>");
				}
			}
			
			// 마지막 주 마지막 일자 다음 처리
			int n = 1;
			for(int i = (week-1)%7; i<6; i++) {
				// out.print("<td>&nbsp;</td>");
				out.print("<td class='gray'>"+(n++)+"</td>");
			}
			out.print("</tr>");
%>		
		</tbody>
	</table>
	
	<div class="footer">
		<a href="calendar2.jsp">오늘날짜로</a>
	</div>
	
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		const dataRows = document.querySelectorAll("tr.data-raw");
		
		$('#searchButton').click(function() {
			//1. 운영관리자
			$('tr.data-raw').hide();
			const sub_memberid = document.getElementById('sub_memberid').value;
			console.log('sub_memberid : ' , sub_memberid);
			
			const sortedData = Array.from(dataRows);
			console.log('sortedData : ' , sortedData);
			
			sortedData.forEach(row => {
				const sub_memberid2 = row.querySelector("td:nth-child(2)").textContent;
				console.log('sub_memberid2 : ' , sub_memberid2);
				if(sub_memberid === "" || sub_memberid === sub_memberid2){
					console.log('sortedData : ', sortedData);
					row.style.display = 'table-row';
					//row.style.display = 'table-row';
				}
			});
		});
	}); //$(document).ready EndPoint
</script>
</html>