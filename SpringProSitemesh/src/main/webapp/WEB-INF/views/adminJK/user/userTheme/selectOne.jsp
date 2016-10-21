<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<table class="table">
	<tr>
		<td>userNum</td>
		<td>${ bean.userNum }</td>
	</tr>
	<tr>
		<td>genre</td>
		<td>${ bean.genre }</td>
	</tr>
	<tr>
		<td>favorTheme</td>
		<td>${ bean.favorTheme }</td>
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
