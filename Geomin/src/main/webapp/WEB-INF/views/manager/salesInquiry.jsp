<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
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
	    	.subject{
	    		    background-color: #fbfbfb;
				    font-size: 24px;
				    color: #333;
				    font-weight: 400;
				    padding: 20px;
				    border-bottom: #e0e0e1 1px solid;
	    	}
	    	
	    	.date {
			    border-bottom: #e0e0e1 1px solid;
			    padding: 5px 10px;
			    list-style: none;
			    overflow: hidden; /* 부모 컨테이너 내에서 자식 요소를 포함하도록 설정 */
			}
			
			.date>h4{
			    margin-bottom: 0;
			}
			
			.date > li {
			    float: left;
			    width: 50%; /* 좌우로 50%씩 차지하도록 설정 */
			    box-sizing: border-box; /* 패딩과 경계선을 포함한 크기로 설정 */
			    padding: 10px 0; /* 위아래 10px 패딩 */
			    font-size: 12px;
			}
			
			.date > .right {
			    float: right;
			    text-align: right;
			}
			.dv{
				padding: 20px;
			}
	</style>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">

window.addEventListener('load', function(){
	PriceList();
})

function PriceList() {
	
	let content = "";
	let content2 = "";
	
	let obj = {
	        searchField: document.querySelector('#searchField').value,
	        searchWord: document.querySelector('#searchWord').value,
	        pageNo: 1 // 페이지 로드 시 첫 번째 페이지로 초기화
	    };
	
fetchPost('/geomin/priceList', obj, (map) => {
	    
		if(map.priceList.length > 0){


		    map.priceList.forEach(function(item, index) {
		        content += "<tr onclick='goView("+item.pkgid+")'>"
		            + "  <th scope='row'>" + item.pkgid + "</th>"
		            + "  <td>" + item.pkgname + "</td>"
		            + "  <td>" + item.transactioncnt + "</td>"
		            + "  <td>" + item.datetotalsales + "</td>"
		            + "  <td>" + item.salesdate + "</td>"
		            + "</tr>";
		    })
			
			content2 += "  <ul class='pagination justify-content-center'>"
			    + "   <!-- 첫 페이지 -->"
			    + "   <li>"
			    + "      <a class='page-link' onclick='go(1)'>처음</a>"
			    + "    </li>"
			    + "   <!-- 이전 페이지 -->"
			    + "    <li class='page-item " + (map.pageDto.prev ? '' : 'disabled') + "'>"
			    + "      <a class='page-link' onclick='go(" + (map.pageDto.startNo - 1) + ")'>이전</a>"
			    + "    </li>"
			    + "    <!-- 페이지목록 -->";
			for (var i = map.pageDto.startNo; i <= map.pageDto.endNo; i++) {
			    if (i === map.pageDto.cri.pageNo) {
			        content2 += "<li class='page-item active'><span class='page-link' style='color: black; background-color: white;'>" + i + "</span></li>";
			    } else {
			        content2 += "<li class='page-item'><a class='page-link' onclick='go(" + i + ")'>" + i + "</a></li>";
			    }
			}
			content2 += "    <!-- 다음페이지 -->"
				+ "    <li class='page-item " + (map.pageDto.next ? '' : 'disabled') + "'>"
			    + "      <a class='page-link' onclick='go(" + (map.pageDto.endNo + 1) + ")'>다음</a>"
			    + "    </li>"
			    + "    <!-- 끝 페이지 -->"
			    + "    <li class='page-item '>"
			    + "      <a class='page-link' onclick='go(" + map.pageDto.realEnd + ")'>끝</a>"
			    + "    </li>"
			    + "  </ul>";
		} else {
			content = "<tr>"
		        + "  <th colspan='7'>등록된 패키지가 없습니다.</th>" 
				+ "</tr>";
		}
		
		listTable.innerHTML = content;
	    pageNavi.innerHTML = content2;
})
}

