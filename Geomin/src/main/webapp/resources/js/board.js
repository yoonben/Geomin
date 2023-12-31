
let content = "";
let content2 = "";

window.addEventListener('load', function(){
	let obj = {
	        searchField: document.querySelector('#searchField').value,
	        searchWord: document.querySelector('#searchWord').value,
	        pageNo: 1 // 페이지 로드 시 첫 번째 페이지로 초기화
	    };
	    
	fetchPost('/geomin/boardList', obj, (map) => {
	    
		if(map.boardList.length > 0){

		    map.noticeList.forEach(function(item, index) {
		        content += "<tr onclick='goView("+item.bno+")'>"
		            + "  <th scope='row'>공지 사항</th>"
		            + "  <td>" + item.boardtitle + "</td>"
		            + "  <td>" + item.writer + "</td>"
		            + "  <td>" + item.regdate + "</td>"
		            + "</tr>";
		    })

		    map.boardList.forEach(function(item, index) {
		        content += "<tr onclick='goView("+item.bno+")'>"
		            + "  <th scope='row'>" + item.bno + "</th>"
		            + "  <td>" + item.boardtitle + "</td>"
		            + "  <td>" + item.writer + "</td>"
		            + "  <td>" + item.regdate + "</td>"
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
	   });
	
Search.addEventListener('click', function(e){
	
	content = ""; 
	content2 = ""; 
	
	let obj={
		searchField : document.querySelector('#searchField').value
		, searchWord : document.querySelector('#searchWord').value
	}
	
	fetchPost('/geomin/boardList', obj, (map)=>{
	    
		if(map.boardList.length > 0){

		    map.noticeList.forEach(function(item, index) {
		        content += "<tr onclick='goView("+item.bno+")'>"
		            + "  <th scope='row'>공지 사항</th>"
		            + "  <td>" + item.boardtitle + "</td>"
		            + "  <td>" + item.writer + "</td>"
		            + "  <td>" + item.regdate + "</td>"
		            + "</tr>";
		    })

		    map.boardList.forEach(function(item, index) {
		        content += "<tr onclick='goView("+item.bno+")'>"
		            + "  <th scope='row'>" + item.bno + "</th>"
		            + "  <td>" + item.boardtitle + "</td>"
		            + "  <td>" + item.writer + "</td>"
		            + "  <td>" + item.regdate + "</td>"
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
	})

})


function go(pageNo) {	
		content = ""; 
		content2 = "";
		let obj={
			searchField : document.querySelector('#searchField').value
			, searchWord : document.querySelector('#searchWord').value
			, pageNo : pageNo
		}
		
		fetchPost('/geomin/boardList', obj, (map)=>{
		    
			if(map.boardList.length > 0){
				
				 map.noticeList.forEach(function(item, index) {
				        content += "<tr onclick='goView("+item.bno+")'>"
				            + "  <th scope='row'>공지 사항</th>"
				            + "  <td>" + item.boardtitle + "</td>"
				            + "  <td>" + item.writer + "</td>"
				            + "  <td>" + item.regdate + "</td>"
				            + "</tr>";
				    })

				    map.boardList.forEach(function(item, index) {
				        content += "<tr onclick='goView("+item.bno+")'>"
				            + "  <th scope='row'>" + item.bno + "</th>"
				            + "  <td>" + item.boardtitle + "</td>"
				            + "  <td>" + item.writer + "</td>"
				            + "  <td>" + item.regdate + "</td>"
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

function goView(bno){
	location.href = '/geomin/view?bno='+bno;
}

function boardDelete(pageNo) {
	
	let obj={
			bno : pageNo
		}
	
	console.log(obj);
	
	fetchPost('/geomin/boardDelete', obj, (map)=>{
		if(map.result == 'success'){
			alert(map.msg);
			location.href = '/geomin/board';
		}else{
			alert(map.msg);
		}
	})
	
}
$(document).ready(function() {
    $('#writeButton').click(function() {
        window.location.href = '/geomin/write';
    });
});