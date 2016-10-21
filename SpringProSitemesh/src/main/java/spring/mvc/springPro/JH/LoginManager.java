package spring.mvc.springPro.JH;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

public class LoginManager {

	private HashMap<String, HttpSession> connectionLog;
	private static LoginManager loginManager;
	
	
	
	public static synchronized LoginManager getinstance(){
		if(loginManager == null){
			loginManager = new LoginManager();
			System.out.println("Single Tone 생성되었다");
		}
		return loginManager;
	}
	
	private LoginManager(){
		if(connectionLog == null){
			connectionLog = new HashMap<>();
		}
	}
	
	
	public boolean checkLog(String id, HttpSession session){
		if(connectionLog.containsKey(id)){
			System.out.println("중복 로그인이다!!");
			HttpSession duplSession = connectionLog.get(id);
			System.out.println("이미 [" + id + "]란 놈의 세션값 [" + duplSession.getAttribute("nowLogon") +"]이 있다!");
			duplSession.removeAttribute("nowLogon");
			connectionLog.put(id, session);
			System.out.println("현재 접속자 수 : " + connectionLog.size());
			return true;
		}else {
			System.out.println("일반 로그인이구나");
			connectionLog.put(id, session);
			System.out.println("현재 접속자 수 : " + connectionLog.size());
			return false;
		}
	}
	
	public void logonClear(String id){
		System.out.println("세션을 지웠다");
		connectionLog.remove(id);
		System.out.println("map에서도 지웠다");
	}
	
	
}
