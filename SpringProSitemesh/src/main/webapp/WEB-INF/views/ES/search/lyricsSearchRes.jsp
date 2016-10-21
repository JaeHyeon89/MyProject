<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style type="text/css">
a {
	cursor: pointer;
}

 #song {
 	color:black;
}

  #arti { 
    color:black; 
  	width: 230px; 
 	text-overflow:ellipsis;  
 	overflow:hidden; 
 	white-space:nowrap; 
 }
  .al { 
	color:black; 
  	width: 230px; 
 	text-overflow:ellipsis;  
 	overflow:hidden; 
 	white-space:nowrap; 
 }
 </style> 




<div style="font-size: 50px; font-weight: bolder;" align="center">
	<div style="display: inline; color: red;">
	'${ search }'
	</div>
	<div style="display: inline;">
		로 검색하신 결과는 ${ size }개 입니다.
	</div>
</div>	
	<br>
	
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div style="font-size: 25px;">
	      <ul class="nav navbar-nav">
	        <li><a href="/springPro/search/song?search=${ search }">곡</a></li>
	        <li><a href="/springPro/search/album?search=${ search }">앨 범</a></li>
	        <li><a href="/springPro/search/artist?search=${ search }">아티스트</a></li> 
	        <li class="active"><a href="/springPro/search/lyrics?search=${ search }">가 사</a></li> 
	      </ul>
	    </div>
	  </div>
	</nav>
	
	<br><br>
	
<c:choose>
	<c:when test="${ size>0 }">
			<div class="container-fluid" align="left" style="font-size: 16px">
		<div class="row"
			style="border-bottom-style: solid; border-bottom-color: black;">
			<div class="col-sm-2">
<!-- 				<div class="col-md-4" align="center">순위</div> -->
				<div class="col-md-3">
					<!-- 사진 -->
				</div>
				<div class="col-md-3">
					<!-- 가사 -->
				</div>
			</div>
			<!-- 			<div class="col-md-1">재생</div> -->
			<!-- 			<div class="col-md-1">가사</div> -->
			<div class="col-md-4" >곡</div>
			<!-- 			<div class="col-md-1">곡이름</div> -->
			<div class="col-md-2" >아티스트</div>
			<div class="col-md-2" >앨범</div>
			<div class="col-md-2" align="right">재생&nbsp;추천&nbsp;내앨범&nbsp;다운&nbsp;뮤비</div>
			<!-- 			<div class="col-md-1">추천</div> -->
			<!-- 			<div class="col-md-1">내앨범</div> -->
			<!-- 			<div class="col-md-1">다운</div> -->
			<!-- 			<div class="col-md-1">뮤비</div> -->
		</div>
	</div>
	<br>
		<c:forEach var="each" begin="${ pbean.startNum }" end="${ pbean.endNum }" items="${ lyricsListc }">
			<div class="row"
			style="border-bottom-style: solid; border-bottom-color: #e0ebed;">

				<div class="col-md-2">
					<!-- box,순위,사진,가사버튼 -->
