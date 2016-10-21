<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <br>
	<video id="myVideo" width="100%" height="0" autoplay="true" controls="controls">
   		<source src="/springPro/resources/filepath/song/${ bean.sysName }" type="audio/mpeg">
   		
    </video>
    
