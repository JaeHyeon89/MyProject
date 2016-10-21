<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1>유저테마입력폼</h1>

<form action="/springPro/adminJK/user/userTheme/insertOne" method="post" >
	<table class="table">
		<tr>
			<td>userNum</td>
			<td><input type="number" name="userNum"></td>
		</tr>
		<tr>
			<td>genre</td>
			<td><input type="text" name="genre"></td>
		</tr>
		<tr>
			<td>favorTheme</td>
			<td><input type="text" name="favorTheme"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>