<%-- 					<div class="col-md-3" align="center" style="font-size: 16px;"><br>${ each.num }</div> --%>

					<div class="col-md-4">
						<img
							src="/springPro/resources/filepath/song/${ each.photoSysName }"
							class="img-rounded" alt="Cinque Terre" width="60" height="65">
					</div>
					<!-- 				<br><br> -->
					<!-- 가사버튼 -->
					<br>
					<div class="col-md-3">
						<a onClick="window.open('/springPro/lyrics?num=${each.num}','500','500')">
						<i class="material-icons" style="font-size: 24px; color: gray">description</i>
						</a>
					</div>
				</div>
				<br>

				<!-- 곡이름-재생 -->
				<div class="col-md-4" id="song" >
					<!-- 곡 이름 -->

					<a style="font-size: 16px;"
						href="/springPro/songOnePlayer?num=${each.num}" target="iframe_a"
						data-toggle="tooltip" title="${each.songName} 재생-새 창">${ each.songName }</a>
				</div>
			<div class="col-md-2" id="arti">
				<!-- 가수 이름 -->
				<a  style="width:200; text-overflow:ellipsis; overflow:hidden; white-space:nowrap"
					onClick="location.href='/springPro/artistInfo?name=${each.artistName}'"
					data-toggle="tooltip" title="${ each.artistName }-페이지이동"><nobr>${ each.artistName }</nobr></a>
			</div>
			<div class="col-md-2" id="al">
				<!-- 앨범 이름 -->
				<a 
					onClick="location.href='/springPro/albumInfo?name=${each.albumName}'"
					data-toggle="tooltip" title="${ each.albumName }-페이지이동"><nobr>${ each.albumName }</nobr></a>
			</div>
			<div class="col-md-2" align="right">
				<!-- 추천,재생,그외버튼들 -->
				<!-- 						<br><br> -->

				
				<!-- 재생버튼 -->
				<div class="col-md-1" style="width: 40px">
				<a href="/springPro/songOnePlayer?num=${each.num}" target="iframe_a">
							<i class="material-icons" style="font-size: 24px; color: #ff9999">play_circle_filled</i>
						</a>
				</div>
				
				<!-- 추천버튼 -->
				<div class="col-md-2" style="width: 40px">
				<a	onClick="window.open('/springPro/recommend?num=${each.num}','100','50')">
					<i class="material-icons" style="font-size:24px; color: #ff9999;">favorite</i></a>
				</div>
				<!-- 담기버튼 -->
				<div class="col-md-2" style="width: 40px"> 
				<a	onClick="window.open('/springPro/myAlbum?num=${each.num}','500','500')">
					<i class="material-icons" style="font-size:24px">library_music</i></a>
				</div>
				<!-- 다운버튼 -->
				<div class="col-md-2" style="width: 40px;">
					<c:if test="${nowLogon!=null}">
						<a onClick="window.open('/springPro/songChargeForm?num=${each.num}', '음악구매', 'width=700, height=600')">						
						<i class="material-icons" style="font-size:24px">file_download</i></a>
					</c:if>
					<c:if test="${nowLogon==null}">
					<a onClick="goLogin()">
					<i class="material-icons" style="font-size:24px">file_download</i></a>
					</c:if>
				</div>
				<!-- 뮤비버튼 -->
				<div class="col-md-2" style="width: 40px">
					<c:if test="${ each.youtube!=null }">
						<a onClick="window.open('/springPro/muvi?num=${each.num}', '뮤비보기', 'width=900, height=600')">
						<i class="material-icons" style="font-size:24px">
							music_video</i>
						</a>
					</c:if>
					<c:if test="${ each.youtube==null }">
						<i class="material-icons" style="font-size:24px">music_video</i>
					</c:if>
				</div>
				<br>

			</div>
			</div>
			<br>
			<div style="width: 90%; width:200; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
				<a 
				onClick="window.open('/springPro/lyrics?num=${each.num}','500','500')">
					${ each.lyrics }
				</a>
			</div>
		</c:forEach>
		<div align="center">
			<ul class="pager">
				<c:if test="${ pbean.pageGrade !=0 }">
					<li class="previous"><a href="?nowPage=${ pbean.startPage-pbean.showPageCnt }&search=${search}">pre</a></li>
				</c:if>
				<c:forEach var="i" begin="${ pbean.startPage }" end="${ pbean.endPage }">
					<li><a href="?nowPage=${ i }&search=${search}">${ i }</a></li>
				</c:forEach>
				<c:if
					test="${ pbean.oneCount==pbean.rcvCount }">
					<li class="next"><a href="?nowPage=${ pbean.startPage+pbean.showPageCnt }&search=${search}">next</a></li>
				</c:if>
			</ul>
		</div>
		
	</c:when>
	<c:otherwise>
		모든 단어의 철자가 정확한지 확인해 보세요.<br>
		두 단어 이상일 경우 띄어쓰기를 확인하거나 단어 수를 줄여보세요.<br>
		아직 발매되지 않은 곡/앨범을 검색했을 수 있습니다.<br>
	</c:otherwise>
</c:choose>