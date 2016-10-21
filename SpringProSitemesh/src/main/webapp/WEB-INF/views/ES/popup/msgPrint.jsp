<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	<c:choose>
		<c:when test="${ res==null }">
			<script type="text/javascript">
				alert("${msg}");
				history.go(-2);
			</script>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${ res > 0 }">
					<script type="text/javascript">
						alert("성공적으로 구매를 완료했습니다.");
						self.close();
					</script>
				</c:when>
				<c:otherwise>
					<script type="text/javascript">
						alert("구매에 실패했습니다. 다시 시도해 주세요.");
						history.go(-2);
					</script>
				</c:otherwise>
			
			</c:choose>
		
		</c:otherwise>
	
	
	</c:choose>
	
	