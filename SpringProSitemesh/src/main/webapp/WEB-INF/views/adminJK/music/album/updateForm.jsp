<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<form action="/springPro/adminJK/music/album/updateOne" method="post" 
	enctype="multipart/form-data">
	<input type="hidden" name="num" value="${ bean.num }">
	<input type="hidden" name="photoOrgName" value="${ bean.photoOrgName }">
	<input type="hidden" name="photoSysName" value="${ bean.photoSysName }">
	<input type="hidden" name="orgName" value="${ bean.orgName }">
	<input type="hidden" name="sysName" value="${ bean.sysName }">
	<table class="table">
		<tr>
			<td>albumName</td>
			<td><input type="text" name="albumName"
				value="${ bean.albumName }"></td>
		</tr>
		<tr>
			<td>artistName</td>
			<td><input type="text" name="artistName"
				value="${ bean.artistName }"></td>
		</tr>
		<tr>
			<td>upfilePhoto : ${ bean.photoOrgName }</td>
			<td><input type="file" name="upfilePhoto"></td>
		</tr>
		<tr style="display: none;">
			<td>upfile : ${ bean.orgName }</td>
			<td><input type="file" name="upfile"></td>
		</tr>
		<tr>
			<td>musicStyle</td>
			<td>
			<c:forEach var="each" varStatus="i" items="${ listc }">
				<c:choose>
					<c:when test="${ fn:contains(bean.musicStyle,each.genre) }">
						<label class="checkbox-inline"><input type="checkbox" name="genre" value="${ each.genre }" checked="checked">${ each.genre }</label>
					</c:when>
					<c:otherwise>
						<label class="checkbox-inline"><input type="checkbox" name="genre" value="${ each.genre }">${ each.genre }</label>
					</c:otherwise>
				</c:choose>
				<c:if test="${ i.count%5==0 }"><br></c:if>
			</c:forEach>
			</td>
		</tr>
		<tr>
			<td>albumIntro</td>
			<td><textarea name="albumIntro" rows="2" cols="80">${ bean.albumIntro }</textarea></td>
		</tr>
		<tr>
			<td>recomCount</td>
			<td><input type="number" name="recomCount"
				value="${ bean.recomCount }"></td>
		</tr>
		<tr>
			<td>totalCount</td>
			<td><input type="number" name="totalCount"
				value="${ bean.totalCount }"></td>
		</tr>
		<tr style="display: none;">
			<td>avgCount</td>
			<td><input type="number" name="avgCount"
				value="1"></td>
		</tr>
		<tr>
			<td>dateOfIssue</td>
			<td><input type="date" name="dateOfIssue"
				value="${ fn:substring(bean.dateOfIssue,0,10) }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"
				value="${ bean.num }"></td>
		</tr>
	</table>
</form>