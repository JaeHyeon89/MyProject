<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<form action="/springPro/adminJK/customer/info/updateOne" method="post">
<input type="hidden" name="num" value="${ bean.num }">
	<table class="table">
		<tr>
			<td>infoType</td>
			<td><input type="text" name="infoType"
				value="${ bean.infoType }"></td>
		</tr>
		<tr>
			<td>infoType</td>
			<td><select name="infoType">
					<option value="${ bean.category }">${ bean.category }</option>
					<option value="이벤트">이벤트</option>
					<option value="공지사항">공지사항</option>
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