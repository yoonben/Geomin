<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
document.addEventListener("DOMContentLoaded", function() {
	
	// 패키지명 입력 제한
    pkgname.addEventListener("blur", function() {
        const inputValue = pkgname.value;
        const regex = /^[A-Za-z0-9]{6}$/; // 영문 대소문자와 숫자 6자

        if (!regex.test(inputValue)) {
        	document.getElementById('message').innerHTML = "공백 없이 영문, 숫자 6자로 입력하세요.";
        	pkgname.focus();
        } else {
        	document.getElementById('message').innerHTML = "";
        }
    });
	
    // 할인율 입력 필드에 입력 제한을 설정
    discountrate.addEventListener("blur", function() {
        const inputValue = discountrate.value;
        const regex = /^(30|3[1-9]|[4-6]\d|70)(\.\d{1,2})?$/; // 30에서 70까지의 숫자 혹은 소수점 2자리까지 허용하는 정규표현식

        if (!regex.test(inputValue)) {
        	document.getElementById('message').innerHTML = "할인율은 30에서 70 사이의 숫자만 입력가능합니다.";
        	discountrate.focus();
        } else {
        	document.getElementById('message').innerHTML = "";
        }
    });
    
});
</script>

</head>
<body>
<div id='container'>
	<%@include file="../header/header.jsp" %>
	
	<div id='section'>
            <div class='subnavi'>
				
            </div>
             <div class='content'>
             	<div id="gardenBtn">
             		<button type="button" class="btn btn-outline-primary">등록</button>
             		<button type="button" class="btn btn-outline-primary">조회</button>
             	</div>
             	<div id="message"></div>
             	<form action="">
             		<div id="packgeInsert">
             			<div><p>패키지명<p> <input id="pkgname" name="pkgname" class="form-control" type="text" placeholder="공백 없이 영 정가 문/숫자 6자" aria-label="default input example"></div>
             			<div>
             				<p>학습 난이도</p>
             				<select id="difficulty" name="difficulty" class="form-select" aria-label="Default select example">
							  <option selected value="1">초급</option>
							  <option value="2">중급</option>
							  <option value="3">상급</option>
							</select>
             			</div>
             			<div><p>학습 가능 인원</p><input id="personnel" name="personnel" class="form-control" type="text" aria-label="default input example"></div>
             			<div><p>정가</p><input id="fixedprice" name="fixedprice" class="form-control" type="text" aria-label="default input example"></div>
             			<div><p>할인율</p><input id="discountrate" name="discountrate" id="discountrate" name="discountrate" class="form-control" type="text" placeholder="30 ~ 70(%)" aria-label="default input example"></div>
             			<div><p>판매가</p><input id="finalprice" name="finalprice" class="form-control" type="text" aria-label="default input example"></div>
             			<div><p>판매 내용</p> <textarea id="pkgcontent" name="pkgcontent" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea></div>
             		</div>
             		<input onclick="packgeInsert()" type="submit" class="btn btn-outline-primary" value="패키지 등록">
             	</form>
             	<div></div>
            </div>
            <div class='banner'>
            </div>
          </div>
      </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>