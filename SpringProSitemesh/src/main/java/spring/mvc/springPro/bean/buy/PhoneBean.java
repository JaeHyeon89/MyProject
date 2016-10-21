package spring.mvc.springPro.bean.buy;

import org.apache.ibatis.type.Alias;

@Alias("phoneBean")
public class PhoneBean {
	
	private Integer num;
	private String tong;
	private String name;
	private String num1;
	private String num2;
	private String num3;
	private String phoneNum;
	private Integer regNum;
	private Integer useMoney;
	private Integer maxMoney;
	private String regDate;
	
	public void setPhoneNum(){
		this.phoneNum=this.num1+this.num2+this.num3;
	}
	
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getTong() {
		return tong;
	}
	public void setTong(String tong) {
		this.tong = tong;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public Integer getRegNum() {
		return regNum;
	}
	public void setRegNum(Integer regNum) {
		this.regNum = regNum;
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
