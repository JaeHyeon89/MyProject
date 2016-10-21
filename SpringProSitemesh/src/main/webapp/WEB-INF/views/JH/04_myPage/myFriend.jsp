<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<h3>친구 목록</h3>

	<table class="table table-hover" style="text-align: center">
		<tr>
			<th colspan="5" style="text-align: center">
				${ nowLogon.id }님의 친구 :	 
				<c:if test="${fList != null }">
					${ fList.size() } 명
				</c:if>
				<c:if test="${fList == null }">
					0 명
				</c:if>
			</th>
		</tr>
		<tr>
			<th style="text-align: center">선택</th>
			<th style="text-align: center">아이디</th>
			<th style="text-align: center">닉네임</th>
<!-- 			<th style="text-align: center">회원등급</th> -->
			<th style="text-align: center">쪽지/선물</th>
		</tr>
<c:choose>
	<c:when test="${ fList != null }">
		<c:forEach var="each" items="${ fList }">
		<tr>
			<td>
				<input type="checkbox" value="${ each.num }" />
			</td>
			<td>${ each.id }</td>
			<td>${ each.nickName }</td>
<%-- 			<td>${ each.grade }</td> --%>
			<td>
				<button type="button" id="fList(${ each.num })">쪽지 보내기</button>
				<button type="button" id="fList(${ each.num })">선물 보내기</button>
				<button type="button" onclick="friendDel(${ each.num })">친구 삭제</button>
			</td>
		</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td colspan="5">
				친구가 존재하지 않습니다.
			</td>
		</tr>
	</c:otherwise>
</c:choose>
		<tr>
			<th colspan="5" style="text-align: center">
				<button type="button" id="addFriend">친구 추가</button>
			</th>
		</tr>
	</table>


<div id= "modalB" class="modal fade" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
        <!-- remote ajax call이 되는영역 -->
    </div>
  </div>
</div>


<script type="text/javascript">
	

		$("#addFriend").click(function(){
			$("#modalB").modal({remote : '/springPro/popup/addFriend'});
		});

	
	$('body').on('hidden.bs.modal', '.modal', function () {
		$(this).removeData('bs.modal');
	});
	
	
	function friendDel(num){
		$.ajax({
			type : "POST",
			url : "friendDel",
			data : {fDelNum : num},
// 			dataType : 
			success : function(data){
				alert(data);
				
				if(data == "delOk"){
					alert("친구 삭제가 완료되었습니다.");
					location.href = "myFriend";
				}else {
					alert("친구 삭제에 실패했습니다.");
				}
			},
			error : function(request,status,error){
				alert("에러 발생!!!");
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	
</script>










