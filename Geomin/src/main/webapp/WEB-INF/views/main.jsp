<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html lang="en">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
<head>
    <style type="text/css">
    	#container>#section>.subnavi>ul{
    		/* text-align: left; */
    		list-style-type: none;
    		width: 150px;
			height:150px;
			text-align: center;
			
    	}
        #container>#section>.subnavi>ul>li{
            margin-top: 25px;
            font-size: 14px;
            cursor: pointer;
            width: 150px;
			height:50px;
			text-align: center;
			padding-top:13px;
			border-top:1px solid #002A51;
			border-bottom:1px solid #002A51;
			font-family: 'GmarketSansMedium';
    	}
    	#container>#section>.subnavi>ul>li:hover{
            margin-top: 25px;
            font-size: 14px;
            cursor: pointer;
            color: #003C72;
			width: 150px;
			height:50px;
			text-align: center;
			box-shadow: 0px 3px 6px rgba(0, 0, 0.2, 0.2);
			border-top:1px solid #002A51;
			border-bottom:1px solid #002A51;
			background-color: #CDE6FD;
			padding-top:11px;
			font-size: 1.2rem;
        	font-weight: 600;
        	font-family: 'GmarketSansMedium';
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
    		font-size: 1.1rem;
    		line-height: 30px;
    		font-family: 'KyoboHand';
    	}
     	#introduction1img{
    	
    		/* float:right; */
    		margin-right : 10px;
    		margin-top : 30px;
    		height:180px;
    	} 
    	
    	#introduction2{
    		display: none;
    	}

    	.h1_eb_ctr{
    		font-size: 25px;
		    line-height: 44px;
		    margin-top: 20px;
		    width: 630px;
		    text-align: center;
		    font-weight: 700;
    	}
    	
    	.box_title01 {
		    margin-bottom: 24px;
		    width: 500px;
		    border-bottom: 2px solid black;
		}
		
		.h3_b_lt{
			font-size: 20px;
		    line-height: 50px;
		    font-weight: 700;
		}
		
		
#goBtnBox {
    width: 630px;
    height: 110px;
    margin: 20px auto;
    position: relative;
    text-align: center; /* 수평 가운데 정렬을 위해 추가 */
}

.gobtn-container {
    width: 110px;
    height: 110px;
    margin: 0 30px; /* 좌우 여백 추가 */
    display: inline-block;
    position: relative;
}

.gobtn1,
.gobtn2,
.gobtn3 {
    width: 100%; /* 부모 요소에 대해 100% 너비를 가지도록 설정 */
    height: 100%; /* 부모 요소에 대해 100% 높이를 가지도록 설정 */
    border: 5px solid #003C72;
    border-radius: 100px;
    position: absolute; /* 부모 요소에 대해 상대 위치로 설정 */
    top: 0; /* 부모 요소의 위쪽에 정렬 */
    left: 0; /* 부모 요소의 왼쪽에 정렬 */
    transition: 0.4s;
}

.gobtn1 img,
.gobtn2 img,
.gobtn3 img {
    width: 100%; /* 이미지를 부모 요소에 맞게 크기 조정 */
    height: 100%;
}

.hover_text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: #fff;
    z-index: 1;
    font-weight: 600;
    font-size: 28px;
    opacity: 0; /* 초기에 숨겨짐 */
    transition: 0.4s;
    font-family: 'GmarketSansMedium';
}

.gobtn-container:hover .hover_text {
    opacity: 1; /* 마우스 오버 시 보이도록 함 */
}

.gobtn-container:hover .gobtn1,
.gobtn-container:hover .gobtn2,
.gobtn-container:hover .gobtn3 {
    filter: brightness(0.5);
    transform: scale(1.2);
}


		
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Tenada';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'KyoboHand';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/KyoboHand.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

    </style>
    
    
    <script type="text/javascript">
    window.addEventListener('load', function(){
   	 	const subnavi1 = document.getElementById('#subnavi1');
    	const subnavi2 = document.getElementById('#subnavi2');
    	const introductionbtn = document.getElementById('#introductionbtn');
    	
    	$('#subnavi1').click(function (){
    		console.log('#subnavi1 작동 개시');
    		$('#introduction1').show ();
    		$('#introduction2').hide();
    	});
    	
    	$('#subnavi2').click(function (){
    		console.log('#subnavi2 작동 개시');
    		$('#introduction2').show();
    		$('#introduction1').hide();
    	});
    	
    	$('#introductionbtn').click(function (){
    		console.log('#subnavi2 작동 개시');
    		$('#introduction2').show();
    		$('#introduction1').hide();
    	});
    }
    )
	</script>
</head>

