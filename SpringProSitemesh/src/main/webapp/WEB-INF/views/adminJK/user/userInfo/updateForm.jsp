<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form action="/springPro/adminJK/user/userInfo/updateOne" method="post">
<input type="hidden" name="num" value="${ bean.num }">
	<table class="table">
		<tr>
			<td>id</td>
			<td><input type="text" name="id"
				value="${ bean.id }"></td>
		</tr>
		<tr>
			<td>pw</td>
			<td><input type="text" name="pw"
				value="${ bean.pw }"></td>
		</tr>
		<tr>
			<td>phone</td>
			<td><input type="text" name="phone"
				value="${ bean.phone }"></td>
		</tr>
		<tr>
			<td>nickname</td>
			<td><input type="text" name="nickname"
				value="${ bean.nickName }"></td>
		</tr>
		<tr>
			<td>adult</td>
			<td><input type="number" name="adult"
				value="${ bean.adult }"></td>
		</tr>
		<tr>
			<td>grade</td>
			<td><input type="number" name="grade"
				value="${ bean.grade }"></td>
		</tr>
		<tr>
			<td>friends</td>
			<td><input type="text" name="friends"
				value="${ bean.friends }"></td>
		</tr>
		<tr>
			<td>tagSelect</td>
			<td><input type="number" name="tagSelect"
				value="${ bean.tagSelect }"></td>
		</tr>
		<tr>
			<td>cash</td>
			<td><input type="number" name="cash"
				value="${ bean.cash }"></td>
		</tr>
		<tr>
			<td>remainMusic</td>
			<td><input type="number" name="remainMusic"
				value="${ bean.remainMusic }"></td>
		</tr>
		<tr>
			<td>ticketEnd</td>
			<td><input type="datetime-local" name="ticketEnd2"
				value="${ fn:substring(bean.ticketEnd,0,10) }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>