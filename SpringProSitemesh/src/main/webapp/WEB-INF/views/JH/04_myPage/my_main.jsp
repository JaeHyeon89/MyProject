<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <script type="text/javascript">
   	function menu1(){
   		location.href = "pwCheck";
   	}
   </script>
   
<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#home">마이 페이지</a></li>
	<li><a data-toggle="tab" onclick="menu1()">개인 정보 수정</a></li>
	<li><a data-toggle="tab" href="#menu2">캐시 확인</a></li>
	<li><a data-toggle="tab" href="#menu3">현재 적용중인 서비스</a></li>
	<li><a data-toggle="tab" href="#menu4">구매 내역 확인</a></li>
	<li><a data-toggle="tab" onclick="goUpdate(5)">친구 관리</a></li>
	<li><a data-toggle="tab" onclick="goUpdate(6)">나의 앨범</a></li>
</ul>   
   
 
<div class="tab-content">
	<div id="home" class="tab-pane fade in active">
<!-- 		<h3>마이 페이지</h3> -->
		<p>${ nowLogon.id } 님 환영해요~</p>
		
	</div>
	
	<div id="menu2" class="tab-pane fade">
<!-- 		<p>캐시 확인 페이지</p> -->
		<jsp:include page="/WEB-INF/views/JH/04_myPage/cashCheck.jsp" />
	</div>
	<div id="menu3" class="tab-pane fade">
<!-- 		<p>이용권 확인 페이지</p> -->
		<jsp:include page="/WEB-INF/views/JH/04_myPage/ticketCheck.jsp" />
	</div>
	<div id="menu4" class="tab-pane fade">
<!-- 		<p>구매 내역 확인 페이지</p> -->
		<jsp:include page="/WEB-INF/views/JH/04_myPage/buyList.jsp" />
	</div>
	
</div>












