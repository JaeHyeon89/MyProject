package spring.mvc.springPro.bean.user;

import java.util.Date;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import spring.mvc.springPro.JH.LoginManager;


@Alias("userInfo")
@Component
public class UserInfo implements HttpSessionBindingListener{

	LoginManager loginManager;
	
	private int num;
	
	private String id;
	
	private String pw;
	private String phone;
	private String nickName;
	
	private String friends;
	private String[] friendArray; // 검색용
	private int adult;
	private int grade;
	
	private int tagSelect;
	private int cash;
	private int remainMusic;
	private Date ticketEnd;
	
	private Date regDate;

	public UserInfo() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		
		loginManager = LoginManager.getinstance();
		
		if(loginManager == null){
			System.out.println("로그인 매니저 등장!");
		}
		
		boolean duplication = loginManager.checkLog(id, event.getSession());
		if(duplication){ // 중복 로그인일 때, 근데 여기서 할 게 있나?
			
			
		}
		
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		
		loginManager.logonClear(id);
		
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getFriends() {
		return friends;
	}

	public void setFriends(String friends) {
		this.friends = friends;
	}

	public int getAdult() {
		return adult;
	}

	public void setAdult(int adult) {
		this.adult = adult;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getTagSelect() {
		return tagSelect;
	}

	public void setTagSelect(int tagSelect) {
		this.tagSelect = tagSelect;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getRemainMusic() {
		return remainMusic;
	}

	public void setRemainMusic(int remainMusic) {
		this.remainMusic = remainMusic;
	}

	public Date getTicketEnd() {		
		return ticketEnd;
	}

	public void setTicketEnd(Date ticketEnd) {
		this.ticketEnd = ticketEnd;
	}
	
	public void setTicketEnd(String ticketEnd) {
		System.out.println("String : " + ticketEnd);
		
	}
	

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public void setFriendArray(String[] friendArray) {
		this.friendArray = friendArray;
	}

	public String[] getFriendArray() {
		return friendArray;
	}

	
	
	
}
