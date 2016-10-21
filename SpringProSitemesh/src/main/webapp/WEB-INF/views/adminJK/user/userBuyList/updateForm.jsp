<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form action="/springPro/adminJK/user/userBuyList/updateOne" method="post">
	<table class="table">
		<tr>
			<td>num</td>
			<td><input type="number" name="num"
				value="${ bean.num }"></td>
		</tr>
		<tr>
			<td>classify</td>
			<td><input type="text" name="classify"
				value="${ bean.classify }"></td>
		</tr>
		<tr>
			<td>cashCharge</td>
			<td><input type="number" name="cashCharge"
				value="${ bean.cashCharge }"></td>
		</tr>
		<tr>
			<td>ticket</td>
			<td><input type="text" name="ticket"
				value="${ bean.ticket }"></td>
		</tr>
		<tr>
			<td>ticketEnd</td>
			<td><input type="datetime-local" name="ticketEnd"
				value="${ fn:substring(bean.ticketEnd,0,10) }"></td>
		</tr>		
		<tr>
			<td>chargeWay</td>
			<td><input type="text" name="chargeWay"
				value="${ bean.chargeWay }"></td>
		</tr>
		<tr>
			<td>buyMusic</td>
			<td><input type="number" name="buyMusic"
				value="${ bean.buyMusic }"></td>
		</tr>
		<tr>
			<td>buyArticle</td>
			<td><input type="number" name="buyArticle"
				value="${ bean.buyArticle }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>