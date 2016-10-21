<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#customHome">공지사항</a></li>
	<li><a data-toggle="tab" href="#custom1">FAQ</a></li>
	<li><a data-toggle="tab" href="#custom2">1:1 문의하기</a></li>
</ul>

<h2>고객센터</h2>

<div class="tab-content">
	<div id="customHome" class="tab-pane fade in active">
		<jsp:include page="/WEB-INF/views/JH/03_customer/info.jsp" />
	</div>
	<div id="custom1" class="tab-pane fade">
		<jsp:include page="/WEB-INF/views/JH/03_customer/FAQ_Main.jsp" />
	</div>
	<div id="custom2" class="tab-pane fade">
		<jsp:include page="/WEB-INF/views/JH/03_customer/manToMan.jsp" />
	</div>
</div>