function go(pageNo) {
	
	let content = "";
	let content2 = "";
	
	let obj = {
	        searchField: document.querySelector('#searchField').value,
	        searchWord: document.querySelector('#searchWord').value,
	        pageNo: pageNo // 페이지 로드 시 첫 번째 페이지로 초기화
	    };
	
fetchPost('/geomin/priceList', obj, (map) => {
	    
		if(map.priceList.length > 0){


		    map.priceList.forEach(function(item, index) {
		        content += "<tr onclick='goView("+item.pkgid+")'>"
		            + "  <th scope='row'>" + item.pkgid + "</th>"
		            + "  <td>" + item.pkgname + "</td>"
		            + "  <td>" + item.transactioncnt + "</td>"
		            + "  <td>" + item.datetotalsales + "</td>"
		            + "  <td>" + item.salesdate + "</td>"
		            + "</tr>";
		    })
			
			content2 += "  <ul class='pagination justify-content-center'>"
			    + "   <!-- 첫 페이지 -->"
			    + "   <li>"
			    + "      <a class='page-link' onclick='go(1)'>처음</a>"
			    + "    </li>"
			    + "   <!-- 이전 페이지 -->"
			    + "    <li class='page-item " + (map.pageDto.prev ? '' : 'disabled') + "'>"
			    + "      <a class='page-link' onclick='go(" + (map.pageDto.startNo - 1) + ")'>이전</a>"
			    + "    </li>"
			    + "    <!-- 페이지목록 -->";
			for (var i = map.pageDto.startNo; i <= map.pageDto.endNo; i++) {
			    if (i === map.pageDto.cri.pageNo) {
			        content2 += "<li class='page-item active'><span class='page-link' style='color: black; background-color: white;'>" + i + "</span></li>";
			    } else {
			        content2 += "<li class='page-item'><a class='page-link' onclick='go(" + i + ")'>" + i + "</a></li>";
			    }
			}
			content2 += "    <!-- 다음페이지 -->"
				+ "    <li class='page-item " + (map.pageDto.next ? '' : 'disabled') + "'>"
			    + "      <a class='page-link' onclick='go(" + (map.pageDto.endNo + 1) + ")'>다음</a>"
			    + "    </li>"
			    + "    <!-- 끝 페이지 -->"
			    + "    <li class='page-item '>"
			    + "      <a class='page-link' onclick='go(" + map.pageDto.realEnd + ")'>끝</a>"
			    + "    </li>"
			    + "  </ul>";
		} else {
			content = "<tr>"
		        + "  <th colspan='7'>등록된 패키지가 없습니다.</th>" 
				+ "</tr>";
		}
		
		listTable.innerHTML = content;
	    pageNavi.innerHTML = content2;
})
}

function goView(pkid){
	console.log(pkid);
}
</script>
</head>
<body>
<div id='container'>
	<%@include file="../header/header.jsp" %>
	<div id='section'>
            <div class='subnavi'>
	    <ul>
				<li><a href="/geomin/manager">학습콘텐츠 등록</a></li>
		        <li><a href="/geomin/board">Q&A</a></li>
		        <li><a href="/geomin/salesTally">매출 관리</a></li>
		        <li><a href="/geomin/salesTally">- 매출 집계</a></li>
		        <li><a href="/geomin/salesInquiry">- 매출 조회</a></li>
	    </ul>
	</div>
             <div class='content'>
             	<!-- Q&A 게시판 시작 -->
             	<div id="boardList">
             		<form class="d-flex" role="search">
						<select id="searchField" name="searchField" class="form-select" aria-label="Default select example">
						  <option selected value="pkgid">패키지 번호</option>
						  <option value="pkgname">패키지 이름</option>
						</select>
      				</form>
       				 <input class="form-control me-2" id="searchWord" name="searchWord" type="search" placeholder="Search" aria-label="Search">
        			 <button class="btn btn-outline-success" id="Search" onclick="PriceList()">Search</button>
             		<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">패키지 번호</th>
					      <th scope="col">패키지 이름</th>
					      <th scope="col">거래 건수</th>
					      <th scope="col">판매 매출</th>
					      <th scope="col">날짜</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider" id="listTable">
					    
					  </tbody>
					</table>
					<nav aria-label="Page navigation example" id="pageNavi">
					
				  	</nav>
             	</div>
             	<!-- Q&A 게시판 끝 -->
             		
          </div>
            <div class='banner'>
            </div>
      </div>
      </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>