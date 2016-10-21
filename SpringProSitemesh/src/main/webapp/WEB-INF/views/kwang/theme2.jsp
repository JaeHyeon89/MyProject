<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<script type="text/javascript">
	var checkbox;
	function checkAll4() {
		var f = document.themeForm;
		checkbox = f.num;
		if (checkbox.length) {
			for (var i = 0; checkbox.length; i++) {
				checkbox[i].checked = f.boxs.checked;
			}
		} else {
			checkbox.checked = f.boxs.checked;
		}
	}
	function goCheckPlay4() {
		var frm1 = document.themeForm;
		var url = "/springPro/checkPlay";
		var title = "/springPro/checkPlay";
		window.open(url, title, 300, 300);
		frm1.target = title;
		frm1.method = "post";
		frm1.action = url;
		frm1.submit();
	}
</script>


<style type="text/css">
a {
	cursor: pointer;
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
</style>



<h2>테마별</h2>
<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#home">테마별</a></li>
	<c:forEach var="each" items="${ themeList }">
		<li><a data-toggle="tab" href="#${ each.num }">${ each.theme }</a></li>
	</c:forEach>
</ul>


<form name="themeForm">


	<h2>${each.theme }</h2>


	<div class="tab-content">
		<div id="home" class="tab-pane fade in active">
			<h3>테마종류</h3>
			<p>테마종류 페이지</p>
		</div>
		<c:forEach var="each" items="${ hmap }">
			<div id="${ each.key }" class="tab-pane fade">

				<button type="button" class="btn btn-success"
					onclick="goCheckPlay4()">선택듣기</button>
				<input type="button" class="btn btn-success" value="선택담기"> <input
					type="button" class="btn btn-success" value="선택다운"> <br>
				<br>

				<div class="container-fluid">
		<div class="row" align="left" style="font-size: 16px">

			<div class="col-sm-2">
				<div class="row">

					<div class="col-sm-1" >
						<input type="checkbox" name="all" onclick="checkAll()">
					</div>
					
					<div class="col-sm-1" style="width: 100px" align="center" >순위</div>
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
					<c:forEach var="each" items="${ each.value }" varStatus="status">
						<div class="row"
							style="border-bottom-style: solid; border-bottom-color: #e0ebed;">

							<div class="col-md-2">
								<!-- box,순위,사진,가사버튼 -->
								<div class="col-md-2">
									<br> <label><input type="checkbox" name="num"
										value="${ each.num }"></label>
								</div>
								<div class="col-md-3" align="center" style="font-size: 16px;">
									<br>${ status.count }</div>

								<div class="col-md-4">
									<img
										src="/springPro/resources/filepath/song/${ each.photoSysName }"
										class="img-rounded" alt="Cinque Terre" width="60" height="65">
								</div>
								<!-- 				<br><br> -->
								<!-- 가사버튼 -->
								<br>
								<div class="col-md-3">
									<a
										onClick="window.open('/springPro/lyrics?num=${each.num}','가사버튼','width=1000, height=700')">
										<i class="material-icons" style="font-size: 24px; color: gray">description</i>
									</a>
								</div>
							</div>
							<br>

							<!-- 곡이름-재생 -->
							<div class="col-md-4" id="song">
								<!-- 곡 이름 -->

								<a style="font-size: 16px;"
									onClick="window.open('/springPro/musicPlayer?num=${each.num}','재생버튼','width=350, height=700')"
									data-toggle="tooltip" title="${each.songName} 재생-새 창">${ each.songName }</a>
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
										<i class="material-icons"
										style="font-size: 24px; color: #ff9999">play_circle_filled</i>
									</a>

								</div>

								<!-- 추천버튼 -->
								<div class="col-md-2" style="width: 40px">
									<a
										onClick="window.open('/springPro/recommend?num=${each.num}','추천버튼','width=400, height=150')">
										<i class="material-icons"
										style="font-size: 24px; color: #ff9999;">favorite</i>
									</a>
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
									<a
										onClick="window.open('/springPro/down?num=${each.num}','500','500')">
										<i class="material-icons" style="font-size: 24px">file_download</i>
									</a>
								</div>
								<!-- 뮤비버튼 -->
								<div class="col-md-2" style="width: 40px">
									<a><i class="material-icons" style="font-size: 24px">music_video</i></a>
								</div>
								<br>

							</div>
						</div>
						<br>
					</c:forEach>
				</div>

			</div>
		</c:forEach>
	</div>

</form>