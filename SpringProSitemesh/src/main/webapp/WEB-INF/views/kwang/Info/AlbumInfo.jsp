<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src='/springPro/resources/js/jquery.js' type="text/javascript"></script>
<script src='/springPro/resources/js/jquery.MetaData.js'
	type="text/javascript"></script>
<script src='/springPro/resources/js/jquery.rating.js'
	type="text/javascript"></script>
<link href='/springPro/resources/js/jquery.rating.css' type="text/css"
	rel="stylesheet" />
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

	function goAlbum() { //앨범 구매 function
		var frm = document.frmAlbum;

		var url = "/springPro/albumChargeForm";
		var title = "/springPro/albumChargeForm"
		window.open("", title, "width=700, height=600");
		frm.target = title;
		frm.action = url;
		frm.method = "post";
		frm.submit();
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

#arti1 {
	color: black;
	font-size: x-large;
}

#song {
	color: black;
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

td {
	font-weight: bold;
	font-size: medium;
	word-break: break-all;
}
</style>
<c:forEach var="each" items="${ listAlbum }">
	<h1>
		&nbsp;&nbsp; <strong>${ each.albumName }</strong>
	</h1>

	<div class="row-fluid"
		style="border-bottom-style: solid; border-bottom-color: #e0ebed;"></div>

	<br>
	<div class="col-sm-5">
		<img src="/springPro/resources/filepath/song/${ each.photoSysName }"
			class="img-rounded" alt="Cinque Terre" width="300" height="300">

	</div>
	<div id="arti1">
		<div class="col-sm-2">아티스트</div>
		<div class="col-sm-5">
			<a
				onClick="location.href='/springPro/artistInfo?name=${each.artistName}'"
				data-toggle="tooltip" title="${each.artistName}-페이지이동"> ${ each.artistName }</a>

		</div>

	</div>
	<div>
		<div class="col-sm-2">발매일</div>

		<div class="col-sm-5">${each.dateOfIssue }</div>
	</div>

	<div>
		<div class="col-sm-2">스타일</div>

		<div class="col-sm-5">${each.musicStyle }</div>
	</div>
	<div>
		<div class="col-sm-2">평점</div>

		<div class="col-sm-5">${each.avgCount }</div>
	</div>

	<div>
		<div class="col-sm-2">평점 주기</div>
		<div class="col-sm-5">
			<form name="rating">
				<input type="hidden" name="num" value="${ each.num }"> <input
					name="star" type="radio" class="star" value="1" /> <input
					name="star" type="radio" class="star" value="2" /> <input
					name="star" type="radio" class="star" value="3" /> <input
					name="star" type="radio" class="star" value="4" /> <input
					name="star" type="radio" class="star" value="5" /> <input
					onClick="goRating()" value="평점주기" type="button" name="pointCount">
			</form>
		</div>

	</div>

	<div>
		<div class="col-sm-2">앨범 소개</div>

		<div class="col-sm-5">${each.albumIntro }</div>
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
	<!-- 추천버튼 -->
	<div class="col-sm-3">
		<form name="frmAlbum">
			<input type="hidden" name="num" value="${ each.num }">
			<button type="button" class="btn btn-warning"
				<c:if test="${nowLogon!=null}">onclick="goAlbum()"</c:if>
				<c:if test="${nowLogon==null}">onclick="goLogin()"</c:if>>앨범구매</button>
		</form>
	</div>
	<!-- 추천버튼 -->
	<div class="col-sm-3"
		onClick="window.open('/springPro/recommend?num=${each.num}','100','50')">
		<button type="button" class="btn btn-default btn-md">
			<i class="material-icons" style="font-size: 20px; color: red">favorite_border</i>
			추천 ${each.recomCount }
		</button>

	</div>
</c:forEach>
<br>
<br>
<br>
<div class="row-fluid"
	style="border-bottom-style: solid; border-bottom-color: #e0ebed;"></div>
<h2>&nbsp;&nbsp;수록곡</h2>
<form name="frm1">
	<button type="button" class="btn btn-success" onclick="goCheckPlay()">선택듣기</button>
	<input type="button" class="btn btn-success" value="선택담기">
	<button type="button" class="btn btn-success"
		<c:if test="${nowLogon!=null}">onclick="goSong()"</c:if>
		<c:if test="${nowLogon==null}">onclick="goLogin()"</c:if>>선택다운</button>

	<br> <br>

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
		<c:forEach var="each" items="${ listSong }">
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
							<img
								src="/springPro/resources/filepath/song/${ each.photoSysName }"
								class="img-rounded" alt="Cinque Terre" width="60" height="65">
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
						href="/springPro/songOnePlayer?num=${each.num}" target="iframe_a"
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
					<a href="/springPro/songOnePlayer?num=${each.num}" target="iframe_a">
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

<!-- 로그인 안하면 입력창 안보임 -->
<c:choose>
	<c:when test="${ nowLogon != null }">
	<form action="/springPro/kwang/comment/insertOne" method="post">
		<h3>&nbsp;한마디</h3>
		<table>
			<tr>
			<td>&nbsp;</td>
				<td><textarea
						style="resize: none; font-weight: bold; font-size: medium;"
						name="content" cols="160" maxlength="200" required="required"
						placeholder="최대 200자.."></textarea></td>
						<td>&nbsp;</td>
				<td><input type="submit"
					class="btn btn-info btn-lg" value="등록" /></td>
			<th>&nbsp;</th>
			</tr>
		</table>
<br><br><br>


		<input type="hidden" name="writer" value="${ nowLogon.nickName }">
		<input type="hidden" name="albumNum" value="${ bean.num }"> <input
			type="hidden" name="name2" value="${ name }">
	</form>
	</c:when>
	<c:otherwise>
		<table>
			<tr>
			<td>&nbsp;</td>
				<td><textarea
						style="resize: none; font-weight: bold; font-size: medium;"
						name="content" cols="160" maxlength="200" 
						placeholder="최대 200자.."  readonly="readonly">코멘트는 로그인 후에 입력가능합니다.</textarea></td>
						<td>&nbsp;</td>
				<td><input type="submit"
					class="btn btn-info btn-lg" value="등록" disabled="disabled" /></td>
			<th>&nbsp;</th>
			</tr>
		</table>
<br><br><br>


	</c:otherwise>
</c:choose>
<!--  답글 리스트 -->
<!-- <h2>코멘트 페이지</h2> -->
<table class="table table-hover table-condensed">
	<tr>
	<th>&nbsp;</th>
		<th>작성자</th>
		<th>내용</th>
		<th>&nbsp;</th>
	</tr>
	<c:if test="${ listCmt !=null }">
		<c:forEach var="albumComment" items="${ listCmt }">
			<tr>
				<td width="10%">${ albumComment.writer }</td>
				<td width="85%">${ albumComment.content }</td>
				<td><c:if test="${ albumComment.writer == nowLogon.nickName }">
						<a
							href="/springPro/kwang/comment/deleteOne?num=${ albumComment.num }&name2=${ name }"
							class="btn btn-info btn-xs"><i class="material-icons">remove_circle</i></a>
					</c:if></td>
			</tr>
		</c:forEach>
	</c:if>
</table>


<script type="text/javascript">
	function goRating() {
		var url = "pointCount";
		var title = "pointCount";
		var frm = document.rating;

		window.open(url, title, 100, 50);
		frm.action = url;
		frm.target = title;
		frm.method = "post";
		frm.submit();

	}
</script>
