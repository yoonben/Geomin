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
	</style>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/packge.js"></script>
</head>
<body>
<div id='container'>
	<%@include file="../header/header.jsp" %>
	<div id='section'>
            <div class='subnavi'>
	    <ul>
	        <li><a href="/geomin/manager">학습콘텐츠 등록</a></li>
	        <li><a href="/geomin/board">Q&A</a></li>
	        <li><a href="subnavi3()">매출 관리</a></li>
	        <li><a href="subnavi3_1()">- 매출 집계</a></li>
	        <li><a href="subnavi3_2()">- 매출 조회</a></li>
	    </ul>
	</div>
             <div class='content'>
             	<input type="hidden" id="pkgnameCheck" value="0">
             	<input type="hidden" id="personnelCheck" value="0">
             	<input type="hidden" id="fixedpriceCheck" value="0">
             	<input type="hidden" id="discountrateCheck" value="0">
             	<input type="hidden" id="pkgcontentCheck" value="0">
             	<div id="gardenBtn">
             		<button type="button" class="btn btn-outline-primary" id="InsertBtn">등록</button>
             		<button type="button" class="btn btn-outline-primary" id="ListBtn">조회</button>
             	</div>
             	
             	<div id="packgeList" style="display: none;">
             		<form class="d-flex" role="search">
	             		<select id="searchField" name="searchField" class="form-select" size="3" aria-label="Size 3 select example">
						  <option selected value="pkgname">콘텐츠명</option>
						  <option value="pkgcontent">콘텐츠 내용</option>
						  <option value="difficulty">학습 난이도</option>
						</select>
      				</form>
       				 <input class="form-control me-2" id="searchWord" name="searchWord" type="search" placeholder="Search" aria-label="Search">
        			 <button class="btn btn-outline-success" id="Search" type="submit">Search</button>
             		<table class="table">
					  <thead>
					    <tr>
					      <th scope="col"></th>
					      <th scope="col">콘텐츠명</th>
					      <th scope="col">학습 난이도</th>
					      <th scope="col">학습 인원</th>
					      <th scope="col">정가</th>
					      <th scope="col">할인</th>
					      <th scope="col">판매가</th>
					      <th scope="col">콘텐츠 내용</th>
					      <th scope="col">삭제 처리</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider" id="listTable">
					    
					  </tbody>
					</table>
					<nav aria-label="Page navigation example" id="pageNavi">
				
				  	</nav>
				  	<button onclick='packDelete()'>패키지 삭제</button>
             	</div>
             	
             	<div id="packgeInsert">
             		<form>
             		<div id="message"></div>
             			
             		<div><p>패키지명<p> <input id="pkgname" name="pkgname" class="form-control" type="text" placeholder="공백 없이 영어/숫자 6자" aria-label="default input example"></div>
             		<div>
             			<p>학습 난이도</p>
             			<select id="difficulty" name="difficulty" class="form-select" aria-label="Default select example">
							 <option selected value="초급">초급</option>
							 <option value="중급">중급</option>
							 <option value="고급">고급</option>
						</select>
             		</div>
             		<div><p>학습 가능 인원</p><input id="personnel" name="personnel" class="form-control" type="text" aria-label="default input example"></div>
             		<div><p>정가(원)</p><input id="fixedprice" name="fixedprice" class="form-control" type="text" aria-label="default input example"></div>
             		<div><p>할인율</p><input id="discountrate" name="discountrate" class="form-control" type="text" placeholder="30 ~ 70(%)" aria-label="default input example"></div>
             		<div><p>판매가(원)</p><input id="finalprice" name="finalprice" class="form-control" type="text" aria-label="default input example"></div>
             		<div><p>판매 내용</p> <textarea id="pkgcontent" name="pkgcontent" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea></div>
             		<input id="packgeInsertbtn" type="submit" class="btn btn-outline-primary" value="패키지 등록">
	             	</form>
             	</div>
            </div>
            <div class='banner'>
            </div>
          </div>
      </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>