<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript   -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">


<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">

<body>

<div class="dsds" style="border-top : 2px solid black; padding: 5px 0px 0px 5px" >


  <div class="panel-group" id="accordion" >
  	<c:forEach var="each" items="${ FAQList }" varStatus="status">
  	    <div class="panel panel-default">
    	  <div class="panel-heading" >
  		    <div class="row">
    	  		<div class="col-sm-2">${ each.category }</div>
    	  	
   		       <a data-toggle="collapse" data-parent="#accordion" href="#demo${status.index}" >
  		    	<div class="col-sm-8">
  		    	${each.title }
  		    	</div>
   		       </a>
  		      <div class="col-sm-2">${ each.regDate }</div>
 	      </div>
 	      </div>
    		<div id="demo${status.index}" class="panel-collapse collapse">
   	  			<div class="panel-body" style="text-align: center">${each.content }</div>
  	  		</div>
  	 	</div>
  	</c:forEach>
  </div>
  
  
  </div>
  
</body>

<!-- <div class="container" >  -->
<!--   <h2>자주 묻는 질문</h2> -->
<!--   <p><strong>FAQ:</strong> 자주 묻는 질문들을 모아놓았습니다. 더 자세한 사항을 원하시면 1:1문의를 이용해주세요.</p> -->
<!--  <div id="abc" class="table-responsive">  -->
<!-- <table id="aas" class="table table-hover"> -->
<!-- 	<tr> -->
<!-- 		<th width="15%">분 류</th> -->
<!-- 		<th width="65%">제 목</th> -->
<!-- 		<th width="20%">등록일</th> -->
<!-- 	</tr> -->
<%--   	<c:forEach var="each" items="${ FAQList }" varStatus="status"> --%>
<!--   	<tr> -->
<!--   			<td> -->
<%--   				${ each.category } --%>
<!--   			</td> -->
<!--   			<td> -->
<%--   			<a data-toggle="collapse" data-parent="#abc" href="#demo${status.index}" > --%>
<%--    		       ${each.title }  --%>
<!--    		    </a> -->
<!--   			</td> -->
<!--   			<td> -->
<%--   				${ each.regDate } --%>
<!--   			</td> -->
<!--   	</tr> -->
<%--   	<tr id="demo${status.index}" class="panel-collapse collapse"> --%>
<!--   			<td colspan="3" style="background-color: #BEEFFF" > -->
<!--   				&nbsp;&nbsp;&nbsp; -->
<%--   				${each.content } --%>
<!--   			</td> -->
<!--   	</tr> -->
  	 
<%--   	</c:forEach> --%>
<!-- </table> -->
<!-- </div> -->
<!-- </div> -->












