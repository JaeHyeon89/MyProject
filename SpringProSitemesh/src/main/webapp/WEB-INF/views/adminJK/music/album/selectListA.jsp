<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- Google Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script type="text/javascript" src="/springPro/resources/httpRequest.js"></script>
<script type="text/javascript" src="/springPro/resources/modalInner.js"></script>
</head>
<h2>미등록 앨범 관리 페이지</h2>
<a onclick="goInsert('gogogo')" class="btn btn-info btn-sm"><i class="material-icons">add_circle</i>등록</a>
<table class="table table-hover table-condensed">
	<tr>
		<th>앨범넘버</th>
		<th>앨범이름</th>
		<th>아티스트</th>
		<th>사진여부</th>
		<th>최종수정일</th>
		<th>수정/삭제</th>
	</tr>
	<c:if test="${ listc !=null }">
		<c:forEach var="album" begin="${ pBean.startNum }" end="${ pBean.endNum }"
			items="${ listc }">
			<tr>
				<td>${ album.num }</td>
				<td>
					<a onclick="goSelOne(${ album.num },'gogogo')">${ album.albumName }</a>
				</td>
				<td>${ album.artistName }</td>
				<td>
					<c:choose>
						<c:when test="${ album.photoSysName != 'none' }">O</c:when>
						<c:otherwise>X</c:otherwise>
					</c:choose>
				</td>
				<td>
					<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${ album.regDate }" />
				</td>
				<td>
					<a onclick="goUpdate(${ album.num },'gogogo')" class="btn btn-info btn-md" ><i class="material-icons">create</i>수정</a>
					<a href="deleteOne?num=${ album.num }" class="btn btn-info btn-md"><i class="material-icons">remove_circle</i>삭제</a>
				</td>
			</tr>
		</c:forEach>
	</c:if>
	<tr>
		<td colspan="3">
			<ul class="pager">
				<c:if test="${ pBean.pageGrade !=0 }">
					<li class="previous"><a href="?nowPage=${ pBean.startPage-pBean.showPageCnt }">pre</a></li>
				</c:if>
				<c:forEach var="i" begin="${ pBean.startPage }" end="${ pBean.endPage }">
					<li><a href="?nowPage=${ i }">${ i }</a></li>
				</c:forEach>
				<c:if
					test="${ pBean.oneCount==pBean.rcvCount }">
					<li class="next"><a href="?nowPage=${ pBean.startPage+pBean.showPageCnt }">next</a></li>
				</c:if>
			</ul>
		<td>
	</tr>
</table>








	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">관리자 모드</h4>
				</div>
				<div class="modal-body">

					<gogogo> </gogogo>

				</div>
				<div class="modal-footer">
				
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
 var path = "/springPro/adminJK/music/album";
</script>

