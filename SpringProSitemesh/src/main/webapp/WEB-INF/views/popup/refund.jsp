<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <div class="modal-header" id="friendModal">
        <button type="button" class="close" data-dismiss="modal">x</button>
        <h4 class="modal-title">캐시 환불</h4>
      </div>
      <div class="modal-body">
      	<form name="refundForm" onsubmit="return false;" method="post">
      		<input type="hidden" name="num" value="${nowLogon.num }" />
      		<input type="hidden" name="classify" value="환불" />
      		
      		<table class="table">
      			<tr>
      				<th>환불 받으실 금액</th>
      				<td>
      					<input type="text" name="cashCharge" readonly="readonly" value="${ nowLogon.cash }" />
      				</td>
      			</tr>
      			<tr>
      				<th>계좌주</th>
      				<td>
			      		<input type="text" name="accountName">
      				</td>
      			</tr>
      			<tr>
      				<th>은행사</th>
      				<td>
      					<select name="accountBank">
      						<option value="KB">국민은행</option>
      						<option value="SH">신한은행</option>
      						<option value="NH">농협</option>
      					</select>
      				</td>
      			</tr>
      			<tr>
      				<th>계좌번호(-없이 입력)</th>
      				<td>
      					<input type="number" name="accountNum">
      				</td>
      			</tr>
      			<tr>
      				<td colspan="2">
      					<input type="checkbox" name="refundCheck" value="checkOk">환불 약관에 동의합니다.
      				</td>
      			</tr>
      			<tr>
      				<td>
      					<input type="button" id="refundConn" value="환불하기" />
      				</td>
      			</tr>
      		</table>
      	
      	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
      </div>




<script>
$("#refundConn").click(function() {
	var frm = document.refundForm;
	if(!$("input:checkbox[name='refundCheck']").is(":checked")){
		alert("약관 동의를 해주세요.");
		return;
	}
	
	frm.action = "/springPro/JH/04_myPage/cashRefund";
	frm.method = "post";
	frm.submit();
	
});


</script>





