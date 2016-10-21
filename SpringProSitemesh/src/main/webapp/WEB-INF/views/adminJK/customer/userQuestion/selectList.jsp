<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="/springPro/resources/httpRequest.js"></script>
<script type="text/javascript" src="/springPro/resources/modalInner.js"></script>

<h2>1:1 관리 페이지</h2>
<a onclick="goInsert('gogogo')" class="btn btn-info btn-sm"><i class="material-icons">add_circle</i>등록</a>
<table class="table table-hover table-condensed">
	<tr>
		<th>1:1넘버</th>
		<th>1:1카테고리</th>
		<th>1:1타이틀</th>
		<th>1:1이름</th>
		<th>답변여부</th>
		<th>수정/삭제</th>
	</tr>
	<c:if test="${ listc !=null }">
		<c:forEach var="userQuestion" begin="${ pBean.startNum }" end="${ pBean.endNum }"
			items="${ listc }">
			<tr>
				<td>${ userQuestion.num }</td>
				<td>${ userQuestion.category }</td>
				<td><a onclick="goSelOne(${ userQuestion.num },'gogogo')">${ userQuestion.title }</a></td>
				<td>${ userQuestion.writer }</td>
				<td>
					<c:choose>
						<c:when test="${ userQuestion.answer == 1 }">O</c:when>
						<c:when test="${ userQuestion.answer == 0 }">X</c:when>
						<c:otherwise>#.에러 : 이거슨 답변을 한것도 안한것도 아님!</c:otherwise>
					</c:choose>
				</td>
				<td>
					<a onclick="goUpdate(${ userQuestion.num },'gogogo')" class="btn btn-info btn-md" ><i class="material-icons">create</i>답변달기</a>
					<a href="deleteOne?num=${ userQuestion.num }" class="btn btn-info btn-md"><i class="material-icons">remove_circle</i>삭제</a>
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
 var path = "/springPro/adminJK/customer/userQuestion";
</script>
	