<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form action="/springPro/adminJK/music/genre/updateOne" method="post">
	<input type="hidden" name="num" value="${ bean.num }">
	<table class="table">
		<tr>
			<td>num</td>
			<td>${ bean.num }</td>
		</tr>
		<tr>
			<td>genre</td>
			<td><input type="text" name="genre" value="${ bean.genre}"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>