<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<h1>테마입력폼</h1>


<form action="/springPro/adminJK/music/theme/insertOne" method="post">
	<table class="table">
		<tr>
			<td>theme</td>
			<td><input type="text" name="theme"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>