package spring.mvc.springPro.bean.buy;

import org.apache.ibatis.type.Alias;

@Alias("bankBean")
public class BankBean {
//	num				number(20) primary key,
//	bankName		varchar2(200) not null,		--은행사이름
//	cardNum			varchar2(20) unique not null,	--카드번호
//	name			varchar2(200) not null,		
//	cvnNum			number(10)	not null,		--cvn비번
//	useMoney		number(20),					--사용액
//	maxMoney		number(20) not null,		--한도액
//	regDate			date
	
	private Integer num;
	private String bankName;
	private String num1;	//카드번호1
	private String num2;	//카드번호2
	private String num3;	//카드번호3
	private String num4;	//카드번호4
	private String cardNum;	//카드번호1,2,3,4 합침
	private String name;
	private Integer cvnNum;
	private Integer useMoney;
	private Integer maxMoney;
	private String regDate;
	
	public void setCardNum(){
		this.cardNum=num1+num2+num3+num4;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getNum1() {
		return num1;
	}

	public void setNum1(String num1) {
		this.num1 = num1;
	}

	public String getNum2() {
		return num2;
	}

	public void setNum2(String num2) {
		this.num2 = num2;
	}

	public String getNum3() {
		return num3;
	}

	public void setNum3(String num3) {
		this.num3 = num3;
	}

	public String getNum4() {
		return num4;
	}

	public void setNum4(String num4) {
		this.num4 = num4;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCvnNum() {
		return cvnNum;
	}

	public void setCvnNum(Integer cvnNum) {
		this.cvnNum = cvnNum;
	}

	public Integer getUseMoney() {
		return useMoney;
	}

	public void setUseMoney(Integer useMoney) {
		this.useMoney = useMoney;
	}

	public Integer getMaxMoney() {
		return maxMoney;
	}

	public void setMaxMoney(Integer maxMoney) {
		this.maxMoney = maxMoney;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}
