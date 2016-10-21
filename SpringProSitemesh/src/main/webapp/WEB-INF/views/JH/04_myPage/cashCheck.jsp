<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<h3>캐시 잔액 확인</h3>

<h2>현재 남은 캐시 : ${ remainCash } 원</h2>

<a href="/springPro/buyPage"><button>충전하기</button></a>

<c:if test= "${ remainCash > 0 }">
<a href="/springPro/JH/04_myPage/cashRefund"><button>환불하기</button></a>
</c:if>



