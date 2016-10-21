package spring.mvc.springPro.bean.user;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("userTheme")
public class UserTheme {

	private int num;
	private int userNum;
	private String genre;
//	private String hearTime;
	private String favorTheme;
	private Date regDate;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String[] rcvGenre) {
		this.genre = "";
		for (int i = 0; i < rcvGenre.length; i++) {

			if(!rcvGenre[i].equals("def")){
				this.genre += rcvGenre[i];
			}
			if (i != (rcvGenre.length - 1)) {
				this.genre += ",";
			}
		}
		
	}
	
//	public String getHearTime() {
//		return hearTime;
//	}
//	public void setHearTime(String[] rcvHearTime) {
//		this.hearTime = "";
//		for (int i = 0; i < rcvHearTime.length; i++) {
//
//			if(!rcvHearTime[i].equals("def")){
//				this.hearTime += rcvHearTime[i];
//			}
//			if (i != (rcvHearTime.length - 1)) {
//				this.hearTime += ",";
//			}
//		}
//	}
	public String getFavorTheme() {
		return favorTheme;
	}
	public void setFavorTheme(String[] rcvFavorTheme) {
		this.favorTheme = "";
		for (int i = 0; i < rcvFavorTheme.length; i++) {

			if(!rcvFavorTheme[i].equals("def")){
				this.genre += rcvFavorTheme[i];
			}
			if (i != (rcvFavorTheme.length - 1)) {
				this.genre += ",";
			}
		}
		
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	
}
