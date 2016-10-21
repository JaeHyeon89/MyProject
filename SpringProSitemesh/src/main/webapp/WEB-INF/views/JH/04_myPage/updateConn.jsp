<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ connMsg != null }">
	<script type="text/javascript">
		
		alert("${connMsg}");
		location.href = "my_main";
	
	</script>
</c:if>

<c:if test="${ dropMsg != null }">
	<script type="text/javascript">
		
		alert("${dropMsg}");
		location.href = "/springPro/home";
	
	</script>
</c:if>
















