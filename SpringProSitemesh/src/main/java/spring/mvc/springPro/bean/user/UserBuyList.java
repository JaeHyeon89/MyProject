package spring.mvc.springPro.bean.user;

import org.apache.ibatis.type.Alias;

@Alias("buyList")
public class UserBuyList {
	
	private int num;
	
	private String classify;
	
	private int cashCharge;
	private String ticket;
	private String chargeWay;
	
	private int buyMusic;
	private int buyArticle;
	
	private String regDate;
	
	private String content;
	
	

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public int getCashCharge() {
		return cashCharge;
	}

	public void setCashCharge(int cashCharge) {
		this.cashCharge = cashCharge;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getChargeWay() {
		return chargeWay;
	}

	public void setChargeWay(String chargeWay) {
		this.chargeWay = chargeWay;
	}

	public int getBuyMusic() {
		return buyMusic;
	}

	public void setBuyMusic(int buyMusic) {
		this.buyMusic = buyMusic;
	}

	public int getBuyArticle() {
		return buyArticle;
	}

	public void setBuyArticle(int buyArticle) {
		this.buyArticle = buyArticle;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	

}
