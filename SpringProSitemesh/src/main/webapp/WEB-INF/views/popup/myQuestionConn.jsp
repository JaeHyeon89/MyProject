<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
      <div class="modal-header" id="myModal">
        <button type="button" class="close" data-dismiss="modal">x</button>
        <h4 class="modal-title">내 문의 보기</h4>
      </div>
      <div class="modal-body">
        <p>아이디 입력</p>
        <input type="text" id="idConn" />
        <button type="button" id="goIdCheck">중복확인</button><br>
        <div id="check" style="display:none">
	        <div id="idMsg"></div>
	        <div id="qq2" style="display : none">
				<button id="goId">사용하기</button>        
	        
	        </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
 















