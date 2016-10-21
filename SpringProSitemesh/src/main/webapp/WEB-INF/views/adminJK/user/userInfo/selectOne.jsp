<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table">
	<tr>
		<td>id</td>
		<td>${ bean.id }</td>
	</tr>
	<tr>
		<td>pw</td>
		<td>${ bean.pw }</td>
	</tr>
	<tr>
		<td>phone</td>
		<td>${ bean.phone }</td>
	</tr>
		<tr>
		<td>nickname</td>
		<td>${ bean.nickName }</td>
	</tr>
		<tr>
		<td>adult</td>
		<td>${ bean.adult }</td>
	</tr>
	<tr>
		<td>grade</td>
		<td>${ bean.grade }</td>
	</tr>
	<tr>
		<td>friends</td>
		<td>${ bean.friends }</td>
	</tr>
	<tr>
		<td>tagSelect</td>
		<td>${ bean.tagSelect }</td>
	</tr>
	<tr>
		<td>cash</td>
		<td>${ bean.cash }</td>
	</tr>
	<tr>
		<td>remainMusic</td>
		<td>${ bean.remainMusic }</td>
	</tr>
	<tr>
		<td>ticketEnd</td>
		<td>${  fn:substring(bean.ticketEnd,0,10)  }</td>
	</tr>
	<tr>
		<td>regDate</td>
		<td>${  fn:substring(bean.regDate,0,10)  }</td>
	</tr>
	<tr>
		<td><a onclick="goUpdate(${ bean.num })">수정</a> <a
			href="deleteOne?num=${ bean.num }">삭제</a></td>
	</tr>
</table>


1:1 문의 내역
<table class="table">
	<tr>
		<th>category</th>
		<th>title</th>
		<th>answer</th>
	</tr>
	<c:forEach var="each" items="${ listc }">
	<c:if test="${ bean.id == each.writer }">
	<tr>
		<td>${ each.category }</td>
		<td>${ each.title }</td>
		<td>
			<c:choose>
				<c:when test="${ each.answer==1 }">답변완료</c:when>
				<c:when test="${ each.answer==0 }">접수중</c:when>
				<c:otherwise>에러</c:otherwise>
			</c:choose>
		</td>
	</tr>
	</c:if>
	</c:forEach>
</table>