<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<table class="table">
	<tr>
		<td>num</td>
		<td>${ bean.num }</td>
	</tr>
	<tr>
		<td>classify</td>
		<td>${ bean.classify }</td>
	</tr>
	<tr>
		<td>cashCharge</td>
		<td>${ bean.cashCharge }</td>
	</tr>
		<tr>
		<td>ticket</td>
		<td>${ bean.ticket }</td>
	</tr>
		<tr>
		<td>ticketEnd</td>
		<td>${ bean.ticketEnd }</td>
	</tr>
	<tr>
		<td>chargeWay</td>
		<td>${ bean.chargeWay }</td>
	</tr>
	<tr>
		<td>buyMusic</td>
		<td>${ bean.buyMusic }</td>
	</tr>
	<tr>
		<td>buyArticle</td>
		<td>${ bean.buyArticle }</td>
	</tr>
	<tr>
		<td>regDate</td>
		<td>${  fn:substring(bean.regDate,0,10)  }</td>
	</tr>
	<tr>
		<td><a onclick="goUpdate(${ bean.num })">수정</a> <a
			href="deleteOne?num=${ bean.num }">삭제</a></td>
	</tr>
</table>
