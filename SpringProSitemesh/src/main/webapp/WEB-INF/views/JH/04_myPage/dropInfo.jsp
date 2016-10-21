<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="btn-group">
  <button type="button" class="btn btn-primary" onclick="goUpdate(1)">개인 정보 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(2)">비밀번호 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(3)">장르/태그 등록 및 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(4)">회원 탈퇴</button>
</div>


<h3>회원 탈퇴 페이지</h3>

<div style="border-top: 2px solid black; padding: 20px 10px 10px 50px; width : 60%;">
<h4><strong>주의! 탈퇴 전 반드시 읽어주세요.</strong></h4>
		
		
		<p>개인정보 보호법에 의해, 탈퇴 시 회원정보 복구가 불가능합니다.</p>

		<p>회원 탈퇴 시, 잔여 캐시는 모두 소멸합니다. </p>

		<p>회원 탈퇴 시, 현재 적용중인 이용권 역시 소멸합니다.</p>
		
		<p>추후 재 가입시, 동일한 아이디로 가입하실 수 없습니다.</p>
		
		<p>회원님이 남긴 1:1 문의 기록 또한 사라집니다.</p>
		
		<p>위 사항을 다시 한번 읽어주시길 바랍니다.</p>



<form name="dropConn" onsubmit="return false;" method="post">
<input type="hidden" value="${ nowLogon.num }" name="num" />
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">탈퇴</button>
</form>
</div>





<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">회원 탈퇴</h4>
      </div>
      <div class="modal-body">
        <p>정말 탈퇴하시겠습니까?</p>
      </div>
      <div class="modal-footer">
    	<button id="goDrop" type="button" class="btn btn-default">탈퇴</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>

  </div>
</div>

<script>
	$("#goDrop").click(function() {
		var frm = document.dropConn;
		frm.action = "/springPro/JH/04_myPage/dropInfo";
		frm.method="post";
		frm.submit();
	})

</script>


