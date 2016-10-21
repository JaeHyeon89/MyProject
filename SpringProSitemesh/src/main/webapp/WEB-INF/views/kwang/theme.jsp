<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<h2>테마별</h2>
  
     <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">테마별</a></li>
    <li><a data-toggle="tab" href="#menu1">봄</a></li>
    <li><a data-toggle="tab" href="#menu2">여름</a></li>
    <li><a data-toggle="tab" href="#menu3">가을</a></li>
    <li><a data-toggle="tab" href="#menu4">겨울</a></li>
    <li><a data-toggle="tab" href="#menu5">운전할때</a></li>
    <li><a data-toggle="tab" href="#menu6">운동할때</a></li>
    <li><a data-toggle="tab" href="#menu7">자기전에</a></li>
  </ul>


  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>테마종류</h3>
      <p>테마종류 페이지</p>
    </div>
   <div id="menu1" class="tab-pane fade">
      <h3>봄</h3>
      <p>봄 페이지</p>
      <form name="1">
<%--       <jsp:include page="/WEB-INF/views/kwang/song/ThemeStyle.jsp?theme=1"/> --%>
      </form>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>여름</h3>
      <p>여름 페이지</p>
      <form name="2">
<%--       <jsp:include page="/WEB-INF/views/kwang/song/ThemeStyle.jsp?theme=2"/> --%>
      </form>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>가을</h3>
      <p>가을 페이지</p>
      <form name="3">
<%--       <jsp:include page="/WEB-INF/views/kwang/song/ThemeStyle.jsp?theme=3"/> --%>
      </form>
    </div>
    <div id="menu4" class="tab-pane fade">
      <h3>겨울</h3>
      <p>겨울 페이지</p>
      <form name="4">
<%--       <jsp:include page="/WEB-INF/views/kwang/song/ThemeStyle.jsp?theme=4"/> --%>
      </form>
    </div>
    <div id="menu5" class="tab-pane fade">
      <h3>운전할때</h3>
      <p>운전할때 페이지</p>
      <form name="5">
<%--       <jsp:include page="/WEB-INF/views/kwang/song/ThemeStyle.jsp?theme=5"/> --%>
      </form>
    </div>
    <div id="menu6" class="tab-pane fade">
      <h3>운동할때</h3>
      <p>운동할때 페이지</p>
      <form name="6">
<%--       <jsp:include page="/WEB-INF/views/kwang/song/ThemeStyle.jsp?theme=6"/> --%>
      </form>
    </div>
    <div id="menu7" class="tab-pane fade">
      <h3>자기전에</h3>
      <p>자기전에 페이지</p>
      <form name="7">
<%--       <jsp:include page="/WEB-INF/views/kwang/song/ThemeStyle.jsp?theme=7"/> --%>
      </form>
    </div>
    
  </div>
