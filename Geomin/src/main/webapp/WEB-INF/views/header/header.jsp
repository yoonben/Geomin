<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>바둑 교육 사이트 개발</title>
    <script>

    
    </script>
    <style>
        *{
            box-sizing: border-box;  /* 박스 사이즈 */
            margin:0;  /* 마진 */
            padding:0;  /* 패딩 */
        }

        #header {
        position: relative;
        z-index: 100;
        }
        #header .gnb_box {
            max-width: 1050px;
            height: 120px;
            line-height: 120px;
            margin: 0 auto;
            position: relative;
            z-index: 9999;
        }

        #header>.gnb_box> .cnt_gnb_h {
        	
            max-width: 550px;
            position: absolute;
            top: 50%;
            left: 0;
            transform: translate(0, -50%);
        }

        #header>.gnb_box>.cnt_gnb {
        	font-size: 2.7rem;
        	font-weight: 800;
        	font-family: 'SBAggroB';
            position: absolute;
            width: 550px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

        }
        
        #header>.gnb_box>.cnt_gnb>h1 {
        	font-size: 2.7rem;
        	font-weight: 800;
        	font-family: 'SBAggroB';
        	background: #005DBA;
			background: linear-gradient(to left, #005DBA 0%, #000000 100%);
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
        }
        
	
        #header .gnb_box .gnb {
            float: right;
        }

         #header .gnb_box .gnb a {
            font-size: 17px;
            font-weight: 700;
            font-family: 'GmarketSansMedium';
        } 
        


        #header .navi {
            border-top: 1px solid #D9D9D9;
            border-bottom: 1px solid #d9d9d9;
            clear: both;
        }

        #header .navi>ul {
            max-width: 1050px;
            width: 100%;
            margin: 0 auto;
            display: table;
            table-layout: fixed;
        }

        #header .navi>ul>li {
            display: table-cell;
            vertical-align: middle;
            position: relative;
        }

        #header .navi>ul>li>a {
            height: 60px;
            line-height: 60px;
            display: block;
            position: relative;
            font-size: 18px;
            font-weight: 700;
            text-align: center;
            letter-spacing: -1px;
            font-family: 'GmarketSansMedium';
        }
        
        #header .navi>ul>li>a:hover {
            height: 60px;
            line-height: 60px;
            display: block;
            position: relative;
            font-size: 22px;
            font-weight: 700;
            text-align: center;
            letter-spacing: -1px;
            background-color: #D5EBFF;
            border-top:1px solid #002A51;
			border-bottom:1px solid #002A51;
			color: #003C72;
			font-family: 'GmarketSansMedium';
        }
        

        a {
            text-decoration: none;
            color: #333333;
            padding: 0;
            border: 0;
            margin: 0;
        }

        #section {
            position: relative;
            margin: 0 auto;
            max-width: 1050px;
            height: 850px;

        }

        #section>.subnavi {
            width: 205px;
            height: 600px;

            float: left;
            border-right: 1px solid #D9D9D9;
            box-sizing: border-box;
            margin-right: 5px;
        }

        #section>.content {
            width: 630px;
            height: 600px;
            float: left;

            border-right: 1px solid #D9D9D9;
            box-sizing: border-box;
            margin-right: 5px;
        }

        #section>.banner {
            width: 205px;
            height: 600px;
            float: left;    
        }
@font-face {
    font-family: 'SBAggroB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
}

}
        
    </style>
</head>
<body>
        <div id='header'>
            <div class="gnb_box">
				<div class='cnt_gnb_h'>
					<h1>
	              	  <a href="/geomin/main"><img src="/resources/img/main.png" alt=""></a>
	                </h1>
				</div>
                <div class='cnt_gnb'>
                    <h1>게임으로 배우는 바둑교실</h1>
                </div>

                <div class="gnb">
                        <c:if test="${empty memberid}" var="res">       
					          <a href="/geomin/login">로그인</a>
				        </c:if>
				        <c:if test="${not res}">       
					          <a href="/geomin/logout">로그아웃</a>
				        </c:if>
                    <a> / </a>
                        <c:if test="${empty memberid}" var="res">       
					          <a href="/geomin/joinMember">회원 가입</a>
				        </c:if>
				        <c:if test="${not res}">       
					          <a href="/geomin/joinMemberInfo">회원 정보</a>
				        </c:if>
                    
                </div>
	        </div>

			<div class='navi'>
                <ul>
                    <li id="helloService"><a href="/geomin/main">서비스 안내</a></li>
                    <li id="studyService"><a href="/geomin/studentStudy/groupjoin">학습 서비스</a></li>
                    <li id="subscribeService"><a href="/geomin/subscribe/searchContent">구독서비스</a></li>
                    <li id="teacherService"><a href="/geomin/teacher/teacherMain">강사마당</a></li>
                    <li id="adminService"><a href="/geomin/board">관리마당</a></li><!-- <a href=""></a> -->
                </ul>
            </div>
        </div>

    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>    
<script type="text/javascript">
const serviceDefaultNavi = document.getElementById('#serviceDefaultNavi');
const helloServiceNavi = document.getElementById('#helloServiceNavi');
const studyServiceNavi = document.getElementById('#studyServiceNavi');
const subscribeServiceNavi = document.getElementById('#subscribeServiceNavi');
const teacherServiceNavi = document.getElementById('#teacherServiceNavi');
const adminServiceNavi = document.getElementById('#adminServiceNavi');

$('#helloService').click(function (){
	console.log('#helloService 작동 개시');
	$('#serviceDefaultNavi').hide();
	$('#studyServiceNavi').hide();
	$('#subscribeServiceNavi').hide();
	$('#teacherServiceNavi').hide();
	$('#adminServiceNavi').hide();
	$('#helloServiceNavi').show();
});

$('#studyService').click(function (){
	console.log('#studyService 작동 개시');
	$('#serviceDefaultNavi').hide();
	$('#helloServiceNavi').hide();
	$('#subscribeServiceNavi').hide();
	$('#teacherServiceNavi').hide();
	$('#adminServiceNavi').hide();
	$('#studyServiceNavi').show();
});

$('#subscribeService').click(function (){
	console.log('#subscribeService 작동 개시');
	$('#serviceDefaultNavi').hide();
	$('#helloServiceNavi').hide();
	$('#studyServiceNavi').hide();
	$('#teacherServiceNavi').hide();
	$('#adminServiceNavi').hide();
	$('#subscribeServiceNavi').show();
});

$('#teacherService').click(function (){
	console.log('#teacherService 작동 개시');
	$('#serviceDefaultNavi').hide();
	$('#helloServiceNavi').hide();
	$('#subscribeServiceNavi').hide();
	$('#studyServiceNavi').hide();
	$('#adminServiceNavi').hide();
	$('#teacherServiceNavi').show();
});

$('#adminService').click(function (){
	console.log('#adminService 작동 개시');
	$('#serviceDefaultNavi').hide();
	$('#helloServiceNavi').hide();
	$('#subscribeServiceNavi').hide();
	$('#studyServiceNavi').hide();
	$('#teacherServiceNavi').hide();
	$('#adminServiceNavi').show();
});



</script>    
</body>
</html>