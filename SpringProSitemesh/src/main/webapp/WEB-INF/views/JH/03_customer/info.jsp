<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<div class="container">
	<h2>공지사항</h2>
 		 <p><strong>공지사항 & 이벤트 발표</strong></p>
  <div class="panel-group" id="accordion1">
  	<c:forEach var="each" items="${ infoList }" varStatus="status">
  	    <div class="panel panel-default">
    	  <div class="panel-heading">
  		      <h4 class="panel-title">
   		       <a data-toggle="collapse" data-parent="#accordion1" href="#demo${status.index}" style="text-decoration: none">
   		       ${each.title }</a>
  		      </h4>
  		      
 	      </div>
    		<div id="demo${status.index}" class="panel-collapse collapse">
   	  			<div class="panel-body">${each.content }</div>
  	  		</div>
  	 	</div>
  	</c:forEach>
  </div>
</div>  
    
    
    
    
