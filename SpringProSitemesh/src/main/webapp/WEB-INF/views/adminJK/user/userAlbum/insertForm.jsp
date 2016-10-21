<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1>유저앨범입력폼</h1>

<form action="/springPro/adminJK/user/userAlbum/insertOne" method="post" >
	<table class="table">
		<tr>
			<td>userNum</td>
			<td><input type="number" name="userNum"></td>
		</tr>
		<tr>
			<td>albumName1</td>
			<td><input type="text" name="albumName1"></td>
		</tr>
		<tr>
			<td>albumName2</td>
			<td><input type="text" name="albumName2"></td>
		</tr>
		<tr>
			<td>albumName3</td>
			<td><input type="text" name="albumName3"></td>
		</tr>
		<tr>
			<td>albumContent1</td>
			<td><input type="text" name="albumContent1"></td>
		</tr>
		<tr>
			<td>albumContent2</td>
			<td><input type="text" name="albumContent2"></td>
		</tr>
		<tr>
			<td>albumContent3</td>
			<td><input type="text" name="albumContent3"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>