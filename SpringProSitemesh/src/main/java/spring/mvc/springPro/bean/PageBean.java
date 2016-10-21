package spring.mvc.springPro.bean;

import org.apache.ibatis.type.Alias;

@Alias("pageBean")
public class PageBean {

	private int oneCount;		//한번에 가져올 양
	private int oneStart;		//한번에 가져오는 시작번호
	private int oneEnd;			//한번에 가져오는 끝번호
	private int rcvCount;		//DB에서 한번에 가져온 양
	private int pageDegree;		//한 페이지당 보여줄 글 갯수
	private int showPageCnt;	//한 화면에서 보여줄 페이지 번호에 대한 갯수
	private int pageGrade; 		//pre next버튼 기준등급 처음 0 next누르면 1 또누르면 2
	
	private int nowPage;		//현재 요청 페이지
	private int startPage;		//한번에 가져온것의 첫 페이지
	private int endPage;		//한번에 가져온것의 마지막 페이지
	
	private int startNum;		//해당페이지의 첫출력글(뽑아온 리스트에서의 순번)
	private int endNum;			//해당페이지의 마지막출력글(뽑아온 리스트에서의 순번)

	
	private String[] search;		//검색용
	
	public PageBean() {
		// TODO Auto-generated constructor stub
		this.nowPage =1;
		this.showPageCnt=10;
		this.pageDegree=10;
		this.oneCount = this.showPageCnt * this.pageDegree;
	}
	

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		this.pageGrade = (this.nowPage-1)/this.showPageCnt;
		this.startNum=(this.nowPage -1)*this.pageDegree-this.pageGrade*this.oneCount;
		this.endNum=(this.nowPage*this.pageDegree)-1 -this.pageGrade*this.oneCount;
		this.oneStart = this.pageGrade*this.oneCount +1;
		this.oneEnd = this.pageGrade*this.oneCount +this.oneCount;
	}
	
	public void setRcvCount(int rcvCount) {
		this.rcvCount = rcvCount;
		this.startPage = this.pageGrade*this.showPageCnt+1;
		this.endPage = this.pageGrade*this.showPageCnt+ (this.rcvCount-1)/this.pageDegree+1;
	}


	public int getOneCount() {
		return oneCount;
	}


	public void setOneCount(int oneCount) {
		this.oneCount = oneCount;
	}


	public int getRcvCount() {
		return rcvCount;
	}


	public int getPageDegree() {
		return pageDegree;
	}


	public void setPageDegree(int pageDegree) {
		this.pageDegree = pageDegree;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getStartNum() {
		return startNum;
	}


	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}


	public int getEndNum() {
		return endNum;
	}


	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}


	public int getShowPageCnt() {
		return showPageCnt;
	}


	public void setShowPageCnt(int showPageCnt) {
		this.showPageCnt = showPageCnt;
	}


	public String[] getSearch() {
		return search;
	}


	public void setSearch(String[] search) {
		this.search = search;
	}


	public int getNowPage() {
		return nowPage;
	}


	public int getOneStart() {
		return oneStart;
	}


	public void setOneStart(int oneStart) {
		this.oneStart = oneStart;
	}


	public int getOneEnd() {
		return oneEnd;
	}


	public void setOneEnd(int oneEnd) {
		this.oneEnd = oneEnd;
	}


	public int getPageGrade() {
		return pageGrade;
	}


	public void setPageGrade(int pageGrade) {
		this.pageGrade = pageGrade;
	}
	
	

}
