<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<form action="/springPro/adminJK/customer/userQuestion/updateOne" method="post">
<input type="hidden" name="num" value="${ bean.num }">
<input type="hidden" name="writer" value="${ bean.writer }">
<input type="hidden" name="category" value="${ bean.category }">
<input type="hidden" name="title" value="${ bean.title }">
	<table class="table">
		<tr style="display: none;">
			<td>answer</td>
			<td><input type="number" name="answer"
				value="1"></td>
		</tr>
		<tr>
			<th>writer</th>
			<td>${ bean.writer }</td>
			<th>category</th>
			<td>${ bean.category }</td>
			<th>title</th>
			<td>${ bean.title }</td>
		</tr>
		<tr>
			<th>content</th>
			<td colspan="5">
<textarea rows="20" cols="100" name="content">
${ bean.content }
			
----------------------------------
문의 주셔서 감사합니다.
----------------------------------

여기는 답변 공간입니다.
여기는 답변 공간입니다.
여기는 답변 공간입니다.

이용해 주셔서 감사합니다.
좋은 하루 보내세요.

작성일 : <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${ now }"/>
</textarea>
		</tr>
		<tr>
			<td colspan="5"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>