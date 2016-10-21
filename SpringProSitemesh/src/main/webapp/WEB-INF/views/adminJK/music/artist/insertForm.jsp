<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1>아티스트입력폼</h1>

<form action="/springPro/adminJK/music/artist/insertOne" method="post" 
	enctype="multipart/form-data">
	<table class="table">
		<tr>
			<td>artistName</td>
			<td><input type="text" name="artistName"></td>
		</tr>
		<tr>
			<td>member</td>
			<td><input type="text" name="member"></td>
		</tr>
		<tr>
			<td>nationality</td>
			<td><input type="text" name="nationality"></td>
		</tr>
		<tr>
			<td>upfilePhoto</td>
			<td><input type="file" name="upfilePhoto"></td>
		</tr>
		<tr style="display: none;">
			<td>upfile</td>
			<td><input type="file" name="upfile"></td>
		</tr>
		<tr>
			<td>debut</td>
			<td><input type="date" name="debut"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>