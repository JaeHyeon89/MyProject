<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h3>비밀번호 재확인</h3>
<form action="pwCheck" method="post">
<table class="table" border="1">
  <tr>
    <th>아 이 디</th>
     <td>
    	<input type="text" readonly="readonly" value="${ nowLogon.id }" name="id" />
    </td>
    
  </tr>
  <tr>
   	<th>비밀 번호</th>
    <td>
    	<input type="password"  name="pw" />
    </td>
  </tr>
  <tr>
  	<td colspan="2">
  		<input type="submit" value="확인" />
  	</td> 
  </tr>
</table>
</form>













