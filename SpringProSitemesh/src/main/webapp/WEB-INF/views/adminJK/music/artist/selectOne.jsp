<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<table class="table">
	<tr>
		<td>artistName</td>
		<td>${ bean.artistName }</td>
	</tr>
		<tr>
		<td>member</td>
		<td>${ bean.member }</td>
	</tr>
		<tr>
		<td>nationality</td>
		<td>${ bean.nationality }</td>
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
		<td>debut</td>
		<td>${  fn:substring(bean.debut,0,10)  }</td>
	</tr>
	<tr>
		<td><a onclick="goUpdate(${ bean.num })">수정</a> <a
			href="deleteOne?num=${ bean.num }">삭제</a></td>
	</tr>
</table>
