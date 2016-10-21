<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1>info입력폼</h1>

<form action="/springPro/adminJK/customer/info/insertOne" method="post" >
	<table class="table">
		<tr>
			<td>infoType</td>
			<td><select name="infoType">
					<option value="이벤트">이벤트</option>
					<option value="공지사항">공지사항</option>
			</select></td>
		</tr>
		<tr>
			<td>title</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>content</td>
			<td><textarea rows="20" cols="100" name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>