<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	th {
		text-align: center;
	}

</style>

<h3>마이 앨범</h3>

<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#album1">${ myAlbumInfo.albumName1 }</a></li>
	<li><a data-toggle="tab" href="#album2">${ myAlbumInfo.albumName2 }</a></li>
	<li><a data-toggle="tab" href="#album3">${ myAlbumInfo.albumName3 }</a></li>
</ul>   

<div class="tab-content">
	<div id="album1" class="tab-pane fade in active">
		<c:if test="${ myAlbumInfo.albumName1 != null }">
			<h3>${ myAlbumInfo.albumName1 }</h3>
		</c:if>
		<c:if test="${ myAlbumInfo.albumName1 == null }">
			<h3>앨범 1</h3>	
		</c:if>
		<button onclick="" class="btn btn-primary">앨범명 수정</button>
		<jsp:include page="/WEB-INF/views/JH/05_myAlbum/myAlbum1.jsp" />
	</div>
	
	<div id="album2" class="tab-pane fade">
		<c:if test="${ myAlbumInfo.albumName2 != null }">
			<h3>${ myAlbumInfo.albumName2 }</h3>
			
		</c:if>
		<c:if test="${ myAlbumInfo.albumName2 == null }">
			<h3>앨범 2</h3>	
		</c:if>
		<button onclick="" class="btn btn-primary">앨범명 수정</button>
		<jsp:include page="/WEB-INF/views/JH/05_myAlbum/myAlbum2.jsp" />
	</div>
	
	<div id="album3" class="tab-pane fade">
		<c:if test="${ myAlbumInfo.albumName3 != null }">
			<h3>${ myAlbumInfo.albumName3 }</h3>
		</c:if>
		<c:if test="${ myAlbumInfo.albumName3 == null }">
			<h3>앨범 3</h3>	
		</c:if>
		<button onclick="" class="btn btn-primary">앨범명 수정</button>
		<jsp:include page="/WEB-INF/views/JH/05_myAlbum/myAlbum3.jsp" />
	</div>
</div>





<script type="text/javascript">
	function albumDel(albumContent, songNum, target){
		alert("songNum : "+songNum);
		alert("albumContent : "+albumContent);
		alert("target : "+target);
		
		var delNum = songNum;
		var albumContent = albumContent;
		var target = target;
		var userNum = ${ nowLogon.num };
		$.ajax({
			type : "POST",
			url : "delAlbum",
			data : {delNum : delNum,
					albumContent : albumContent,
					target : target,
					userNum : userNum
					},
// 			dataType: 'json',
			success : function(data){
				if(data == "ok"){
					alert("곡이 정상적으로 삭제되었습니다.");
					location.href="go";
				}else{
					alert("곡 삭제에 실패했습니다.");
					location.href="go";
				}
			},
			error : function(request,status,error){
				alert("에러 발생!!!");
				alert("request : " + request.status);
				alert("status : " + status.responseText);
				alert("error : " + error);
			}
		});
	}

</script>











