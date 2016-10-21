<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<div class="container" > 
  <h2>자주 묻는 질문</h2>
  <p><strong>FAQ:</strong> 자주 묻는 질문들을 모아놓았습니다. 더 자세한 사항을 원하시면 1:1문의를 이용해주세요.</p>
	
	<div>
		<a href="/springPro/popup/FAQ/allFAQ" target="FAQList"><button>전체보기</button></a>
		<a href="/springPro/popup/FAQ/userFAQ" target="FAQList"><button>계정관련</button></a>
		<a href="/springPro/popup/FAQ/musicFAQ" target="FAQList"><button>음악재생</button></a>
		<a href="/springPro/popup/FAQ/payFAQ" target="FAQList"><button>결제/환불</button></a>
	</div>
	
	<iframe src="/springPro/popup/FAQ/FAQ" id="FAQList" name="FAQList" 
		width="1000px" height="800px" style="border: none"></iframe>

	
</div>








