<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script>
	function checkAll() {
		checkbox = frm1.num;
		if (checkbox.length) {
			for (var i = 0; checkbox.length; i++) {
				checkbox[i].checked = frm1.all.checked;
			}
		} else {
			checkbox.checked = frm1.all.checked;
		}
	}

	function goCheckPlay() {

		var url = "/springPro/checkPlay";
		var title = "/springPro/checkPlay";
		window.open(url, title, 300, 300);
		frm1.target = title;
		frm1.method = "post";
		frm1.action = url;
		frm1.submit();
	}

	function goSong() { //노래 선택 구매 function

		if ($("input:checkbox[id='check']").is(":checked")) {
			var url = "/springPro/songChargeForm";
			var title = "/springPro/songChargeForm"
			window.open("", title, "width=700, height=600");
			frm1.target = title;
			frm1.action = url;
			frm1.method = "post";
			frm1.submit();
		} else {
			alert("구매하실 곡을 선택해 주세요");
			return;
		}
	}

	function goLogin() { //로그인 안됐을때 로그인으로
		alert("로그인이 필요한 서비스입니다.");
		location.href = "/springPro/JH/02_log/login";

	}
</script>

<style type="text/css">
a {
	cursor: pointer;
}

#song {
	color: black;
}

#arti1 {
	color: black;
	font-size: x-large;
}

#al1 {
	color: black;
	font-size: x-large;
}

#arti {
	color: black;
	width: 230px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#al {
	color: black;
	width: 230px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>

<c:forEach var="each" items="${ listArtist }">
	<h1>
		&nbsp;&nbsp; <strong>${ each.artistName }</strong>
	</h1>
	<div class="row-fluid"
		style="border-bottom-style: solid; border-bottom-color: #e0ebed;"></div>

	<br>

	<div class="col-sm-5">
		<div>
			<iframe width="300" height="300"  style="" src="/springPro/kwang/info/photo?photo=${ each.photoSysName }"
				class="img-rounded" name="mainPhoto">
				</iframe>

			<div class="col-sm-2">
			<c:forEach varStatus="i" begin="1" end="9">
				<div id="${ i.index }">
					<a href="/springPro/kwang/info/photo?photo=${ fn:replace(each.photoSysName,'.jpg','_00') }${ i.index }.jpg" target="mainPhoto"> 
				 		<img
							src="/springPro/resources/filepath/artist/${ fn:replace(each.photoSysName,'.jpg','_00') }${ i.index }.jpg"
							class="img-rounded" alt="Cinque Terre" width="50" height="50" onerror="photoFun(${ i.index })">
					</a>
				</div>
			</c:forEach>
			<c:forEach varStatus="i" begin="10" end="99">
				<div id="${ i.index }">
					<a href="/springPro/kwang/info/photo?photo=${ fn:replace(each.photoSysName,'.jpg','_0') }${ i.index }.jpg" target="mainPhoto"> 
				 		<img
							src="/springPro/resources/filepath/artist/${ fn:replace(each.photoSysName,'.jpg','_0') }${ i.index }.jpg"
							class="img-rounded" alt="Cinque Terre" width="50" height="50" onerror="photoFun(${ i.index })">
					</a>
				</div>
			</c:forEach>
			<script type="text/javascript">
			function photoFun(i) {
				document.getElementById(i).innerHTML="";
			}
			</script>
			</div>




		</div>
	</div>

	<div>
		<div class="col-sm-2">유형</div>

		<div class="col-sm-5">${each.member }</div>
	</div>
	<div>
		<div class="col-sm-2">데뷔</div>

		<div class="col-sm-5">${each.debut }</div>
	</div>

	<div>
		<div class="col-sm-2">국적</div>

		<div class="col-sm-5">${each.nationality }</div>
	</div>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<!-- 버튼 -->
	<!-- 	<div class="col-sm-3"> -->
	<!-- 		<input type="button" class="btn btn-warning" value="예비용">  -->
	<!-- 		<input type="button" class="btn btn-success" value="예비용"> -->
	<!-- 	</div> -->
</c:forEach>
<br>
<br>
<div class="row-fluid"
	style="border-bottom-style: solid; border-bottom-color: #e0ebed;"></div>


