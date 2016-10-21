<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h2>캐시 환불</h2>
<strong>주의! 한번 환불을 하면 취소가 불가능합니다.</strong><br>
<ul>
	<li>환불은 전액환불만 지원합니다.</li>
	<li>환불 처리방식은 오직 계좌이체만 가능합니다.</li>
	<li>환불이 처리되면 회원님의 계좌로 환불금액이 이체됩니다.</li>
	<li>환불에 소요되는 시간은 최장 1주일까지 걸릴 수 있습니다.</li>
</ul>

<h3>회원님이 환불받을 수 있는 캐시는 ${ nowLogon.cash }원 입니다.</h3>

<button type="button" onclick="cashRefund()">환불 진행하기</button>

<div id= "modalD" class="modal fade" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
        <!-- remote ajax call이 되는영역 -->
    </div>
  </div>
</div>


<script>
	function cashRefund(){
		$("#modalD").modal({remote : '/springPro/popup/refund'});
	}


	$('body').on('hidden.bs.modal', '.modal', function () {
		$(this).removeData('bs.modal');
	});
	

	
	
</script>









