<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 이용약관들 보는 페이지 -->

  
<script src="/springPro/resources/js/external/jquery/jquery.js"></script>
<script src="/springPro/resources/js/jquery-ui.js"></script>
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<h2>이용약관 페이지</h2>

<table class="table">
	<tr>
		<td>
			<textarea style="width:600px; height: 600px; resize: none;">
			<c:forEach var="each" items="${ listc }">
				${ each }
			</c:forEach>
			</textarea>
		</td>
	</tr>
</table>
	

