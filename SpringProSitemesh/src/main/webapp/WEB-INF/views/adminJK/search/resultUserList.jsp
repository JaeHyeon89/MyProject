<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h3>회원 관리 페이지</h3>
${ pBean.startNum }
${ pBean.endNum }
<table class="table">
	<tr>
		<th>회원넘버</th>
		<th>아이디</th>
		<th>수정/삭제</th>
	</tr>
	<c:if test="${ userListc !=null }">
		<c:forEach var="user" begin="${ pBean.startNum }" end="${ pBean.endNum }"
			items="${ userListc }">
			<tr>
				<td>${ user.num }</td>
				<td>${ user.id }</td>
				<td><a href="updateOne?num=${ user.num }">수정</a> <a href="deleteOne?num=${ user.num }">삭제</a></td>
			</tr>
		</c:forEach>
	</c:if>
	<tr>
		<td colspan="3">
			<ul class="pager">
				<c:if test="${ pBean.pageGrade !=0 }">
					<li class="previous"><a href="?nowPage=${ pBean.startPage-pBean.showPageCnt }&search=${ pBean.search }">pre</a></li>
				</c:if>
				<c:forEach var="i" begin="${ pBean.startPage }" end="${ pBean.endPage }">
					<li><a href="?nowPage=${ i }&search=${ pBean.search }">${ i }</a></li>
				</c:forEach>
				<c:if
					test="${ pBean.oneCount==pBean.rcvCount }">
					<li class="next"><a href="?nowPage=${ pBean.startPage+pBean.showPageCnt }&search=${ pBean.search }">next</a></li>
				</c:if>
			</ul>
		<td>
	</tr>
</table>