<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<c:choose>
	<c:when test="${ rConn == 'good' }">
		<h3>회원가입을 축하합니다~</h3>
		<p>사이트 운영 수칙!<br>
			불편사항이나 궁금하신 점은 고객센터의 FAQ 게시판을 이용해주세요.
		</p>
		
		<p>선호 장르 및 테마를 등록하시면 그에 따라 맞춤형 메일이 발송해드립니다. 많은 이용 부탁드립니다.</p>

		<p>선호장르 및 테마 등록은 로그인 후 페이지 상단 마이페이지의 개인정보 수정에서 등록/수정이 가능합니다</p>

		<p>회원님의 닉네임은 첫 가입시 랜덤으로 부여됩니다.</p>
		
		<p>닉네임 또한 마이페이지의 개인정보 수정에서 변경이 가능합니다.</p>
		
		<p>사이트 이용 중 문의사항이나 오류가 생길 경우, 고객센터의 1:1문의를 이용해주시기 바랍니다.(회원 전용)</p>
		
		<p>항상 노력하는 세스코 뮤직이 되겠습니다.</p>
	</c:when>
	
	<c:when test="${ rConn == 'duple' }">
		<h3>회원가입에 실패했습니다</h3>
		<p>동일한 휴대폰 번호로 이미 가입중인 아이디가 있습니다.</p>
		<p>회원정보가 기억나지 않으신다면, 아이디/비밀번호 찾기를 이용해주세요.</p>
		<a href="/springPro/JH/02_log/login"><button>아이디/비밀번호 찾기</button></a>
	</c:when>
	
	<c:otherwise>
		<h3>회원가입에 실패했습니다</h3>
		<p>다시 한번 회원가입을 시도해보시고 같은 문제가 반복될 시, 관리자에게 문의해주세요</p>
	</c:otherwise>
</c:choose>








