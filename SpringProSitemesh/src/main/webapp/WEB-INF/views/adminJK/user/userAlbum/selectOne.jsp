<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<table class="table">
	<tr>
		<td>userNum</td>
		<td>${ bean.userNum }</td>
	</tr>
	<tr>
		<td>albumName1</td>
		<td>${ bean.albumName1 }</td>
	</tr>
	<tr>
		<td>albumName2</td>
		<td>${ bean.albumName2 }</td>
	</tr>
	<tr>
		<td>albumName3</td>
		<td>${ bean.albumName3 }</td>
	</tr>
	<tr>
		<td>albumContent1</td>
		<td>${ bean.albumContent1 }</td>
	</tr>
		<tr>
		<td>albumContent2</td>
		<td>${ bean.albumContent2 }</td>
	</tr>
		<tr>
		<td>albumContent3</td>
		<td>${ bean.albumContent3 }</td>
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
