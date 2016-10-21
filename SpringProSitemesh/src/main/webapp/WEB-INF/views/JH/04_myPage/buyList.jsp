<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<h3>구매 내역</h3>

<c:choose>
	<c:when test="${ buyList != null }">
		<table class="table" border="1" style="text-align: center; table-layout: fixed;">
			<tr>
				<th>번 호</th>
				<th>분 류</th>
				<th>내 역</th>
				<th>결제 방식</th>
				<th>결 제 일</th>
			</tr>		
			
			<c:forEach var="each" items="${ buyList }" varStatus="status">
			<tr>
				<td>
					${status.count }
				</td>
				<td>
					${ each.classify }
				</td>
				<td>
					${ each.content }
				</td>
				<td>
					${ each.chargeWay }
				</td>
				<td>
					${ each.regDate } 
				</td>
			</tr>
			</c:forEach>
			
		</table>
	</c:when>
	<c:otherwise>
		<h3>구매 내역이 존재하지 않습니다.</h3>
	
	</c:otherwise>

</c:choose>






