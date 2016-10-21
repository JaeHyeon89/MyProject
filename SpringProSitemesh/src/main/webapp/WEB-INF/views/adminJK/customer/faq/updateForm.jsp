<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form action="/springPro/adminJK/customer/faq/updateOne" method="post">
<input type="hidden" name="num" value="${ bean.num }">
	<table class="table">
		<tr>
			<td>category</td>
			<td><input type="text" name="category"
				value="${ bean.category }"></td>
		</tr>
		<tr>
			<td>category</td>
			<td><select name="category">
					<option value="${ bean.category }">${ bean.category }</option>
					<option value="회원가입/변경/탈퇴">회원가입/변경/탈퇴</option>
					<option value="음악재생">음악재생</option>
					<option value="결제/환불">결제/환불</option>
			</select></td>
		</tr>
		<tr>
			<td>title</td>
			<td><input type="text" name="title"
				value="${ bean.title }"></td>
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