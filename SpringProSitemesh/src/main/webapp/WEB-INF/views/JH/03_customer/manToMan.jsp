<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2><strong>1:1 상담문의</strong></h2>
<img src="/springPro/resources/img/inq.jpg">
<div >

<p>FAQ에서 해결되지 않는 문의가 있으신 분은 1:1 문의를 남겨주시면 성심껏 답변해드리겠습니다.</p>

<p>24시간 문의가 가능하며, 평일 오전 10시 ~ 오후 6시 사이에 답변이 완료됩니다.</p>

<p>1:1 문의는 회원전용입니다. 비회원님들은 회원가입을 해주세요.</p>

<button onclick="location.href='/springPro/JH/06_manToMan/goInquire'">문의하기</button>


<c:if test="${ nowLogon == null }">
<button onclick="location.href='/springPro/JH/00_error/needLogin'">내 문의내역 보기</button>
</c:if>
<c:if test="${ nowLogon != null }">
<button onclick="location.href='/springPro/JH/06_manToMan/myInquireList'">내 문의내역 보기</button>
</c:if>
</div>




