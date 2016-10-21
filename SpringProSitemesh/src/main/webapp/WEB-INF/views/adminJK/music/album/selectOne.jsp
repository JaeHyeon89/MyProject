<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table class="table">
	<tr>
		<td>albumName</td>
		<td>${ bean.albumName }</td>
	</tr>
	<tr>
		<td>artistName</td>
		<td>${ bean.artistName }</td>
	</tr>
	<tr>
		<td>upfilePhoto</td>
		<td>${ bean.photoOrgName }</td>
	</tr>
	<tr style="display: none;">
		<td>upfile : ${ bean.orgName }</td>
		<td>${ bean.orgName }</td>
	</tr>
	<tr>
		<td>musicStyle</td>
		<td>${ bean.musicStyle }</td>
	</tr>
	<tr>
		<td>albumIntro</td>
		<td>${ bean.albumIntro }</td>
	</tr>
	<tr>
		<td>recomCount</td>
		<td>${ bean.recomCount }</td>
	</tr>
	<tr>
		<td>totalCount</td>
		<td>${ bean.totalCount }</td>
	</tr>
	<tr>
		<td>avgCount</td>
		<td>${ bean.avgCount }</td>
	</tr>
	<tr>
		<td>dateOfIssue</td>
		<td>${  fn:substring(bean.dateOfIssue,0,10)  }</td>
	</tr>
	<tr>
		<td><a onclick="goUpdate(${ bean.num })">수정</a> <a
			href="deleteOne?num=${ bean.num }">삭제</a></td>
	</tr>
</table>

<jsp:include page="commentSelectList.jsp"></jsp:include>
