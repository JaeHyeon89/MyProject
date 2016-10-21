<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table">
	<tr>
		<td>answer</td>
		<td><c:choose>
				<c:when test="${ bean.answer == 1 }">답변완료</c:when>
				<c:when test="${ bean.answer == 0 }">접수중</c:when>
				<c:otherwise>#.에러 : 이거슨 답변을 한것도 안한것도 아님!</c:otherwise>
			</c:choose></td>
	</tr>
	<tr>
		<td>writer</td>
		<td>${ bean.writer }</td>
	</tr>
	<tr>
		<td>category</td>
		<td>${ bean.category }</td>
	</tr>
	<tr>
		<td>title</td>
		<td>${ bean.title }</td>
	</tr>
	<tr>
		<td>content</td>
		<td><textarea rows="20" cols="100" readonly="readonly" style="resize:none; border : none">${ bean.content }</textarea> </td>
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
