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
					<label>학습 기간 : 최대 3개월</label> 
						<!-- <body onLoad="SetToToday('FirstSelect');">
						<B>오늘 연도와 날짜가 자동으로 선택 됩니다</B>
						--- 3. 원하는 위치에 아래와 같이 코드를 붙여 넣으세요 -----
						<FORM name="Form1">
							<SELECT name="FirstSelectYear" onchange="ChangeOptionDays('FirstSelect')">
								<script type="text/javascript">
                					document.write(WriteYearOptions(50));
        						</SCRIPT>
							</SELECT> 
							<SELECT name="FirstSelectMonth"
								onchange="ChangeOptionDays('FirstSelect')">
								---- 필요하면 아래 월 표시를 한글로 바꾸어 주세요 -----
								<OPTION>01월
								<OPTION>02월
								<OPTION>03월
								<OPTION>04월
								<OPTION>05월
								<OPTION>06월
								<OPTION>07월
								<OPTION>08월
								<OPTION>09월
								<OPTION>10월
								<OPTION>11월
								<OPTION>12월
							</SELECT>
							<SELECT name="FirstSelectDay">
        						<OPTION>1
								<OPTION>2
								<OPTION>3
								<OPTION>4
								<OPTION>5
								<OPTION>6
								<OPTION>7
								<OPTION>8
								<OPTION>9
								<OPTION>10
								<OPTION>11
								<OPTION>12
								<OPTION>13
								<OPTION>14
								<OPTION>15
								<OPTION>16
								<OPTION>17
								<OPTION>18
								<OPTION>19
								<OPTION>20
								<OPTION>21
								<OPTION>22
								<OPTION>23
								<OPTION>24
								<OPTION>25
								<OPTION>26
								<OPTION>27
								<OPTION>28
								<OPTION>29
								<OPTION>30
								<OPTION>31
							</SELECT>
						</FORM> -->
						<!-- HTML -->
						<select id="select_yearB" class= "select_yearB" onchange="javascript:lastdayB();"></select>
						<select id="select_monthB" class= "select_monthB" onchange="javascript:lastdayB();"></select>
						<select id="select_dayB" class= "select_dayB"></select>
						
						~
						
						<select id="select_yearA" class= "select_yearA" onchange="javascript:lastdayA();"></select>
						<select id="select_monthA" class= "select_monthA" onchange="javascript:lastdayA();"></select>
						<select id="select_dayA" class= "select_dayA"></select>
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
var start_year = "2023";// 시작할 년도
var today = new Date();
var today_year = today.getFullYear();
var indexB=0;
var indexA=0;
for(var y=start_year; y<=today_year; y++){ //start_year ~ 현재 년도
	document.getElementById('select_yearB').options[indexB] = new Option(y, y);
	document.getElementById('select_yearA').options[indexA] = new Option(y, y);
	indexB++;
	indexA++;
}

indexB = 0;
indexA = 0;
for(var m=1; m<=12; m++){
	document.getElementById('select_monthB').options[indexB] = new Option(m, m);
	document.getElementById('select_monthA').options[indexA] = new Option(m, m);
	indexB++;
	indexA++;
}


lastdayB();
function lastdayB(){ //년과 월에 따라 마지막 일 구하기 
	var yearB=document.getElementById('select_yearB').value;
	var monthB=document.getElementById('select_monthB').value;
	var dayB=new Date(new Date(yearB,monthB,1)-86400000).getDate();
    /* = new Date(new Date(Year,Month,0)).getDate(); */
    
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
}

lastdayA();
function lastdayA(){ //년과 월에 따라 마지막 일 구하기 
	var yearA=document.getElementById('select_yearA').value;
	var monthA=document.getElementById('select_monthA').value;
	var dayA = new Date(new Date(yearA,monthA,1)-86400000).getDate();
    /* = new Date(new Date(Year,Month,0)).getDate(); */
    
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
}

