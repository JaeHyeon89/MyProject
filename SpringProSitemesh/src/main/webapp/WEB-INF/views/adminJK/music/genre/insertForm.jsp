<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<h1>장르입력폼</h1>


<form action="/springPro/adminJK/music/genre/insertOne" method="post">
	<table class="table">
		<tr>
			<td>genre</td>
			<td><input type="text" name="genre"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>