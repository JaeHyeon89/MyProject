<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1>구매입력폼</h1>

<form action="/springPro/adminJK/user/userBuyList/insertOne" method="post" >
	<table class="table">
		<tr>
			<td>num</td>
			<td><input type="number" name="num"></td>
		</tr>
		<tr>
			<td>classify</td>
			<td><input type="text" name="classify"></td>
		</tr>
		<tr>
			<td>cashCharge</td>
			<td><input type="number" name="cashCharge"></td>
		</tr>
		<tr>
			<td>ticket</td>
			<td><input type="text" name="ticket"></td>
		</tr>
		<tr>
			<td>ticketEnd</td>
			<td><input type="date" name="ticketEnd"></td>
		</tr>
		<tr>
			<td>chargeWay</td>
			<td><input type="text" name="chargeWay"></td>
		</tr>
		<tr>
			<td>buyMusic</td>
			<td><input type="number" name="buyMusic"></td>
		</tr>
		<tr>
			<td>buyArticle</td>
			<td><input type="number" name="buyArticle"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>