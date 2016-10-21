<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<div class="nav nav-pills nav-stacked" data-spy="affix">
	<div style="margin-bottom: 10px">
		<a href="/springPro"><button class="btn btn-info btn-sm">홈으로</button></a>
	</div>
	<div class="panel-group">
		<div class="panel panel-primary">

			<!-- 뮤직 -->
			<div class="panel-heading">
				<h2 class="panel-title">
					뮤직설정<a data-toggle="collapse" href="#collapseMusic"><i
						class="material-icons" style="font-size: 18px">arrow_drop_uparrow_drop_down</i></a>
				</h2>
			</div>
			<div id="collapseMusic" class="panel-collapse collapse in">
				<div class="list-group">
					<div>
						<a class="list-group-item"
							href="/springPro/adminJK/music/album/selectList">앨범리스트</a>
					</div>
					<div>
						<a class="list-group-item"
							href="/springPro/adminJK/music/song/selectList">곡리스트</a>
					</div>
					<div>
						<a class="list-group-item"
							href="/springPro/adminJK/music/artist/selectList">아티스트리스트</a>
					</div>
					<div>
						<a class="list-group-item"
							href="/springPro/adminJK/music/theme/selectList">테마리스트</a>
					</div>
					<div>
						<a class="list-group-item"
							href="/springPro/adminJK/music/genre/selectList">장르리스트</a>
					</div>
				</div>
			</div>
		</div>


		<!-- 회원 -->
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h2 class="panel-title">
					회원<a data-toggle="collapse" href="#collapseUser"><i
						class="material-icons" style="font-size: 18px">arrow_drop_uparrow_drop_down</i></a>
				</h2>
			</div>
			<div id="collapseUser" class="panel-collapse collapse in">
				<div class="list-group">
					<div>
						<a class="list-group-item"
							href="/springPro/adminJK/user/userInfo/selectList">회원리스트</a>
					</div>
<!-- 					<div> -->
<!-- 						<a class="list-group-item" -->
<!-- 							href="/springPro/adminJK/user/userByList/selectList">구매리스트</a> -->
<!-- 					</div> -->
					<div>
						<a class="list-group-item"
							href="/springPro/adminJK/user/userAlbum/selectList">마이앨범리스트</a>
					</div>
					<div>
						<a class="list-group-item"
							href="/springPro/adminJK/user/userTheme/selectList">유저테마리스트</a>
					</div>
				</div>
			</div>
		</div>

		<!-- 고객센터 -->
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h2 class="panel-title">
					고객센터<a data-toggle="collapseCustomer" href="#collapseCustomer"><i
						class="material-icons" style="font-size: 18px">arrow_drop_uparrow_drop_down</i></a>
				</h2>
			</div>
			<div id="collapseCustomer" class="panel-collapse collapse in">
				<div class="list-group">
					<div>
						<a class="list-group-item"
							href="/springPro/adminJK/customer/faq/selectList">faq리스트</a>
					</div>
					<div>
						<a class="list-group-item"
							href="/springPro/adminJK/customer/info/selectList">공지리스트</a>
					</div>
					<div>
						<a class="list-group-item"
							href="/springPro/adminJK/customer/userQuestion/selectList">1:1리스트</a>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
