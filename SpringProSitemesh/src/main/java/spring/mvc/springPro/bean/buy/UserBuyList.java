package spring.mvc.springPro.bean.buy;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("userBuyList")
public class UserBuyList {
//	num			number(10) not null,	-- 충전한 고객의 고유번호
//	
//	classify		varchar2(200) not null,	-- 구매 분류 ex) 캐시 충전일 시 - 캐시 충전, 곡 구매일 시 - 곡 구매, 이용권 구매시 - 이용권 구매
//	
//	cashCharge		number(10), 			-- 캐시 충전이라면 얼마인지 기입
//	
//	ticket			varchar2(200),			-- 티켓 구매라면 티켓 이름이 들어감
//	ticketEnd		date, 					--regDate(sysdate)에서 30일 추가
//	chargeWay		varchar2(200), 			--충전 방식(휴대폰/카드/캐시/이용권)
//	
//	buyMusic		number(15),				--구매한 곡번호
//	buyArticle		number(15),				--구매한 물품 번호
//	
//	regDate			date 					-- 구매한 날짜
	
	private Integer num;
	private String classify;
	private Integer cashCharge;
	private String ticket;
	private Date ticketEnd;
	private String chargeWay;
	private Integer buyMusic;
	private Integer buyArticle;
	private String regDate;
	
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public Integer getCashCharge() {
		return cashCharge;
	}
	public void setCashCharge(Integer cashCharge) {
		this.cashCharge = cashCharge;
	}
	public String getTicket() {
		return ticket;
	}
	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
	public Date getTicketEnd() {
		return ticketEnd;
	}
	public void setTicketEnd(Date ticketEnd) {
		this.ticketEnd = ticketEnd;
	}
	public String getChargeWay() {
		return chargeWay;
	}
	public void setChargeWay(String chargeWay) {
		this.chargeWay = chargeWay;
	}
	public Integer getBuyMusic() {
		return buyMusic;
	}
	public void setBuyMusic(Integer buyMusic) {
		this.buyMusic = buyMusic;
	}
	public Integer getBuyArticle() {
		return buyArticle;
	}
	public void setBuyArticle(Integer buyArticle) {
		this.buyArticle = buyArticle;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}
