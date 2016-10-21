<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <h2>아이디 찾기</h2>
    <p><strong>회원 가입 당시에</strong> 적었던 휴대폰 번호를 입력해주세요.</p>
    <form name="idFindForm" onsubmit="return false;" method="post">
    <div align="center">
  		<button type="button" id="phoneCheck00" >휴대폰으로 아이디 찾기</button>
    </div>
    </form>
    
    
    
    
<div id= "modalE" class="modal fade" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
        <!-- remote ajax call이 되는영역 -->
    </div>
  </div>
</div>


<script>

	$(function(){
		$("#phoneCheck00").click(function(){
			$("#modalE").modal({remote : '/springPro/popup/idFind_phone'});
		});
	})
	$('body').on('hidden.bs.modal', '.modal', function () {
		$(this).removeData('bs.modal');
	});

	function findId(){
	
		
		var phone = frm.phone.value;
		
		if(phone == null || phone == ""){
			alert("휴대폰 인증을 해주세요");
			return;
		}
		
		
	}
	
	
</script>









