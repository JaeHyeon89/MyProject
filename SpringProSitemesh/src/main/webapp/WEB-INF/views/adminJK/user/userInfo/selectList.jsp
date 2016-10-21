<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="/springPro/resources/httpRequest.js"></script>
<script type="text/javascript" src="/springPro/resources/modalInner.js"></script>

<h2>회원 관리 페이지</h2>
<a onclick="goInsert('gogogo')" class="btn btn-info btn-sm"><i class="material-icons">add_circle</i>등록</a>
<table class="table table-hover table-condensed">
	<tr>
		<th>회원넘버</th>
		<th>회원아이디</th>
		<th>회원닉네임</th>
		<th>성인인증</th>
		<th>등급(탈퇴)</th>
		<th>수정/삭제</th>
	</tr>
	<c:if test="${ listc !=null }">
		<c:forEach var="userInfo" begin="${ pBean.startNum }" end="${ pBean.endNum }"
			items="${ listc }">
			<tr>
				<td>${ userInfo.num }</td>
				<td><a onclick="goSelOne(${ userInfo.num },'gogogo')">${ userInfo.id }</a></td>
				<td>${ userInfo.nickName }</td>
				<td>
					<c:if test="${ userInfo.adult==1 }">O</c:if>
					<c:if test="${ userInfo.adult==0 }">X</c:if>
				</td>
				<td>
					<c:if test="${ userInfo.grade== -1 }">탈퇴</c:if>
					<c:if test="${ userInfo.grade== 0 }">일반</c:if>
					<c:if test="${ userInfo.grade== 99 }">관리자</c:if>
				</td>
				<td>
					<a onclick="goUpdate(${ userInfo.num },'gogogo')" class="btn btn-info btn-md" ><i class="material-icons">create</i>수정</a>
					<a href="deleteOne?num=${ userInfo.num }" class="btn btn-info btn-md"><i class="material-icons">remove_circle</i>삭제</a> &nbsp;
					<a href="미정?num=${ userInfo.num }" class="btn btn-info btn-md">상담기록</a>
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
 var path = "/springPro/adminJK/user/userInfo";
</script>
	