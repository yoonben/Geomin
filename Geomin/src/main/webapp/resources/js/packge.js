window.addEventListener('load', function(){
	
	// 조회 페이지 보이는 버튼
	$('#ListBtn').click(function (){
	    $('#packgeList').show();
	    $('#packgeInsert').hide();
	    $('#searchWord').val("");
	});

	// 등록 페이지 보이는 버튼
	$('#InsertBtn').click(function (){
	    $('#packgeList').hide();
	    $('#packgeInsert').show();
	});
	
	// 패키지 등록 버튼
	packgeInsertbtn.addEventListener('click', function(e){
		
		e.preventDefault();
		let pkgnameCheck = document.querySelector('#pkgnameCheck').value;
		let personnelCheck = document.querySelector('#personnelCheck').value;
		let fixedpriceCheck = document.querySelector('#fixedpriceCheck').value;
		let discountrateCheck = document.querySelector('#discountrateCheck').value;
		let pkgcontentCheck = document.querySelector('#pkgcontentCheck').value;
     	
     	if(pkgnameCheck != 1){
     		document.getElementById('message').innerHTML = "패키지명을 입력해주세요.";
     		pkgname.focus();
 			return;
     	}
     	
     	if(personnelCheck != 1){
     		document.getElementById('message').innerHTML = "학습 가능 인원을 입력해주세요.";
     		personnel.focus();
 			return;
     	}
     	
     	if(fixedpriceCheck != 1){
     		document.getElementById('message').innerHTML = "정가(원)을 입력해주세요.";
     		fixedprice.focus();
 			return;
     	}
     	
     	if(discountrateCheck != 1){
     		document.getElementById('message').innerHTML = "할인율을 입력해주세요.";
     		discountrate.focus();
 			return;
     	}
     	
     	if(pkgcontentCheck != 1){
     		document.getElementById('message').innerHTML = "판매 내용을 입력해주세요.";
     		pkgcontent.focus();
 			return;
     	}
		
		let obj={
				pkgname : document.querySelector('#pkgname').value
				, difficulty : document.querySelector('#difficulty').value
				, personnel : document.querySelector('#personnel').value
				, fixedprice : document.querySelector('#fixedprice').value
				, discountrate : document.querySelector('#discountrate').value
				, finalprice : document.querySelector('#finalprice').value
				, pkgcontent : document.querySelector('#pkgcontent').value
			}
		
		
		fetchPost('/geomin/packageInsert', obj, (map)=>{
			if(map.result == 'success'){
				alert('패키지가 등록되었습니다.');
			}else{
				document.getElementById('message').innerHTML = map.msg;
			}
		});
	})
	
	// 패키지명 입력 제한
    pkgname.addEventListener("blur", function() {
        const inputValue = pkgname.value;
        const regex = /^[A-Za-z0-9]{6}$/; // 영문 대소문자와 숫자 6자

        if (!regex.test(inputValue)) {
        	document.getElementById('message').innerHTML = "공백 없이 영문, 숫자 6자로 입력하세요.";
        	pkgnameCheck.value = "0";
        	pkgname.focus();
        } else {
        	document.getElementById('message').innerHTML = "";
        	pkgnameCheck.value = "1";
        }
    });
	
	// 인원수 체크 필드
	personnel.addEventListener('blur', function() {
		
    const inputValue = personnel.value;
    
    if (!inputValue) {
        personnelCheck.value = "0";
    } else {
        personnelCheck.value = "1";
    }
	});
 	
	pkgcontent.addEventListener('blur', function() {
		
	    const inputValue = pkgcontent.value;
	    
	    if (!inputValue) {
	    	pkgcontentCheck.value = "0";
	    } else {
	    	pkgcontentCheck.value = "1";
	    }
		});
	
 	// 정가 입력 필드에 입력 제한을 설정
 	fixedprice.addEventListener("blur", function() {
    const inputValue = fixedprice.value;
    const regex = /^\d+$/; // 숫자만을 허용하는 정규표현식

    if (!regex.test(inputValue)) {
        document.getElementById('message').innerHTML = "정가는 숫자만 입력 가능합니다.";
        fixedpriceCheck.value = "0";
        fixedprice.focus();
    } else {
        document.getElementById('message').innerHTML = "";
        fixedpriceCheck.value = "1";
    }
	});

	
    // 할인율 입력 필드에 입력 제한을 설정
    discountrate.addEventListener("blur", function() {
        const inputValue = discountrate.value;
        const regex = /^(30|3[1-9]|[4-6]\d|70)(\.\d{1,2})?$/; // 30에서 70까지의 숫자 혹은 소수점 2자리까지 허용하는 정규표현식

        if (!regex.test(inputValue)) {
        	document.getElementById('message').innerHTML = "할인율은 30에서 70 사이의 숫자만 입력가능합니다.";
        	discountrateCheck.value = "0";
        	discountrate.focus();
        } else {
        	document.getElementById('message').innerHTML = "";
        	discountrateCheck.value = "1";
        }
    });
    
    
    // 판매가를 입력해주는 코드
    function calculateFinalPrice() {
		const fixedPrice = parseFloat(document.querySelector('#fixedprice').value);
		const discountRate = parseFloat(document.querySelector('#discountrate').value);
		
		if (!isNaN(fixedPrice) && !isNaN(discountRate)) {
			const finalPrice = fixedPrice * (1 - discountRate / 100);
			document.querySelector('#finalprice').value = finalPrice.toFixed(0);
		}
	}
    
 	// 정가와 할인율 입력 시 판매가 자동 계산
    discountrate.addEventListener("blur", calculateFinalPrice);
	fixedprice.addEventListener("blur", calculateFinalPrice);
	
	ListBtn.addEventListener('click', function(e){
		
		let content = ""; 
		let content2 = ""; 
		
		let obj={
			searchField : document.querySelector('#searchField').value
			, searchWord : document.querySelector('#searchWord').value
		}
		
		fetchPost('/geomin/packgeList', obj, (map)=>{
		    
			if(map.packagelist.length > 0){

				map.packagelist.forEach(function(item, index) {
				    content += "<tr>"
				        + "  <th scope='row'>" + item.pkgname + "</th>"
				        + "  <td>" + item.difficulty + "</td>"
				        + "  <td>" + item.personnel + "</td>"
				        + "  <td>" + item.fixedprice + "</td>"
				        + "  <td>" + item.discountrate + "</td>"
				        + "  <td>" + item.finalprice + "</td>"
				        + "  <td>" + item.pkgcontent + "</td>"
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
				    content2 += "<li><a class='page-link' onclick='go(" + i + ")'>" + i + "</a></li>";
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
	})
	
	Search.addEventListener('click', function(e){
		e.preventDefault();
	    
		let content = ""; 
		let content2 = "";
		
		let obj={
			searchField : document.querySelector('#searchField').value
			, searchWord : document.querySelector('#searchWord').value
		}
		
		fetchPost('/geomin/packgeList', obj, (map)=>{
		    
			if(map.packagelist.length > 0){

				map.packagelist.forEach(function(item, index) {
				    content += "<tr>"
				        + "  <th scope='row'>" + item.pkgname + "</th>"
				        + "  <td>" + item.difficulty + "</td>"
				        + "  <td>" + item.personnel + "</td>"
				        + "  <td>" + item.fixedprice + "</td>"
				        + "  <td>" + item.discountrate + "</td>"
				        + "  <td>" + item.finalprice + "</td>"
				        + "  <td>" + item.pkgcontent + "</td>"
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
				    content2 += "<li><a class='page-link' onclick='go(" + i + ")'>" + i + "</a></li>";
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
	})
 	
 	
});
	function go(pageNo) {	
		let content = ""; 
		let content2 = "";
		
		let obj={
			searchField : document.querySelector('#searchField').value
			, searchWord : document.querySelector('#searchWord').value
			, pageNo : pageNo
		}
		
		fetchPost('/geomin/packgeList', obj, (map)=>{
		    
			if(map.packagelist.length > 0){
				
				map.packagelist.forEach(function(item, index) {
				    content += "<tr>"
				        + "  <th scope='row'>" + item.pkgname + "</th>"
				        + "  <td>" + item.difficulty + "</td>"
				        + "  <td>" + item.personnel + "</td>"
				        + "  <td>" + item.fixedprice + "</td>"
				        + "  <td>" + item.discountrate + "</td>"
				        + "  <td>" + item.finalprice + "</td>"
				        + "  <td>" + item.pkgcontent + "</td>"
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
				    content2 += "<li><a class='page-link' onclick='go(" + i + ")'>" + i + "</a></li>";
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