<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<table class="table">
	<tr>
		<td>albumName</td>
		<td>${ bean.albumName }</td>
	</tr>
	<tr>
		<td>songName</td>
		<td>${ bean.songName }</td>
	</tr>
	<tr>
		<td>artistName</td>
		<td>${ bean.artistName }</td>
	</tr>
	<tr>
		<td>lyrics</td>
		<td>${ bean.lyrics }</td>
	</tr>
	<tr>
		<td>songIntro</td>
		<td>${ bean.songIntro }</td>
	</tr>
	<tr>
		<td>youtube</td>
		<td>${ bean.youtube }</td>
	</tr>
	<tr  style="display: none;">
		<td>upfilePhoto</td>
		<td>${ bean.photoOrgName }</td>
	</tr>
	<tr>
		<td>upfile : ${ bean.orgName }</td>
		<td>${ bean.orgName }</td>
	</tr>
	<tr>
		<td>musicStyle</td>
		<td>${ bean.musicStyle }</td>
	</tr>
	<tr>
		<td>themeTag</td>
		<td>${ bean.themeTag }</td>
	</tr>
	<tr>
		<td>recomCount</td>
		<td>${ bean.recomCount }</td>
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
