<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form action="/springPro/adminJK/music/artist/updateOne" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="num" value="${ bean.num }">
	<input type="hidden" name="photoOrgName" value="${ bean.photoOrgName }">
	<input type="hidden" name="photoSysName" value="${ bean.photoSysName }">
	<input type="hidden" name="orgName" value="${ bean.orgName }">
	<input type="hidden" name="sysName" value="${ bean.sysName }">
	<table class="table">
		<tr>
			<td>artistName</td>
			<td><input type="text" name="artistName"
				value="${ bean.artistName }"></td>
		</tr>
		<tr>
			<td>member</td>
			<td><input type="text" name="member" value="${ bean.member }"></td>
		</tr>
		<tr>
			<td>nationality</td>
			<td><input type="text" name="nationality"
				value="${ bean.nationality }"></td>
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
			<td>debut</td>
			<td><input type="datetime-local" name="debut"
				value="${ fn:substring(bean.debut,0,10) }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>