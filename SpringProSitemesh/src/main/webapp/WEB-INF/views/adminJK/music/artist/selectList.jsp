<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="/springPro/resources/httpRequest.js"></script>
<script type="text/javascript" src="/springPro/resources/modalInner.js"></script>

<h2>아티스트 관리 페이지</h2>
<a onclick="goInsert('gogogo')" class="btn btn-info btn-sm"><i class="material-icons">add_circle</i>등록</a>
<table class="table table-hover table-condensed">
	<tr>
		<th>아티스트넘버</th>
		<th>아티스트이름</th>
		<th>사진여부</th>
		<th>수정/삭제</th>
	</tr>
	<c:if test="${ listc !=null }">
		<c:forEach var="artist" begin="${ pBean.startNum }" end="${ pBean.endNum }"
			items="${ listc }">
			<tr>
				<td>${ artist.num }</td>
				<td><a onclick="goSelOne(${ artist.num },'gogogo')">${ artist.artistName }</a></td>
				<td>
					<c:choose>
						<c:when test="${ artist.photoSysName != 'none' }">O</c:when>
						<c:otherwise>X</c:otherwise>
					</c:choose>
				</td>
				<td>
					<a onclick="goUpdate(${ artist.num },'gogogo')" class="btn btn-info btn-md" ><i class="material-icons">create</i>수정</a>
					<a href="deleteOne?num=${ artist.num }" class="btn btn-info btn-md"><i class="material-icons">remove_circle</i>삭제</a>
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
 var path = "/springPro/adminJK/music/artist";
</script>
	