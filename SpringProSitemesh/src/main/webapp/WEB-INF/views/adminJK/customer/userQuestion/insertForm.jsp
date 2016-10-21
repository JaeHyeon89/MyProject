<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1>유저질문입력폼</h1>

<form action="/springPro/adminJK/customer/userQuestion/insertOne" method="post" >
	<table class="table">
		<tr>
			<td>answer</td>
			<td><input type="number" name="answer"></td>
		</tr>
		<tr>
			<td>writer</td>
			<td><input type="text" name="writer"></td>
		</tr>
		<tr>
			<td>category</td>
			<td><input type="text" name="category"></td>
		</tr>
		<tr>
			<td>title</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>content</td>
			<td><textarea rows="20" cols="100" name="content">${ bean.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>