/* lastday();

function lastday(){ //년과 월에 따라 마지막 일 구하기 
	var yearB=document.getElementById('select_yearB').value;
	var monthB=document.getElementById('select_monthB').value;
	var dayB = new Date(new Date(YearB,MonthB,1)-86400000).getDate();
	console.log('dayB : ' , dayB);
	
	var yearA=document.getElementById('select_yearA').value;
	var monthA=document.getElementById('select_monthA').value;
	var dayA = new Date(new Date(YearA,MonthA,1)-86400000).getDate();
	console.log('dayA : ' , dayA);
	
	var dayindex_lenB = document.getElementById('select_dayB').length;
	if(dayB>dayindex_lenB){
		for(var B=(dayindex_lenB+1); B<=dayB; B++){
			document.getElementById('select_dayB').options[B-1] = new Option(B, B);
		}
	}
	else if(dayB<dayindex_lenB){
		for(var B=dayindex_lenB; B>=dayB; B--){
			document.getElementById('select_dayB').options[B]=null;
		}
	}
	
	var dayindex_lenA = document.getElementById('select_dayA').length;
	if(dayA>dayindex_lenA){
		for(var A=(dayindex_lenA+1); A<=dayA; A++){
			document.getElementById('select_dayA').options[A-1] = new Option(A, A);
		}
	}
	else if(dayA<dayindex_lenA){
		for(var A=dayindex_lenA; A>=dayA; A--){
			document.getElementById('select_dayA').options[A]=null;
		}
	}
} */

/* Now = new Date();
NowDay = Now.getDate();
NowMonth = Now.getMonth();
NowYear = Now.getYear();
if (NowYear < 2000) NowYear += 1900;
function DaysInMonth(WhichMonth, WhichYear)
{
  var DaysInMonth = 31;
  if (WhichMonth == "Apr" || WhichMonth == "Jun" || WhichMonth == "Sep" || WhichMonth == "Nov") DaysInMonth = 30;
  if (WhichMonth == "Feb" && (WhichYear/4) != Math.floor(WhichYear/4))        DaysInMonth = 28;
  if (WhichMonth == "Feb" && (WhichYear/4) == Math.floor(WhichYear/4))        DaysInMonth = 29;
  return DaysInMonth;
}

function ChangeOptionDays(Which)
{
  DaysObject = eval("document.Form1." + Which + "Day");
  MonthObject = eval("document.Form1." + Which + "Month");
  YearObject = eval("document.Form1." + Which + "Year");

  Month = MonthObject[MonthObject.selectedIndex].text;
  Year = YearObject[YearObject.selectedIndex].text;

  DaysForThisSelection = DaysInMonth(Month, Year);
  CurrentDaysInSelection = DaysObject.length;
  if (CurrentDaysInSelection > DaysForThisSelection)
  {
    for (i=0; i<(CurrentDaysInSelection-DaysForThisSelection); i++)
    {
      DaysObject.options[DaysObject.options.length - 1] = null
    }
  }
  if (DaysForThisSelection > CurrentDaysInSelection)
  {
    for (i=0; i<(DaysForThisSelection-CurrentDaysInSelection); i++)
    {
      NewOption = new Option(DaysObject.options.length + 1);
      DaysObject.add(NewOption);
    }
  }
    if (DaysObject.selectedIndex < 0) DaysObject.selectedIndex == 0;
}

function SetToToday(Which)
{
  DaysObject = eval("document.Form1." + Which + "Day");
  MonthObject = eval("document.Form1." + Which + "Month");
  YearObject = eval("document.Form1." + Which + "Year");

  YearObject[0].selected = true;
  MonthObject[NowMonth].selected = true;

  ChangeOptionDays(Which);

  DaysObject[NowDay-1].selected = true;
}

function WriteYearOptions(YearsAhead)
{
  line = "";
  for (i=0; i<YearsAhead; i++)
  {
    line += "<OPTION>";
    line += NowYear + i;
  }
  return line;
} */
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