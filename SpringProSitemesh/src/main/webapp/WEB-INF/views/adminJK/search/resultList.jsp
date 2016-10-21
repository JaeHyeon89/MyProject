<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>


<h2>검색 결과 화면</h2>

<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#home">전체</a></li>
	<li><a data-toggle="tab" href="#menu1">앨범</a></li>
	<li><a data-toggle="tab" href="#menu2">곡</a></li>
	<li><a data-toggle="tab" href="#menu3">아티스트</a></li>
	<li><a data-toggle="tab" href="#menu4">회원</a></li>
</ul>

<div class="tab-content">
	<div id="home" class="tab-pane fade in active">
		<h3>전체</h3>
		<div class="row">
			<div class="col-md-3">
				<page:applyDecorator name="resultAlbumList" />
			</div>
			<div class="col-md-3">
				<page:applyDecorator name="resultSongList" />
			</div>
			<div class="col-md-3">
				<page:applyDecorator name="resultArtistList" />
			</div>
			<div class="col-md-3">
				<page:applyDecorator name="resultUserList" />
			</div>
		</div>
	</div>
	<div id="menu1" class="tab-pane fade">
		<h3>앨범</h3>
		<page:applyDecorator name="resultAlbumList" />
	</div>
	<div id="menu2" class="tab-pane fade">
		<h3>곡</h3>
		<page:applyDecorator name="resultSongList" />
	</div>
	<div id="menu3" class="tab-pane fade">
		<h3>곡</h3>
		<page:applyDecorator name="resultArtistList" />
	</div>
	<div id="menu4" class="tab-pane fade">
		<h3>회원</h3>
		<page:applyDecorator name="resultUserList" />
	</div>
</div>
