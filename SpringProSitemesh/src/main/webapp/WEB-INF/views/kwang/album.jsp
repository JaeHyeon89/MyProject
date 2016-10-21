<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">


</script>


<h2>앨범 차트</h2>

     <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">주간</a></li>
    <li><a data-toggle="tab" href="#menu1">월간</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>주간</h3>
      <p>주간 페이지</p>
      <jsp:include page="/WEB-INF/views/kwang/song/AlbumList.jsp"/>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>월간</h3>
      <p>월간 페이지</p>
    </div>
  </div>

