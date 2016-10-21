<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form action="/springPro/adminJK/user/userAlbum/updateOne" method="post">
<input type="hidden" name="num" value="${ bean.num }">
	<table class="table">
		<tr>
			<td>userNum</td>
			<td><input type="number" name="userNum"
				value="${ bean.userNum }"></td>
		</tr>
		<tr>
			<td>albumName1</td>
			<td><input type="text" name="albumName1"
				value="${ bean.albumName1 }"></td>
		</tr>
		<tr>
			<td>albumName2</td>
			<td><input type="text" name="albumName2"
				value="${ bean.albumName2 }"></td>
		</tr>
		<tr>
			<td>albumName3</td>
			<td><input type="text" name="albumName3"
				value="${ bean.albumName3 }"></td>
		</tr>
		<tr>
			<td>albumContent1</td>
			<td><input type="text" name="albumContent1"
				value="${ bean.albumContent1 }"></td>
		</tr>
		<tr>
			<td>albumContent2</td>
			<td><input type="text" name="albumContent2"
				value="${ bean.albumContent2 }"></td>
		</tr>
		<tr>
			<td>albumContent3</td>
			<td><input type="text" name="albumContent3"
				value="${ bean.albumContent3 }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>