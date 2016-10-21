<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<h2>코멘트 페이지</h2>
<table class="table table-hover table-condensed">
	<tr>
		<th>코멘트 내용</th>
		<th>코멘트 작성자</th>
		<th>삭제</th>
	</tr>
	<c:if test="${ listc !=null }">
		<c:forEach var="albumComment" items="${ listc }">
			<tr>
				<td>${ albumComment.writer }</td>
				<td>${ albumComment.content }</td>
				<td>
					<a href="comment/deleteOne?num=${ albumComment.num }" class="btn btn-info btn-sm"><i class="material-icons">remove_circle</i>삭제</a>
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>