<body>
<div id='container'>
	<%@include file="header/header.jsp" %>
	
	<div id='section'>
            <div class='subnavi'>
            	<ul>
                    <li><a id="subnavi1">사이트 소개</a></li>
                   	<li><a id="subnavi2">이용 가이드</a></li>
               	</ul>
            </div>
            
            
             <div class='content'>
             	<div id="introduction1">
             		<a><h3 style='margin-top:15px; margin-bottom:15px; font-family:GmarketSansMedium;'>
             		즐거운 온라인 바둑 교육, <br>"게임으로 배우는 어린이 바둑 교실"</h3></a>
                	
                	<h5>"게임으로 배우는 어린이 바둑 교실"은 바둑을 처음 접하는 사람들을 위한 온라인 서비스입니다. <br/>
                         	간편한 규칙 설명과 튜토리얼을 통해 누구나 쉽게 바둑을 배울 수 있습니다. <br/>
                        	 언제 어디서나 접속하여 바둑의 재미를 느껴보세요.</h5>
                        	 
                        	<!-- 바로가기 아이콘 시작--> 
                        	<div id='goBtnBox'>
							    <div class="gobtn-container">
							        <a href='https://www.cosumi.net/ko/' target='_blank'>
							            <img src="../resources/img/mainBtn1.PNG" class='gobtn1'>
							            <p class="hover_text">게임</p>
							        </a>
							    </div>
							    <div class="gobtn-container">
							        <a href='http://baduk.or.kr/record/schedule' target='_blank'>
							            <img src="../resources/img/mainBtn3.PNG" class='gobtn2'>
							            <p class="hover_text">대국</p>
							        </a>
							    </div>
							    <div class="gobtn-container">
							        <a href='https://search.naver.com/search.naver?where=news&query=%EB%B0%94%EB%91%91&sm=tab_tmr&nso=so:r,p:all,a:all&sort=0' target='_blank'>
							            <img src="../resources/img/mainBtn2.PNG" class='gobtn3'>
							            <p class="hover_text">뉴스</p>
							        </a>
							    </div>
							</div>
                       		<!-- 바로가기 아이콘 끝--> 
                        	
                        	
                        	 
                        	<div style="border-top:1px solid #003C72; 
                        				border-bottom:1px solid #003C72;
                        				background-color: #003C72;
                        				color:#FFFFFF;">
                        		<h3 style='font-family: Tenada; padding-top:15px;'><b>바둑이 궁금하다면 </b></h3>
                        	</div>
		                    <iframe width="630" height="340" 
		                    		src="https://www.youtube.com/embed/-ezZ1Aavv-I?si=ERZpYB6nTn-jl5rZ" 
		                    		title="YouTube video player" frameborder="0" 
		                    		allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; 
		                    				picture-in-picture; web-share" 
		                    		allowfullscreen>
                    		</iframe><br><br>
                    		
   	                        <c:if test="${empty memberid}" var="res">       
						          <button type="button" class="btn btn-primary" onclick='location.href="/geomin/login"'>로그인</button>
					        </c:if>
					        <c:if test="${not res}">       
					        
					        
					        		<!-- 로그인시 바둑공부로 이동하는 주소 작성하기 또는 대국 안내 버튼 (클릭시 대국정보 사이트 이동) -->
						          <button type="button" class="btn btn-primary" onclick='location.href="/geomin/main"'>바둑공부</button>
					        </c:if> 
                        	
							<button type="button" class="btn btn-secondary" id="introductionbtn">이용 가이드</button>
             	</div>
             	
             	<div id="introduction2">
             		<div class="box_top_tit">
               			<h2 class="h1_eb_ctr">웹사이트 이용 안내</h2>
            		</div>
            		
            		<div class="box_title01">
						<h3 class="h3_b_lt">콘텐츠 구독</h3>
					</div>
						<p class="p1_m_lt_2ln fc_m_64">"콘텐츠 구독" 기능 콘텐츠 구매를 통해, 특정한 인원 수에 대해 정해진 내용을 가르치는 기능을 제공합니다.<br/>
						이로써 구매한 콘텐츠는 지정된 인원들에게 바둑의 핵심 전략과 기술을 교육하고 전수할 수 있는 도구로 활용할 수 있습니다.</p>
						
					<div class="box_title01">
						<h3 class="h3_b_lt">학습 콘텐츠 조회및 전송</h3>
					</div>
						<p class="p1_m_lt_2ln fc_m_64">"학습 콘텐츠 조회및 전송" 기능은 사용자가 구매한 바둑 콘텐츠를 확인하며, <br/>
						이를 학생들에게 숙제로 내주고 학생들은 숙제 내용을 작성하여 제출합니다. 이후 제출된 내용을 토대로 바둑 콘텐츠의 이해도를 평가할 수 있습니다. <br/>
						이 과정을 통해 사용자는 학습 진행 상황을 관리하고 학생들의 이해도를 평가하여 더 나은 학습 경험을 제공할 수 있습니다.</p>
             	</div>
                
            </div>
            <div class='banner'>
            	<%@include file="header/banner.jsp" %>
            </div>
            
          </div>
          
          <%@include file="header/footer.jsp" %>
      </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>