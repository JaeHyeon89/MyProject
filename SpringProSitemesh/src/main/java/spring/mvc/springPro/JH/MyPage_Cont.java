package spring.mvc.springPro.JH;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.user.UserBuyList;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.bean.user.UserTheme;
import spring.mvc.springPro.service.user.UserService;

@Controller
public class MyPage_Cont {

	ModelAndView mav;
	ArrayList<UserBuyList> buyList;
	UserInfo bean;
	
	@Autowired
	UserService uServ;
	
	//마이페이지 들어올때
	@RequestMapping(value="JH/04_myPage/my_main", method=RequestMethod.GET)
	public ModelAndView goMain(HttpSession session){
		System.out.println("마이페이지");
		bean = (UserInfo)session.getAttribute("nowLogon");
		mav = new ModelAndView();
		getBuyList();
		getRemainCash();
		getTicket();
		mav.setViewName("JH/04_myPage/my_main");
		return mav;
	}
	
//	닉네임 중복검사
	@RequestMapping(value="JH/04_myPage/nickCheck", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public @ResponseBody Object nickCheck(HttpServletRequest req){
		
		Object result;
		System.out.println(req.getParameter("nickName"));
		UserInfo bean = new UserInfo();
		bean.setNickName(req.getParameter("nickName"));
		Object res = uServ.nickCheck(bean);
		
		if(res == null){ // 중복되는 닉네임이 없다는 뜻
			result = "사용가능한 닉네임입니다.";
		}else {
			result = null;
		}
//		mav.addObject("nickRes", result);
		return result;
	}
	
	//비밀번호 재입력
	@RequestMapping(value="JH/04_myPage/pwCheck", method=RequestMethod.POST)
	public String pwCheck(UserInfo bean, HttpServletRequest req){
		
		
		Object res = uServ.selectOne(bean);
		if(res != null){
			return "JH/04_myPage/pwConn";
		}else {
			return "00_error/pwError";
		}
	}
	
//	비밀번호 수정
	@RequestMapping(value="JH/04_myPage/updatePW", method=RequestMethod.POST)
	public ModelAndView updatePw(UserInfo bean, HttpServletRequest req){
		mav = new ModelAndView();
		System.out.println("비밀번호 바꾸자 : " + bean.getPw());
		Object res = uServ.selectOne(bean);
		
		if(res != null){ // 현재 비밀번호가 일치할 때 
			UserInfo info = (UserInfo) res;
			info.setPw(req.getParameter("updatePw"));
			boolean updateOk = uServ.updatePassword(info);
			if(updateOk){ // 비밀번호 수정이 완료될 떄
				mav.addObject("connMsg", "비밀번호 수정이 완료되었습니다.");
			}else { // 비밀번호 수정에 실패했을 때
				mav.addObject("connMsg", "비밀번호 수정에 실패했습니다. 똑같은 오류가 발생할 시 관리자에게 문의하세요");
			}
		}else { // 현재 비밀번호가 일치하지 않을 때
			mav.addObject("connMsg", "현재 비밀번호가 일치하지 않습니다. 처음부터 다시 시도해주세요.");
		}
		mav.setViewName("JH/04_myPage/updateConn");
		return mav;
	}
	
//	회원정보 수정
	@RequestMapping(value="JH/04_myPage/goUpdate", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public @ResponseBody String goUpdate(HttpServletRequest req){
		mav = new ModelAndView();
		
		UserInfo bean = new UserInfo();
		bean.setId(req.getParameter("id"));
		bean.setNickName(req.getParameter("nickName"));
		bean.setPhone(req.getParameter("phone"));
		
		boolean updateOk = uServ.updateInfo(bean);
		
		String res = null;
		
		if(updateOk){ // 회원정보 수정이 완료되었을 때
			res = "회원 정보 수정에 성공했습니다.";
		}else { // 회원정보 수정에 실패했을 때
//			mav.addObject("connMsg", "회원정보 수정에 실패했습니다. 똑같은 오류가 발생할 시 관리자에게 문의하세요");
		}
		return res;
	}
	
	//회원 탈퇴
	@RequestMapping(value="JH/04_myPage/dropInfo", method=RequestMethod.POST)
	public ModelAndView dropInfo(UserInfo bean, HttpSession session){
		mav= new ModelAndView();
		boolean dropOk = uServ.dropInfo(bean);
		session.invalidate();
		if(dropOk){
			mav.addObject("dropMsg", "회원 탈퇴가 정상적으로 처리되었습니다.");
		}else{
			mav.addObject("dropMsg", "에러 발생! 관리자에게 문의하세요");
		}
		mav.setViewName("JH/04_myPage/updateConn");
		return mav;
	}

	
	//태그 설정
	@RequestMapping(value="JH/04_myPage/userTag", method=RequestMethod.POST)
	public ModelAndView userTag(UserTheme theme, HttpSession session){
		UserInfo info = (UserInfo) session.getAttribute("nowLogon");
		theme.setUserNum(info.getNum()); // theme빈에 userNum 세팅
		
		if(info.getTagSelect()==0){ //태그를 처음 등록(insert)
			boolean insertSuccess = uServ.insertTheme(theme);
			if(insertSuccess){ //테마 테이블 저장 성공
				System.out.println("테마 insert 성공");
				boolean tagUpdate1 = uServ.updateInfoTag(info);
				if(tagUpdate1){ // 유저정보 테이블에서 tagSelect까지 무난히 변경완료
					info.setTagSelect(1);
					session.setAttribute("nowLogon", info);
					mav.addObject("connMsg", "테마 등록이 완료되었습니다.");
					System.out.println(info.getNum() + " 의 유저 tagSelect를 변경 성공");
				}else {
					mav.addObject("connMsg", "알 수 없는 오류 발생! 관리자에게 문의하세요");
				}
			}else{ //테마 테이블 저장 실패
				mav.addObject("connMsg", "테마 등록에 실패했습니다. 다시 시도해주세요");
			}
			
		}else { // 있는 태그를 수정(update)
			boolean updateSuccess = uServ.updateTheme(theme);
			if(updateSuccess){ // 테마 테이블 수정 성공
				mav.addObject("connMsg", "테마 수정이 완료되었습니다.");
			}else {
				mav.addObject("connMsg", "테마 수정에 실패했습니다. 관리자에게 문의하세요.");
			}
		}
		
		mav.setViewName("JH/04_myPage/updateConn");
		
		return mav;
	}
	

	
	//구매내역 부르기
	public void getBuyList(){
		buyList = null; // 초기화
		System.out.println(bean.getNum());
		List<Object> tempList = uServ.getBuyList(bean);
		if(tempList != null){
			setClassify(tempList);
			mav.addObject("buyList", buyList);
		}else {
			System.out.println("마이페이지 컨트롤러에서 문제 발생");
		}
		
	}
		
//	캐시 환불
	@RequestMapping(value="JH/04_myPage/cashRefund", method=RequestMethod.POST)
	public ModelAndView cashRefund(UserBuyList buyList, HttpServletRequest req){
		System.out.println("캐시 환불");
		String acountName = req.getParameter("accountName");
		String accountBank = req.getParameter("accountBank");
		String accountNum = req.getParameter("accountNum");
		
		System.out.println("환불할 금액 : " + buyList.getCashCharge());
		buyList.setChargeWay(accountBank + " 계좌 이체");
		
//		은행사 DB만들것
		boolean refundOk = uServ.cashRefund(buyList);
		
		if(refundOk){
			UserInfo bean = new UserInfo();
			bean.setNum(Integer.parseInt(req.getParameter("num")));
			boolean infoCashOk = uServ.cashRefund(bean);
			
			if(infoCashOk){
				mav.addObject("refundMsg", "환불이 정상적으로 처리되었습니다.");
			}else {
				mav.addObject("refundMsg", "에러 발생! 관리자에게 문의해주세요.");
			}
		}else {
			mav.addObject("refundMsg", "에러 발생! 관리자에게 문의해주세요.");
		}
		mav.setViewName("JH/04_myPage/cashRefundConn");
		return mav;
	}
	
	
	
	private void setClassify(List<Object> tempList){
		
//		ArrayList<Integer> songBuyList = new ArrayList<>();
//		for(Object each : tempList){ // 곡일 경우 따로 담는다
//			UserBuyList bean = (UserBuyList) each;
//			if(bean.getClassify().equals("곡 구매")){
//				songBuyList.add(bean.getBuyMusic());
//			}
//		}
		
		
		for(Object each : tempList){
			
			if(buyList == null){
				buyList = new ArrayList<>();
			}
			
			UserBuyList bean = (UserBuyList) each;
			String content = "";
			if(bean.getClassify().equals("캐시 충전")){
				content = bean.getCashCharge() + "원 충전";
			}else if(bean.getClassify().equals("이용권 구매")){
				content = "이용권 : " +  bean.getTicket()+ " 구매 ";
			}else if(bean.getClassify().equals("곡 구매")){
				SongBean temp = new SongBean();
				temp.setNum(bean.getBuyMusic());
				temp = uServ.getBuyedSong(temp);
				
				content = temp.getSongName() + " - " + temp.getArtistName();
			}else if(bean.getClassify().equals("상품 구매")){
				content = bean.getBuyArticle() + "번 상품 구매";
			}else if(bean.getClassify().equals("환불")){
				content = bean.getCashCharge() + "환불";
			}else {
				System.out.println("문제 생겼다 ㅅㅂ => " + bean.getClassify());
			}
			bean.setContent(content);
			buyList.add(bean);
		}//for문 끝
		
	}
	
	private void getRemainCash(){
		System.out.println("REQA : " + bean.getId() + " |||| " + bean.getPw());
		UserInfo info = (UserInfo) uServ.selectOne(bean);
		int remainCash = info.getCash();
		mav.addObject("remainCash", remainCash);
	}
	
	private void getTicket(){
		Date ticketEnd = bean.getTicketEnd();
		mav.addObject("ticketEnd", ticketEnd);
	}
	

	
}












