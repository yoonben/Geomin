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


    	
    	.box_title01 {
		    margin-bottom: 24px;
		    width: 500px;
		    border-bottom: 2px solid black;
		}
		

    </style>
    
    
    <script type="text/javascript">
    window.addEventListener('load', function(){
   	 	const subnavi1 = document.getElementById('#subnavi1');
    	const subnavi2 = document.getElementById('#subnavi2');
    	const subnavi3 = document.getElementById('#subnavi3');
    	const subnavi4 = document.getElementById('#subnavi4');
    	const introductionbtn = document.getElementById('#introductionbtn');
    	
    	$('#subnavi1').click(function (){
    		console.log('#subnavi1 작동 개시');
    		$('#introduction1').show ();
    		$('#introduction2').hide();
    		$('#introduction3').hide();
    		$('#introduction4').hide();
    	});
    	
    	$('#subnavi2').click(function (){
    		console.log('#subnavi2 작동 개시');
    		$('#introduction2').show();
    		$('#introduction1').hide();
    		$('#introduction3').hide();
    		$('#introduction4').hide();
    	});
    	$('#subnavi3').click(function (){
    		console.log('#subnavi3 작동 개시');
    		$('#introduction3').show();
    		$('#introduction1').hide();
    		$('#introduction2').hide();
    		$('#introduction4').hide();
    	});
    	$('#subnavi4').click(function (){
    		console.log('#subnavi4 작동 개시');
    		$('#introduction4').show();
    		$('#introduction1').hide();
    		$('#introduction2').hide();
    		$('#introduction4').hide();
    	});
    	
    	$('#introductionbtn').click(function (){
    		console.log('#subnavi2 작동 개시');
    		$('#introduction2').show();
    		$('#introduction1').hide();
    	});

    	
    })
	</script>
	
	
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
             <div class='content'>
             
             	<!-- 학습 그룹 등록 페이지 -->
             	<div id="introduction1">
          	 	</div>
             	
             	

             	<!-- 그룹 가입 승인 페이지 -->
             	<div id="introduction2">
             		<div>
             			<h1><b>그룹 가입 승인</b></h1><br>
             		</div>
             		<div>
		      				<select class="form-select" aria-label="Default select example">
							  <option selected>학습패키지 선택</option>
							  <option value="1">One</option>
							</select>             		
             		</div>
							
					<div>
             			그룹명 : 
             		</div>
             		
             		<div>
             			가입입원 : 
             		</div>
             		
             		<form>
	             		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	             			<button type="button" class="btn btn-success" id="introductionbtn">조회</button>
	             		</div>
             		
		                <table class="table" border="1px solid" style="height:50%;weight:100%">
							  <thead>
							    <tr class="table-success">
							      <th scope="col"><input type='checkbox' id='allCheck' name='allCheck'></th>
							      <th scope="col">학습자명</th>
							      <th scope="col">나이</th>
							      <th scope="col">연락처</th>
							      <th scope="col">이메일</th>
							      <th scope="col">가입신청 일자</th>
							      <th scope="col">승인 여부</th>
							    </tr>
							  </thead>
							  
							  <tbody>
							    <tr>
							      <th rowspan='3' scope="row"><input type='checkbox' name='rowCheck' value='${boardVO.bno }'></th>
							      <td>Mark</td>
							      <td>Otto</td>
							      <td>@mdo</td>
							      <td>@mdo</td>
							      <td>@mdo</td>
							      <td>@mdo</td>
							    </tr>
							  </tbody>
						</table>
             			
             			<button type="submit" class="btn btn-success" id="introductionbtn">그룹가입 승인</button>
             		</form>
             	</div>


             	<!-- 숙제 전송 페이지 -->
             	<div id="introduction3">
          	 	</div>


             	<!-- 숙제 평가 페이지 -->
             	<div id="introduction4">
          	 	</div>
          	 	
            </div>
            
            <div class='banner'>
            </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        
</body>
</html>