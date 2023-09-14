<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    	
    	#introduction2{
    		display: none;
    	}
    	@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

</style>
    	
    	
 <script type="text/javascript">
    window.addEventListener('load', function(){
   	 	const subnavi1 = document.getElementById('#subnavi1');
    	const subnavi2 = document.getElementById('#subnavi2');
    	
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
    	
    }
    )
	</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='container'>
	<%@include file="./header.jsp" %>
	
	<div id='section'>
	
            <div class='subnavi'>
            	<ul>
                    <li><a id="subnavi1">이용약관</a></li>
                   	<li><a id="subnavi2">개인정보처리방침</a></li>
               	</ul>
            </div>
            
            
             <div class='content'>
            
        <!-- 이용약관 시작 -->     
	    <div id="introduction1" style="font-family: 'NanumSquareNeo-Variable';">
	          	
		<div class="index">
			<p class="frist_p" style='margin-top:40px;'>이용약관은 다음과 같은 내용을 담고 있습니다.</p>
		</div>

		<div class="section v1">
			<h3><a name="a1">여러분을 환영합니다.</a></h3>
			<p>바둑서비스(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한  서비스의 이용과 관련하여  서비스를 제공하는  우리사이트와 이를 이용하는  서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의  서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. </p>
			<p class="sec_last_p"> 서비스를 이용하시거나  서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다</p>
			<h3><a name="a2">다양한  서비스를 즐겨보세요.</a></h3>
			<p>는 <a href="/geomin/main">우리 바둑사이트</a>을 비롯한  도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.
				여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의  서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 웹고객센터(이하‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.</p>
			
			<h3><a name="a3">회원으로 가입하시면  서비스를 보다 편리하게 이용할 수 있습니다.</a></h3>
			<p>여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께  서비스 이용 계정(이하 ‘계정’)을 부여합니다.
				계정이란 회원이  서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다.</p>
			<p>회원은 자신의 계정을 통해 좀더 다양한  서비스를 보다 편리하게 이용할 수 있습니다.
				이와 관련한 상세한 내용은 계정 운영정책및 고객센터 내 회원가입 방법 등에서 확인해 주세요.</p>
			
		
		</div>
	</div>
	<!-- 이용약관 끝 -->  
             	
        <!-- 개인정보처리방침 시작 -->     
        <div id="introduction2" style="font-family: 'NanumSquareNeo-Variable';">
            		
            <div id="a1" class="section"  style='margin-top:40px;'>
            	<h4>1. 개인정보처리방침의 의의</h4>
            	<p><strong id="a1_1" class="b">본 개인정보처리방침은 개인정보보호법을 기준으로 작성하되, 이용자 개인정보 처리 현황을 최대한 알기 쉽고 상세하게 설명하기 위해 노력하였습니다.</strong><br />이는 쉬운 용어를 사용한 개인정보처리방침 작성 원칙인 &lsquo;Plain Language Privacy Policy(쉬운 용어를 사용한 개인정보처리방침)&rsquo;를 도입한 것입니다.</p>
       		</div><br>
       		
        	<div id="a2" class="section">
	            <h4>2. 수집하는 개인정보</h4>
	            <p><strong id="a2_1" class="b">이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 서비스를 회원과 동일하게 이용할 수 있습니다. <br />이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.</strong></p>
        	</div><br>
        	
	        <div id="a3" class="section">
	            <h4>3. 수집한 개인정보의 이용</h4>
	            <ul class="sec">
	                <li class="first last">
	                    <p><strong id="a3_1">관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발&middot;제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.</strong></p>
	                </li>
	            </ul>
	        </div><br>
	        <div id="a4" class="section">
	            <h4>4. 개인정보의 제공 및 위탁</h4>
           	 <ul class="sec">
                <li class="first">
                    <p><strong id="a4_1">원칙적으로 이용자 동의 없이 개인정보를 외부에 제공하지 않습니다.</strong></p>
                    <p>이용자의 사전 동의 없이 개인정보를 외부에 제공하지 않습니다. 단, 이용자가 외부 제휴사의 서비스를 이용하기 위하여 개인정보 제공에 직접 동의를 한 경우, 그리고 관련 법령에 의거해 네이버에 개인정보 제출 의무가 발생한 경우, 이용자의 생명이나 안전에 급박한 위험이 확인되어 이를 해소하기 위한 경우에 한하여 개인정보를 제공하고 있습니다.</p>
             	</li></ul>
             	</div>
             	
        </div>
        <!-- 개인정보처리방침 끝 -->    
             
      </div>
            
            <div class='banner'>
            	<%@include file="./banner.jsp" %>
            </div>
            
          </div>
          </div>
          
          <%@include file="./footer.jsp" %>
   
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>