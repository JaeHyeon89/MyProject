<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <h2>비밀번호 찾기</h2>
    <p><strong>회원 가입 당시에</strong> 적었던 정보를 입력해주세요.</p>
    <form name="pwFindForm" onsubmit="return false;" method="post">
    <table class="table">
		<tr>
			<th>아이디(이메일)</th>
			<td>
				<input type="text" name="id" maxlength="15">
			</td>
		</tr>
    	<tr>
    		<th>휴대폰</th>
    		<td>
    			<input type="text" readonly="readonly" 
    				readonly="readonly" id="phone1" name="phone" size="10" >
    			<button type="button" id="phoneCheck00" >인증하기</button>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<button type="button" onclick="findPw()">비밀번호 찾기</button>
    		</td>
    	</tr>
    </table>
    </form>
    
    
    
    
<div id= "modalA" class="modal fade" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
        <!-- remote ajax call이 되는영역 -->
    </div>
  </div>
</div>


<script>

	$(function(){
		$("#phoneCheck00").click(function(){
			$("#modalA").modal({remote : '/springPro/popup/phoneChargeForm'});
		});
	})
	$('body').on('hidden.bs.modal', '.modal', function () {
		$(this).removeData('bs.modal');
	});

	function findPw(){
		var frm = document.pwFindForm;
		
		var id = frm.id.value;
		var phone = frm.phone.value;
		if(id == null || id == ""){
			alert("아이디를 입력해주세요");
			return;
		}
		if(phone == null || phone == ""){
			alert("휴대폰 인증을 해주세요");
			return;
		}
		
		frm.action="/springPro/JH/02_log/pwFind";
		frm.method = "post";
		frm.submit();
	}
	
	
</script>




















