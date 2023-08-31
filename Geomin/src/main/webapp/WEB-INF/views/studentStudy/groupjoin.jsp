<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html lang="en">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<head>
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
    		font-size: 0.9rem;
    		line-height: 50px;
    	}
    	/* #introduction1img{
    	
    		float:left;
    		margin-right : 10px;
    		margin-top : 15px;
    		width: 300px;
    	} */
    	#introduction1img{
    	 height:5%;
    	 weight:100%;
    	 margin-bottom:30px;
    	 
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
	<%@include file="../header/header.jsp" %>
	
	<div id='section'>
            <div class='subnavi'>
            	<ul>
                    <li><a id="subnavi1">학습 그룹 가입 신청</a></li>
                   	<li><a id="subnavi2">나의 숙제 제출</a></li>
               	</ul>
				
            </div>
             <div class='content'>
             	<!-- 학습그룹 신청 페이지 -->
             	<div id="introduction1">
                	<img src="/resources/img/game1.jpg" alt="" id='introduction1img'>
             		<h1><b>학습 그룹 신청<b></b></h1><br><br> 
             		<h3>"바둑의 첫 걸음, 그룹신청!"</h3><br> 
           		
           		<form>
	               	<table>
	               		<tr>
	               			<th>그룹목록</th>
	               			<td>
	                			<select class="form-select" aria-label="Default select example">
								  <option selected>그룹 선택</option>
								  <option value="1">One</option>
								</select>
	               			</td>
	               		</tr>
                	<!-- 그룹목록 선택에 따른 정보 출력 -->
                		<tr>
                			<th>학습컨텐츠명 </th>
                			<td></td>
                		</tr>
                		<tr>
                			<th>학습지도자명 </th>
                			<td></td>
                		</tr>
                		<tr>
                			<th>학습기간 </th>
                			<td></td>
                		</tr>
                		<tr>
                			<th>학습난이도 </th>
                			<td></td>
                		</tr>
                	</table>
	               	<button type="submit" class="btn btn-secondary" id="introductionbtn">그룹 신청하기</button>
               	</form>
           	</div>
             	
             	<!-- 숙제 제출 페이지 -->
             	<div id="introduction2">
             		<div class="box_top_tit">
               			<h2 class="h1_eb_ctr">나의 숙제 제출</h2>
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
            </div>
    </div>
</div>
        
</body>
</html>