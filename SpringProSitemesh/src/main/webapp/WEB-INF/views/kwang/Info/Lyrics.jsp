<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">



<style type="text/css">
a {
	cursor: pointer;
}

 #arti {
 	color:black;
 	font-size: x-large;
 	
}
 #al {
 	color:black;
 	font-size: x-large;
}
</style>

<script type="text/javascript">

	function goLogin(){		//로그인 안됐을때 로그인으로
	alert("로그인이 필요한 서비스입니다.");
	window.opener.top.location.href="/springPro/JH/02_log/login";
	window.close();
	}
	
	function goArtist(){
		alert("goarti");
		window.opener.top.location.href="/springPro/artistInfo?name="+frm.artistName.value;
		window.close();
	}
	function goAlbum(){
		alert("goalbu");
		window.opener.top.location.href="/springPro/albumInfo?name="+frm.albumName.value;
		window.close();
	}
	
</script>

<form name="frm">
<!-- 	<h1>가사 정보페이지</h1> -->
<c:forEach var="each" items="${ listLyrics }">
<input type="hidden" name="artistName" value="${ each.artistName }">
<input type="hidden" name="albumName" value="${ each.albumName }">
<h1>&nbsp;&nbsp;
<strong>${ each.songName }</strong></h1>
	<div class="row"
		style="border-bottom-style: solid; border-bottom-color: #e0ebed; border-top-style: solid; border-top-color: #e0ebed;">
		<br>
		<div class="col-sm-5">
			<img src="/springPro/resources/filepath/song/${ each.photoSysName }"
				class="img-rounded" alt="Cinque Terre" width="300" height="300">

		</div>
		<div id="arti">
			<div class="col-sm-2">아티스트</div>
			<div class="col-sm-5">
				<a
					onClick="goArtist()"
					data-toggle="tooltip" title="${each.artistName}-페이지이동"> ${ each.artistName }</a>

			</div>

		</div>
		<div id="al">
			<div class="col-sm-2">앨범</div>

			<div class="col-sm-5">
				<a
					onClick="goAlbum()"
					data-toggle="tooltip" title="${each.albumName}-페이지이동">${ each.albumName }</a>
			</div>

		</div>
		<br>		<br>		<br>		<br>		<br>		<br>		<br>		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="col-sm-7">
			<!-- 추천버튼 -->
			<div class="col-sm-3" 
				onClick="window.open('/springPro/recommend?num=${each.num}','추천버튼','width=400, height=150')">
				<button type="button" class="btn btn-default btn-lg">
				<i class="material-icons" style="font-size:20px;color:red">favorite_border</i>
				추천 ${each.recomCount }</button>
				
			</div>
			<!-- 재생버튼 -->
			<div class="col-sm-2">
				<a href="/springPro/songOnePlayer?num=${each.num}" target="iframe_a">
					<button type="button" class="btn btn-default btn-lg">재생</button>
				</a>

			</div>
		

			<!-- 담기버튼 -->
			<div class="col-sm-2"
				onClick="window.open('/springPro/myAlbum?num=${each.num}','500','500')">
				<button type="button" class="btn btn-default btn-lg">담기</button>
			</div>
			<!-- 다운버튼 -->
			<div class="col-md-2">
					<c:if test="${nowLogon!=null}">
					<a onClick="window.open('/springPro/songChargeForm?num=${each.num}', '음악구매', 'width=700, height=600')">
					<button type="button" class="btn btn-default btn-lg">다운</button></a>
					</c:if>
					<c:if test="${nowLogon==null}">
					<a onClick="goLogin()">
					<button type="button" class="btn btn-default btn-lg">다운</button></a>
					</c:if>
				</div>
			<!-- 뮤비버튼 -->
			<div class="col-md-2">
				<c:if test="${ each.youtube!=null }">
					<a onClick="window.open('/springPro/muvi?num=${each.num}', '뮤비보기', 'width=900, height=600')">
					<button type="button" class="btn btn-default btn-lg">뮤비</button>
					</a>
				</c:if>
				<c:if test="${ each.youtube==null }">
					<button type="button" class="btn btn-default btn-lg">뮤비</button>
				</c:if>
			</div>
		</div>
	</div>

	<br>



	<div class="container-fluid">
  <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">가사 보기</button>
  <div id="demo" class="collapse" style="font-size: large; font: bold;">
  <br>
   ${ each.lyrics }
  </div>
</div>


</c:forEach>
</form>
