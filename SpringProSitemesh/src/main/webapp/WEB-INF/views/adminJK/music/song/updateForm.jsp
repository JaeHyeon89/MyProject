<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<form action="/springPro/adminJK/music/song/updateOne" method="post"
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
			<td>songName</td>
			<td><input type="text" name="songName"
				value="${ bean.songName }"></td>
		</tr>
		<tr>
			<td>artistName</td>
			<td><input type="text" name="artistName"
				value="${ bean.artistName }"></td>
		</tr>
		<tr>
			<td>lyrics</td>
			<td><textarea name="lyrics" rows="5" cols="80">${ bean.lyrics }</textarea></td>
		</tr>
		<tr>
			<td>songIntro</td>
			<td><textarea name="songIntro" rows="2" cols="80">${ bean.songIntro }</textarea></td>
		</tr>
		<tr>
			<td>youtube</td>
			<td><input type="text" name="youtube"
				value="${ bean.youtube }"></td>
		</tr>
		<tr>
			<td>upfilePhoto : ${ bean.photoOrgName }</td>
			<td><input type="file" name="upfilePhoto"></td>
		</tr>
		<tr>
			<td>upfile : ${ bean.orgName }</td>
			<td><input type="file" name="upfile"></td>
		</tr>
		<tr>
			<td>musicStyle</td>
			<td>
			<c:forEach var="each" varStatus="i" items="${ listcG }">
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
			<td>themeTag</td>
			<td>
			<c:forEach var="each" varStatus="i" items="${ listcT }">
				<c:choose>
					<c:when test="${ fn:contains(bean.themeTag,each.theme) }">
						<label class="checkbox-inline"><input type="checkbox" name="theme" value="${ each.theme }" checked="checked">${ each.theme }</label>
					</c:when>
					<c:otherwise>
						<label class="checkbox-inline"><input type="checkbox" name="theme" value="${ each.theme }">${ each.theme }</label>
					</c:otherwise>
				</c:choose>
				<c:if test="${ i.count%5==0 }"><br></c:if>
			</c:forEach>
			</td>
		</tr>
		<tr>
			<td>recomCount</td>
			<td><input type="number" name="recomCount"
				value="${ bean.recomCount }"></td>
		</tr>
		<tr>
			<td>dateOfIssue</td>
			<td><input type="date" name="dateOfIssue"
				value="${ fn:substring(bean.dateOfIssue,0,10) }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>