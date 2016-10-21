<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
<h3>나의 문의 내역</h3>
<div align="center" style="padding: 10px 10px 10px 10px; border-top: 2px solid black;">
<table class="table table-hover" >
	<tr>
		<th width="15%">번호</th>
		<th width="15%">분 류</th>
		<th width="40%">제 목</th>
		<th width="15%">답변 여부</th>
		<th width="15%">등 록 일</th>
	</tr>
<c:choose>
<c:when test="${ myQuestion.size() != 0 }">
	<c:set var="aaa" value="${ myQuestion.size() }" />
	<c:forEach var="each" items="${ myQuestion }" varStatus="status" >
	<tr>
		<td>${ aaa - status.index }</td>
		<td>${ each.category }</td>
		<td><a data-toggle="modal" data-target="#myModal${status.index }" >${ each.title }</a></td>
		<td>
			<c:if test="${ each.answer == 0 }">
				답변 대기
			</c:if>
			<c:if test="${ each.answer == 1 }">
				<strong>답변 완료</strong>
			</c:if>
		</td>
		<td>${ each.regDate }</td>
	</tr>
	
	<div id="myModal${status.index }" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">[${ each.category }]&nbsp;${each.title }</h4>
      </div>
      <div class="modal-body">
        <textarea rows="20" cols="70" readonly="readonly" style="resize:none; border : none">${each.content}</textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
	</c:forEach>
</c:when>
<c:otherwise>
	<tr>
		<th colspan="5">문의 내역이 없습니다.</th>
	</tr>
</c:otherwise>

</c:choose>
</table>
</div>
</div>




<script type="text/javascript">

	$(function(){
		$("#idCheck").click(function(){
			$("#modalR").modal({remote : '/springPro/popup/myQuestionConn'});
		});
	})
	
	
	$('body').on('hidden.bs.modal', '.modal', function () {
		$(this).removeData('bs.modal');
	});
	
	
</script>


