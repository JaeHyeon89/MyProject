<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script src="/springPro/resources/js/external/jquery/jquery.js"></script>
<script src="/springPro/resources/js/jquery-ui.js"></script>
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		function goTiDown(){
			frm.method="post";
			frm.action="tiMusicCharge";
			frm.submit();
		
		}
		
		
		function goCashDown(){
			frm.method="post";
			frm.action="cashMusicCharge";
			frm.submit();
		}
	</script>



<div align="center">

	<h2>음악 구매</h2>
	
	<table class="table" style="text-align: left;">
		<tr>
			<th>잔여 곡</th>
			<th>구매하실 곡 수</th>
			<th>재 다운로드</th>
			<th>차감 곡</th>
		</tr>
		<tr class="success">
			<td>${ user.remainMusic } 곡</td>
			<td>${ total } 곡</td>
			<td>${ reDown }곡</td>
			<td>${ total-reDown }곡</td>
		</tr>
	</table>
	
	<br>
	
	<table class="table" style="text-align: left;">
		<tr>
			<th>잔여 캐시</th>
			<th>구매하실 곡 수</th>
			<th>재 다운로드</th>
			<th>차감 캐시</th>
		</tr>
		<tr class="success">
			<td>${ user.cash } 캐시</td>
			<td>${ total } 곡</td>
			<td>${ reDown }곡</td>
			<td>${ (total-reDown)*musicPrice } 캐시</td>
		</tr>
	</table>
	
	
	<br>
	
	<form name="frm">
	
	<table class="table">
		<tr>
			<td>
			</td>
			<th>노래 제목</th>
			<th>앨범 제목</th>
			<th style="width: 150px">가수 이름</th>
			<th style="width: 100px; text-align: center;">재 다운</th>
		</tr>
		<c:forEach var="each" items="${ songList }">
			<tr class="info">
				<td>
					<input type="checkbox" name="num" value="${ each.num }" checked="checked" onclick="return false;">
				</td>
				<td>${ each.songName }</td>
				<td>${ each.albumName }</td>
				<td>${ each.artistName }</td>
				<td align="center">
				<c:forEach var="re" items="${ listc }">
					<c:if test="${ re==each.num }">	<!-- 중복 다운로드일때 -->
							<span style="color: green;" class="glyphicon glyphicon-ok"></span>
					</c:if>
				</c:forEach>
				</td>
				
			</tr>
		</c:forEach>
		
	</table>
	<br><br>
	<c:choose>
		<c:when test="${ user.remainMusic>=(total-reDown) }">	<!-- 이용권 구매가 가능할 때 -->
			<button type="button" class="btn btn-success" onclick="goTiDown()">이용권으로 구매하기</button>
		</c:when>
		<c:otherwise>	<!-- 이용권 구매가 불가능할 때 -->
			 <button type="button" class="btn btn-primary disabled">이용권이 부족합니다.</button>
		</c:otherwise>
	</c:choose>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<c:choose>
		<c:when test="${ user.cash >= (total-reDown)*musicPrice }"> <!-- 캐시 구매가 가능할 때 -->
			<button type="button" class="btn btn-success" onclick="goCashDown()">캐시로 구매하기</button>
		</c:when>
		<c:otherwise>	<!-- 캐시 구매가 불가능할 때 -->
			 <button type="button" class="btn btn-warning disabled">캐시가 부족합니다.</button>
		</c:otherwise>
	</c:choose>
	
	</form>
	
</div>
	