<form name="frm1">

	<h2>&nbsp;&nbsp;곡</h2>

	<button type="button" class="btn btn-success" onclick="goCheckPlay()">선택듣기</button>
	<input type="button" class="btn btn-success" value="선택담기">
	<button type="button" class="btn btn-success"
		<c:if test="${nowLogon!=null}">onclick="goSong()"</c:if>
		<c:if test="${nowLogon==null}">onclick="goLogin()"</c:if>>선택다운</button>

	<br>
	<br>

	<div class="container-fluid">
		<div class="row" align="left" style="font-size: 16px">

			<div class="col-sm-2">
				<div class="row">

					<div class="col-sm-1">
						<input type="checkbox" name="all" onclick="checkAll()">
					</div>

					<div class="col-sm-1" style="width: 100px" align="center">순위</div>
				</div>
			</div>
			<div class="col-sm-4">곡</div>
			<div class="col-sm-2">아티스트</div>
			<div class="col-sm-2">앨범</div>
			<div class="col-sm-2" align="center">&nbsp;재생&nbsp;추천&nbsp;내앨범&nbsp;다운&nbsp;뮤비</div>
			<br> <br>
			<div style="border-bottom-style: solid; border-bottom-color: black;"></div>

		</div>
		<br>
	</div>

	<div class="container-fluid" align="left">
		<c:forEach var="each" items="${ artistSong }">
			<div class="row">


				<div class="col-md-2">
					<!-- box,순위,사진,가사버튼 -->
					<div class="row">
						<div class="col-md-2">
							<br> <label><input type="checkbox" name="num"
								id="check1" value="${ each.num }"></label>
						</div>
						<div class="col-md-3" align="center" style="font-size: 16px;">
							<br>${ each.num }</div>

						<div class="col-md-4">
							<a
								onClick="location.href='/springPro/albumInfo?name=${each.albumName}'"
								data-toggle="tooltip" title="${ each.albumName }-페이지이동"><img
								src="/springPro/resources/filepath/song/${ each.photoSysName }"
								class="img-rounded" alt="Cinque Terre" width="60" height="65"></a>
						</div>
						<!--가사버튼 -->
						<br>
						<div class="col-md-3">
							<a
								onClick="window.open('/springPro/lyrics?num=${each.num}','가사버튼','width=1000, height=700')">
								<i class="material-icons" style="font-size: 24px; color: gray">description</i>
							</a>
						</div>
					</div>
				</div>
				<br>

				<!-- 곡이름-재생 -->
				<div class="col-md-4" id="song">
					<!-- 곡 이름 -->

					<a style="font-size: 20px;"
						href="/springPro/musicPlayer?num=${each.num}" target="iframe_a"
						data-toggle="tooltip" title="${each.songName} 재생-새 창"><strong>${ each.songName }</strong></a>
				</div>
				<div class="col-md-2" id="arti">
					<!-- 가수 이름 -->
					<a
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
						<a
							onClick="window.open('/springPro/musicPlayer?num=${each.num}','재생버튼','width=350, height=700')">
							<i class="material-icons" style="font-size: 24px; color: #ff9999">play_circle_filled</i>
						</a>

					</div>

					<!-- 추천버튼 -->
					<div class="col-md-2" style="width: 40px">
						<a
							onClick="window.open('/springPro/recommend?num=${each.num}','추천버튼','width=400, height=150')"
							style="width: 40px"> <i class="material-icons"
							style="font-size: 24px; color: #ff9999;">favorite</i></a>
					</div>
					<!-- 담기버튼 -->
					<div class="col-md-2" style="width: 40px">
						<a
							onClick="window.open('/springPro/myAlbum?num=${each.num}','500','500')">
							<i class="material-icons" style="font-size: 24px">library_music</i>
						</a>
					</div>
					<!-- 다운버튼 -->
					<div class="col-md-2" style="width: 40px">
						<c:if test="${nowLogon!=null}">
							<a
								onClick="window.open('/springPro/songChargeForm?num=${each.num}', '음악구매', 'width=700, height=600')">
								<i class="material-icons" style="font-size: 24px">file_download</i>
							</a>
						</c:if>
						<c:if test="${nowLogon==null}">
							<a onClick="goLogin()"> <i class="material-icons"
								style="font-size: 24px">file_download</i></a>
						</c:if>
					</div>
					<!-- 뮤비버튼 -->
					<div class="col-md-2" style="width: 40px">
						<c:if test="${ each.youtube!=null }">
							<a
								onClick="window.open('/springPro/muvi?num=${each.num}', '뮤비보기', 'width=900, height=600')">
								<i class="material-icons" style="font-size: 24px">
									music_video</i>
							</a>
						</c:if>
						<c:if test="${ each.youtube==null }">
							<i class="material-icons" style="font-size: 24px">music_video</i>
						</c:if>
					</div>
					<br>
				</div>
			</div>
			<br>
			<div
				style="border-bottom-style: solid; border-bottom-color: #e0ebed;">
			</div>
			<br>
		</c:forEach>
	</div>

</form>
