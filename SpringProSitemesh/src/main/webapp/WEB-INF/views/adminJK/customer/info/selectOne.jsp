<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<table class="table">
	<tr>
		<td>infoType</td>
		<td>${ bean.infoType }</td>
	</tr>
	<tr>
		<td>title</td>
		<td>${ bean.title }</td>
	</tr>
	<tr>
		<td>content</td>
		<td><textarea rows="20" cols="100" readonly="readonly" style="resize:none; border : none">${ bean.content }</textarea></td>
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
