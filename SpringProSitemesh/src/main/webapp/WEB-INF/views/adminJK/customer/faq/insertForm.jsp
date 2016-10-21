<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1>faq입력폼</h1>

<form action="/springPro/adminJK/customer/faq/insertOne" method="post" >
	<table class="table">
		<tr>
			<td>category</td>
			<td><select name="category">
					<option value="회원가입/변경/탈퇴">회원가입/변경/탈퇴</option>
					<option value="음악재생">음악재생</option>
					<option value="결제/환불">결제/환불</option>
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