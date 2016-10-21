<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1>유저입력폼</h1>

<form action="/springPro/adminJK/user/userInfo/insertOne" method="post" >
	<table class="table">
		<tr>
			<td>id</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>pw</td>
			<td><input type="text" name="pw"></td>
		</tr>
		<tr>
			<td>phone</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>nickname</td>
			<td><input type="text" name="nickName"></td>
		</tr>
		<tr>
			<td>adult</td>
			<td><input type="number" name="adult"></td>
		</tr>
		<tr>
			<td>grade</td>
			<td><input type="number" name="grade"></td>
		</tr>
		<tr>
			<td>friends</td>
			<td><input type="text" name="friends"></td>
		</tr>
		<tr>
			<td>tagSelect</td>
			<td><input type="number" name="tagSelect"></td>
		</tr>
		<tr>
			<td>cash</td>
			<td><input type="number" name="cash"></td>
		</tr>
		<tr>
			<td>remainMusic</td>
			<td><input type="number" name="remainMusic"></td>
		</tr>
		<tr>
			<td>ticketEnd</td>
			<td><input type="datetime-local" name="ticketEnd2"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>