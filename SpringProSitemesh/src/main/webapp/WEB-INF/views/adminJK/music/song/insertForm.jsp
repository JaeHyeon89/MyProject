<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>송입력폼</h1>

<form action="/springPro/adminJK/music/song/insertOne" method="post" 
	enctype="multipart/form-data">
	<table class="table">
		<tr>
			<td>albumName</td>
			<td><input type="text" name="albumName"></td>
		</tr>
		<tr>
			<td>songName</td>
			<td><input type="text" name="songName"></td>
		</tr>
		<tr>
			<td>artistName</td>
			<td><input type="text" name="artistName"></td>
		</tr>
		<tr>
			<td>lyrics</td>
			<td><textarea name="lyrics" rows="5" cols="80"></textarea> </td>
		</tr>
		<tr>
			<td>songIntro</td>
			<td><textarea name="songIntro" rows="2" cols="80"></textarea></td>
		</tr>
				<tr>
			<td>youtube</td>
			<td><input type="text" name="youtube"></td>
		</tr>
		<tr>
			<td>upfilePhoto</td>
			<td><input type="file" name="upfilePhoto"></td>
		</tr>
		<tr>
			<td>upfile</td>
			<td><input type="file" name="upfile"></td>
		</tr>
		<tr>
			<td>musicStyle</td>
			<td>
			<c:forEach var="each" varStatus="i" items="${ listcG }">
				<label class="checkbox-inline"><input type="checkbox" name="genre" value="${ each.genre }">${ each.genre }</label>
				<c:if test="${ i.count%5==0 }"><br></c:if>
			</c:forEach>
			</td>
		</tr>
		<tr>
			<td>themeTag</td>
			<td>
			<c:forEach var="each" varStatus="i" items="${ listcT }">
				<label class="checkbox-inline"><input type="checkbox" name="theme" value="${ each.theme }">${ each.theme }</label>
				<c:if test="${ i.count%5==0 }"><br></c:if>
			</c:forEach>
			</td>
		</tr>
		<tr>
			<td>recomCount</td>
			<td><input type="number" name="recomCount"></td>
		</tr>
		<tr>
			<td>dateOfIssue</td>
			<td><input type="date" name="dateOfIssue"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>