<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

.sideBanner {
  border:3px solid; 
  border-radius: 40px;
  position: absolute;
  width: 130px;
  height: 400px;
  /* top: 180px; */
  background-color: #FFFFFF;
  color: #fffffff;
  margin-left:50px;
  margin-top:20px;
}
	
</style>

<script>
//기본 위치(top)값
window.addEventListener('load', function(){
	

var floatPosition = parseInt($(".sideBanner").css('top'))

// scroll 인식
$(window).scroll(function() {
  
    // 현재 스크롤 위치
    var currentTop = $(window).scrollTop();
    var bannerTop = currentTop + floatPosition + "px";

    //이동 애니메이션
    $(".sideBanner").stop().animate({
      "top" : bannerTop
    }, 500);

}).scroll();

})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div id='banner' class="sideBanner">
			<a href='/geomin/main'>
				<img src='/resources/img/sideBanner1.png' style='width:100px;height:80px; margin-bottom:40px;margin-top:30px; margin-left:13px;'>
			</a>
			<a href='/geomin/board'>
				<img src='/resources/img/sideBanner2.png' style='width:100px;height:80px; margin-bottom:40px; margin-left:13px;'>
			</a>
			<a href=''>
				<img src='/resources/img/sideBanner3.png' style='width:100px;height:80px; margin-left:13px;'>
			</a>
		</div>
</body>
</html>