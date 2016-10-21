<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h3>현재 적용중인 이용권 확인 페이지</h3>
<br><br><br>
<jsp:useBean id="toDay" class="java.util.Date" />


<fmt:formatDate var="fmtTicketEnd" value="${ ticketEnd }" type="both" pattern="yyyy년 MM월 dd일 E요일 HH시mm분 " />

<fmt:formatDate var="now" value="${toDay}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />


<c:choose>
	<c:when test="${ ticketEnd > toDay }">
		<!-- 아직 유효기간이다 -->
		회원님의 티켓 종료일은 
		<h3>${ fmtTicketEnd }</h3>
		까지 입니다.<br><br><br><br>
		<button id="" class="btn btn-success">동결하기</button>
		<a href="#" title="동결하기란 무엇인가요?" data-toggle="popover" data-placement="bottom" data-trigger="focus"
		data-content="'동결하기'란 이용권을 구매하였으나 회원님의 개인적인 사정으로 한동안 접속을 못할 경우를 대비해
					30일동안 이용권을 잠금상태로 바꾸는것을 의미합니다. '동결하기'는 한달에 한번만 가능합니다.">동결하기란?</a>
	</c:when>
	<c:otherwise>
		<h3>현재 적용중인 이용권이 없습니다.</h3>
		<a href="/springPro/buyPage"><button id="" class="btn btn-info">이용권 구매하러 가기</button></a>
	</c:otherwise>
</c:choose>





<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>



