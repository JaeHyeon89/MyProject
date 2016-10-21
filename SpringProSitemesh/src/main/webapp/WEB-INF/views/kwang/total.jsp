<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h2>종합차트</h2>

<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">최신곡</a></li>
    <li><a data-toggle="tab" href="#menu1">실시간</a></li>
    <li><a data-toggle="tab" href="#menu2">주간</a></li>
    <li><a data-toggle="tab" href="#menu3">월간</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
<!--       <h3>최신곡</h3> -->
      <p>최신곡 페이지</p>
      <jsp:include page="/WEB-INF/views/kwang/song/SongList.jsp"/>
    </div>
    <div id="menu1" class="tab-pane fade">
<!--       <h3>실시간</h3> -->
      <p>실시간 페이지</p>
      <jsp:include page="/WEB-INF/views/kwang/song/RealTimeList.jsp"/>
    </div>
    <div id="menu2" class="tab-pane fade">
<!--       <h3>주간</h3> -->
      <p>주간 페이지</p>
    </div>
    <div id="menu3" class="tab-pane fade">
<!--       <h3>월간</h3> -->
      <p>월간 페이지</p>
    </div>
  </div>
  
  
  <div id= "modalC" class="modal fade" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
        <!-- remote ajax call이 되는영역 -->
    </div>
  </div>
</div>
  
<script>
	
	function goAlbumPut(num){
		$("#modalC").modal({remote : '/springPro/popup/albumAdd?addNum='+num});
	}
	
	function goManyAlbumPut(){
		$("#modalC").modal({remote : '/springPro/popup/albumAdd?addNum=0'});
	}
	
	
	$('body').on('hidden.bs.modal', '.modal', function () {
		$(this).removeData('bs.modal');
	});


</script>
  
  
  
  
  
  
