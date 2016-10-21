package spring.mvc.springPro.es.buy;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.buy.BankBean;
import spring.mvc.springPro.bean.buy.PhoneBean;
import spring.mvc.springPro.bean.buy.ReadFile;
import spring.mvc.springPro.bean.buy.UserBuyList;
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.service.buy.BuyService;


@Controller
public class BuyController {
	
	@Resource(name="BuyService")
	BuyService buyService;
	
	PhoneBean phoneBean;
	BankBean bankBean;
	int musicPrice=600;
	
	@RequestMapping("buyPage")
	public String buyPage(){
		return "ES/buy/buyPage";
	}
	
	@RequestMapping("/cashChargeForm")
	public String cashCargeForm(){
		return "ES/buy/cashChargeForm";
	}
	
	@RequestMapping("/ticketChargeForm")
	public String ticketCargeForm(){
		return "ES/buy/ticketChargeForm";
	}
	
	@RequestMapping("phoneChargeForm")
	public ModelAndView phoneChargeForm(HttpServletRequest request){
		
		ModelAndView mav=new ModelAndView();
		
		if(request.getParameter("cashAmount")!=null){	//캐시충전일 경우
			
			String cashAmount=request.getParameter("cashAmount");
			
			mav.addObject("cashAmount", cashAmount);
			
		}else if(request.getParameter("remainMusic")!=null){	//이용권 구매일 경우
			
			String remainMusic=request.getParameter("remainMusic");
			
			mav.addObject("remainMusic", remainMusic);
		}
		
		mav.setViewName("/ES/popup/phoneChargeForm");
		
		return mav;
	}
	
	@RequestMapping("cardChargeForm")
	public ModelAndView cardChargeForm(HttpServletRequest request){
		
		ModelAndView mav=new ModelAndView();
		
		if(request.getParameter("cashAmount")!=null){	//캐시충전일 경우
			
			String cashAmount=request.getParameter("cashAmount");
			
			mav.addObject("cashAmount", cashAmount);
		}else if(request.getParameter("remainMusic")!=null){	//이용권 구매일 경우
			
			String remainMusic=request.getParameter("remainMusic");
			
			mav.addObject("remainMusic", remainMusic);
			
		}
		
		mav.setViewName("/ES/popup/cardChargeForm");
		
		return mav;
	}
	
	@RequestMapping("cashPhoneCharge")
	public ModelAndView cashPhoneCharge(PhoneBean pBean, String msg,
									@RequestParam("cashAmount") int cashAmount){	//캐시충전 핸드폰
		pBean.setPhoneNum();
		String url=null;
		
		ModelAndView mav=new ModelAndView();
		this.phoneBean=buyService.phoneSelectOne(pBean);
		
		if(this.phoneBean!=null){	//정보가 있다면
			this.phoneBean.setUseMoney(this.phoneBean.getUseMoney()+cashAmount);
			if(this.phoneBean.getMaxMoney()<(this.phoneBean.getUseMoney())){	//한도액이 초과했을 경우
				
				msg="한도액이 초과되었습니다. 결제가 취소 됩니다.";
				mav.addObject("msg", msg);
			
				url="/ES/popup/phoneChargeForm";	//되돌아가기
				
			}else{	//한도액 가능
				
				url="/ES/popup/certifyForm";	//인증페이지로
				
			}
			
		}else{	//정보가 없다면

				msg="일치하는 정보가 없습니다. 결제가 취소 됩니다.";
				mav.addObject("msg", msg);
			url="/ES/popup/phoneChargeForm";	//되돌아가기
		}
		mav.addObject("cashAmount", cashAmount);
		mav.setViewName(url);
		
		return mav;
		
	}
	
	
	@RequestMapping("cashCertifyCom")
	public ModelAndView cashCertifyCom(@RequestParam("num") String num, 
							@RequestParam("cashAmount") int cashAmount,
							HttpSession session){	//캐시충전 인증
		String msg;
		ModelAndView mav=new ModelAndView();
		UserInfo rcv=(UserInfo)session.getAttribute("nowLogon");
		System.out.println("인증번호 : " + num);
		if(num.equals("1111")){
			UserInfo user=this.buyService.userSelOne(rcv.getId());
			int cash=user.getCash()+cashAmount;
			user.setCash(cash);
			
			UserBuyList buyList=new UserBuyList();
			buyList.setNum(user.getNum());
			buyList.setCashCharge(cashAmount);
			buyList.setChargeWay("핸드폰");
			buyList.setClassify("캐시 충전");

			int res=buyService.updatePhoneCash(user, this.phoneBean, buyList);
			
			if(res>0){	//결제 성공
//				user.setPw("");
				session.setAttribute("nowLogon", user);	//세션에 다시 nowLogon 넣기
			}
			
			mav.addObject("res", res);
			
		}else{
			msg="인증 실패 다시시도 하세요";
			mav.addObject("msg", msg);
		}
		mav.setViewName("/ES/popup/msgPrint");
		
		return mav;
	}
	
	@RequestMapping("cashCardCharge")
	public ModelAndView cashCardCharge(BankBean bBean, 
									@RequestParam("cashAmount") int cashAmount,
										HttpSession session){	//캐시충전 카드
		bBean.setCardNum();
		String url=null;
		String msg;

		ModelAndView mav=new ModelAndView();
		this.bankBean=buyService.bankSelectOne(bBean);
		
		if(this.bankBean!=null){	//정보가 있다면
			this.bankBean.setUseMoney(this.bankBean.getUseMoney()+cashAmount);
			if(this.bankBean.getMaxMoney()<(this.bankBean.getUseMoney())){	//한도액이 초과했을 경우
				
				msg="한도액이 초과되었습니다. 결제가 취소 됩니다.";
				
				mav.addObject("msg", msg);
				
				
				url="/ES/popup/cardChargeForm";	//되돌아가기
				
			}else{	//정보가 있다 && 한도액 가능
				
				UserInfo rcv=(UserInfo)session.getAttribute("nowLogon");
				UserInfo user=this.buyService.userSelOne(rcv.getId());
				int cash=user.getCash()+cashAmount;
				user.setCash(cash);
				
				UserBuyList buyList=new UserBuyList();
				buyList.setNum(user.getNum());
				buyList.setCashCharge(cashAmount);
				buyList.setChargeWay("카드");
				buyList.setClassify("캐시 충전");
				
				int res=buyService.updateCardCash(user, this.bankBean, buyList);
				
				if(res>0){	//결제 성공
//					user.setPw("");
					session.setAttribute("nowLogon", user);	//세션에 다시 nowLogon 넣기
				}
				
				mav.addObject("res", res);
				
				url="/ES/popup/msgPrint";	//
				
			}
			
		}else{	//정보가 없다면
			
			msg="일치하는 정보가 없습니다. 결제가 취소 됩니다.";
			
			url="/ES/popup/cardChargeForm";	//되돌아가기
		}
		mav.addObject("cashAmount", cashAmount);
		mav.setViewName(url);
		
		return mav;
		
	}
	
	@RequestMapping("tiPhoneCharge")
	public ModelAndView tiPhoneCharge(PhoneBean pBean, 
									@RequestParam("remainMusic") int remainMusic){	//이용권 핸드폰
		pBean.setPhoneNum();
		String url=null;
		String msg;
		int price=0;
		ModelAndView mav=new ModelAndView();
		this.phoneBean=buyService.phoneSelectOne(pBean);
		
		if(remainMusic==50){	//50곡 5천원
			price=5000;
		}else{	//100곡 만원
			price=10000;
		}
		
		if(this.phoneBean!=null){	//정보가 있다면
			this.phoneBean.setUseMoney(this.phoneBean.getUseMoney()+price);
			if(this.phoneBean.getMaxMoney()<(this.phoneBean.getUseMoney())){	//한도액이 초과했을 경우
				
				msg="한도액이 초과되었습니다. 결제가 취소 됩니다.";
				mav.addObject("msg", msg);
				
				url="/ES/popup/phoneChargeForm";	//되돌아가기
				
			}else{	//한도액 가능
				
				url="/ES/popup/certifyForm";	//인증페이지로
				
			}
			
		}else{	//정보가 없다면
			msg="일치하는 정보가 없습니다. 결제가 취소 됩니다.";
			mav.addObject("msg", msg);
			
			url="/ES/popup/phoneChargeForm";	//되돌아가기
		}
		
		mav.addObject("remainMusic", remainMusic);
		mav.setViewName(url);
		
		return mav;
		
	}
	
	@RequestMapping("tiCertifyCom")
	public ModelAndView tiCertifyCom(@RequestParam("num") String num, 
							@RequestParam("remainMusic") int remainMusic,
							HttpSession session){
		String msg;
		int price;
		ModelAndView mav=new ModelAndView();
		UserInfo rcv=(UserInfo)session.getAttribute("nowLogon");
		
		if(num.equals("1111")){	//인증 성공
			
			
			if(remainMusic==50){	//50곡	5천원
				price=5000;
				msg="50곡";
			}else{	//100곡	만원
				price=10000;
				msg="100곡";
			}
			
			
			UserInfo user=this.buyService.userSelOne(rcv.getId());
			
			Calendar cal = Calendar.getInstance();
			
			if(user.getTicketEnd()!=null){
				cal.setTime(user.getTicketEnd());	// cal을 user의 남은 날짜로 변경
			}
			
			cal.add(Calendar.DATE, 30);
			Date date = new Date(cal.getTimeInMillis()); // 설정한 날로부터 30일뒤(null이면 오늘)
			
			
			int music=user.getRemainMusic()+remainMusic;	//남은 곡 더하기
			user.setRemainMusic(music);
			user.setTicketEnd(date);						//남은 날짜 변경
			
			UserBuyList buyList=new UserBuyList();
			buyList.setNum(user.getNum());
			buyList.setTicketEnd(date);
			buyList.setTicket(msg);
			buyList.setChargeWay("핸드폰");
			buyList.setClassify("이용권 구매");
			
			int res=buyService.updatePhoneTicket(user, this.phoneBean, buyList);
			
			if(res>0){	//결제 성공
//				user.setPw("");
				session.setAttribute("nowLogon", user);	//세션에 다시 nowLogon 넣기
				
			}
			
			mav.addObject("res", res);
			
		}else{
			msg="인증 실패 다시시도 하세요";
			mav.addObject("msg", msg);
		}
		mav.setViewName("/ES/popup/msgPrint");
		
		return mav;
	}
	
	@RequestMapping("tiCardCharge")
	public ModelAndView tiCardCharge(BankBean bBean, 
									@RequestParam("remainMusic") int remainMusic,
										HttpSession session){	//이용권 구매 카드
		bBean.setCardNum();
		String url=null;
		int price;
		String msg;
		
		ModelAndView mav=new ModelAndView();
		this.bankBean=buyService.bankSelectOne(bBean);
		
		if(remainMusic==50){	//50곡	5천원
			price=5000;
			msg="30일 50곡";
		}else{	//100곡	만원
			price=10000;
			msg="30일 100곡";
		}
		
		if(this.bankBean!=null){	//정보가 있다면
			this.bankBean.setUseMoney(this.bankBean.getUseMoney()+price);
			if(this.bankBean.getMaxMoney()<(this.bankBean.getUseMoney())){	//한도액이 초과했을 경우
				
				
				msg="한도액이 초과되었습니다. 결제가 취소 됩니다.";
				mav.addObject("msg", msg);
				
				url="/ES/popup/cardChargeForm";	//되돌아가기
				
			}else{	//정보가 있다 && 한도액 가능
				UserInfo rcv=(UserInfo)session.getAttribute("nowLogon");
				UserInfo user=this.buyService.userSelOne(rcv.getId());
				
				Calendar cal = Calendar.getInstance();
				
				if(user.getTicketEnd()!=null){
					cal.setTime(user.getTicketEnd());	// cal을 user의 남은 날짜로 변경
				}
				
				cal.add(Calendar.DATE, 30);
				Date date = new Date(cal.getTimeInMillis()); // 설정한 날로부터 30일뒤(null이면 오늘)
				
				int music=user.getRemainMusic()+remainMusic;	//남은 곡 더하기
				user.setRemainMusic(music);
				user.setTicketEnd(date);						//남은 날짜 변경
				
				UserBuyList buyList=new UserBuyList();
				buyList.setNum(user.getNum());
				buyList.setTicketEnd(date);
				buyList.setTicket(msg);
				buyList.setChargeWay("카드");
				buyList.setClassify("이용권 구매");
				
				int res=buyService.updateCardTicket(user, this.bankBean, buyList);
				
				if(res>0){	//결제 성공
//					user.setPw("");
					session.setAttribute("nowLogon", user);	//세션에 다시 nowLogon 넣기
				}
				
				mav.addObject("res", res);
				url="/ES/popup/msgPrint";	//
				
			}
			
		}else{	//정보가 없다면
			
			msg="일치하는 정보가 없습니다. 결제가 취소 됩니다.";
			mav.addObject("msg", msg);
			
			url="/ES/popup/cardChargeForm";	//되돌아가기
		}
		
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping("songChargeForm")
	public ModelAndView songChargeForm(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		
		List<Integer> listc=new ArrayList<>();
		List<SongBean> songList=new ArrayList<>();	//노래 정보를 DB에서 받아올 listc
		
		UserInfo rcv=(UserInfo)session.getAttribute("nowLogon");
		UserInfo user=this.buyService.userSelOne(rcv.getId());	//유저정보 DB에서 가져오기
		
		UserBuyList tmp=new UserBuyList();	//mapper에 갈 객체
		
		String[] rcvSongNum=request.getParameterValues("num");
		int total=rcvSongNum.length;	//구입할 총 갯수
		
		int[] songNum=new int[rcvSongNum.length];
		
		for(int i=0; i<rcvSongNum.length; i++ ){
			songNum[i]=Integer.parseInt(rcvSongNum[i]);
			tmp.setBuyMusic(songNum[i]);	//검색할 노래 번호을 tmp객체에 넣는다
			tmp.setNum(user.getNum());		//검색할 num을 tmp객체에 넣는다
			
			UserBuyList buyList=this.buyService.selBuyListOne(tmp);	//중복되는 노래 번호를 찾는다
			SongBean songBean=this.buyService.selSongOne(songNum[i]);	//노래 정보 select
			songList.add(songBean);	//찾은 노래 정보를 listc에 넣는다
			
			if(buyList!=null){	//재 다운로드가 있다면
				listc.add(buyList.getBuyMusic());
			}
			
		}
		
		int reDown=listc.size();	//중복곡수
		
		mav.addObject("musicPrice", this.musicPrice);	//노래 가격
		mav.addObject("songList", songList);	//노래 정보가 담긴 listc
		mav.addObject("reDown", reDown);	//중복 곡 갯수
		mav.addObject("listc", listc);	//중복 노래 번호을 담은 listc
		mav.addObject("user", user);	//남은 이용권수/캐시를 위한 user객체 보내기
		mav.addObject("total", total);	//결제할 총 곡의 숫자를 위해 total객체 보내기
		mav.setViewName("/ES/popup/songChargeForm");
		
		return mav;
	}
	
	@RequestMapping("tiMusicCharge")
	public ModelAndView tiMusicCharge(HttpServletRequest request){
		String msg;
		String url;
		
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		
		List<UserBuyList> buyListc=new ArrayList<>();	//새로 사는 노래일경우 listc 
		List<Integer> listc=new ArrayList<>();	//중복을 담을 listc
		List<SongBean> songList=new ArrayList<>();	//노래 정보를 DB에서 받아올 listc(다운로드시 필요)
		
		UserInfo rcv=(UserInfo)session.getAttribute("nowLogon");
		UserInfo user=this.buyService.userSelOne(rcv.getId());	//유저정보 DB에서 가져오기
		
		String[] rcvSongNum=request.getParameterValues("num");
		UserBuyList tmp=new UserBuyList();	//mapper에 갈 객체
		int[] songNum=new int[rcvSongNum.length];
		
		for(int i=0; i<rcvSongNum.length; i++ ){
			songNum[i]=Integer.parseInt(rcvSongNum[i]);
			tmp.setBuyMusic(songNum[i]);	//검색할 노래 번호을 tmp객체에 넣는다
			tmp.setNum(user.getNum());		//검색할 유저num을 tmp객체에 넣는다
			
			UserBuyList rcvList=this.buyService.selBuyListOne(tmp);	//중복되는 노래 번호를 찾는다
			SongBean songBean=this.buyService.selSongOne(songNum[i]);	//노래 정보 select
			songList.add(songBean);	//찾은 노래 정보를 listc에 넣는다
			
			if(rcvList!=null){	//재 다운로드가 있다면
				listc.add(rcvList.getBuyMusic());
			}else{	//재 다운로드가 아니라면
				rcvList=new UserBuyList();
				rcvList.setChargeWay("이용권");
				rcvList.setClassify("곡 구매");
				rcvList.setNum(user.getNum());
				rcvList.setBuyMusic(songNum[i]);
				buyListc.add(rcvList);
			}
		}
		
		int realDown=rcvSongNum.length-listc.size();	//중복을 뺀 다운로드 총 수
		
		user.setRemainMusic(user.getRemainMusic()-realDown);
		int res=this.buyService.tiMusicCharge(user, buyListc);
		
		if(res>0){	//성공
			msg="구매에 성공 했습니다.";
			url="/ES/popup/sucCharg";
			
			mav.addObject("msg", msg);
			mav.addObject("songList", songList);
			
		}else{	//실패
			
			msg="구매에 실패했습니다. 다시 시도해 주세요.";
			url="/ES/popup/msgPrint";
			
			mav.addObject("msg", msg);
			
		}
		
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping("cashMusicCharge")
	public ModelAndView cashMusicCharge(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		
		List<UserBuyList> buyListc=new ArrayList<>();	//새로 사는 노래일경우 listc 
		List<Integer> listc=new ArrayList<>();	//중복을 담을 listc
		List<SongBean> songList=new ArrayList<>();	//노래 정보를 DB에서 받아올 listc(다운로드시 필요)
		
		UserInfo rcv=(UserInfo)session.getAttribute("nowLogon");
		UserInfo user=this.buyService.userSelOne(rcv.getId());	//유저정보 DB에서 가져오기
		
		String[] rcvSongNum=request.getParameterValues("num");
		UserBuyList tmp=new UserBuyList();	//mapper에 갈 객체
		int[] songNum=new int[rcvSongNum.length];
		
		String url="";
		String msg="";
		
		for(int i=0; i<rcvSongNum.length; i++ ){
			songNum[i]=Integer.parseInt(rcvSongNum[i]);
			tmp.setBuyMusic(songNum[i]);	//검색할 노래 번호을 tmp객체에 넣는다
			tmp.setNum(user.getNum());		//검색할 유저num을 tmp객체에 넣는다
			
			UserBuyList rcvList=this.buyService.selBuyListOne(tmp);	//중복되는 노래 번호를 찾는다
			SongBean songBean=this.buyService.selSongOne(songNum[i]);	//노래 정보 select
			songList.add(songBean);	//찾은 노래 정보를 listc에 넣는다
			
			if(rcvList!=null){	//재 다운로드가 있다면
				listc.add(rcvList.getBuyMusic());
			}else{	//재 다운로드가 아니라면
				rcvList=new UserBuyList();
				rcvList.setChargeWay("캐시");
				rcvList.setClassify("곡 구매");
				rcvList.setNum(user.getNum());
				rcvList.setBuyMusic(songNum[i]);
				buyListc.add(rcvList);
			}
		}
		
		int realDown=(rcvSongNum.length-listc.size())*this.musicPrice;	//중복을 뺀 다운로드 총 가격
		
		user.setCash(user.getCash()-realDown);
		int res=this.buyService.cashMusicCharge(user, buyListc);
		
		if(res>0){	//성공
			
			msg="구매에 성공 했습니다.";
			url="/ES/popup/sucCharg";
			
			mav.addObject("msg", msg);
			mav.addObject("songList", songList);
			
		}else{	//실패
			
			msg="구매에 실패했습니다. 다시 시도해 주세요.";
			url="/ES/popup/msgPrint";
			
			mav.addObject("msg", msg);
			
		}
		
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping("albumChargeForm")
	public ModelAndView albumChargeForm(HttpServletRequest request){	//앨범 구매 메소드
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		
		List<Integer> listc=new ArrayList<>();
		
		UserInfo rcv=(UserInfo)session.getAttribute("nowLogon");
		UserInfo user=this.buyService.userSelOne(rcv.getId());	//유저정보 DB에서 가져오기
		
		UserBuyList tmp=new UserBuyList();	//mapper에 갈 객체
		
		int albumNum=Integer.parseInt(request.getParameter("num"));
		
		AlbumBean albumBean=this.buyService.albumSelOne(albumNum);
		List<SongBean> songList=this.buyService.selSongList(albumBean);	//앨범 안에 곡들을 알기 위한 select
		int total=songList.size();
		
		for(SongBean each : songList){
			tmp.setBuyMusic(each.getNum());	//검색할 노래 번호을 tmp객체에 넣는다
			tmp.setNum(user.getNum());		//검색할 num을 tmp객체에 넣는다
			
			UserBuyList buyList=this.buyService.selBuyListOne(tmp);	//중복되는 노래 번호를 찾는다
			
			if(buyList!=null){	//재 다운로드가 있다면
				listc.add(buyList.getBuyMusic());
			}
			
		}
		
		int reDown=listc.size();	//중복곡수
		
		mav.addObject("musicPrice", this.musicPrice);	//노래 가격
		mav.addObject("songList", songList);	//노래 정보가 담긴 listc
		mav.addObject("reDown", reDown);	//중복 곡 갯수
		mav.addObject("listc", listc);	//중복 노래 번호을 담은 listc
		mav.addObject("user", user);	//남은 이용권수/캐시를 위한 user객체 보내기
		mav.addObject("total", total);	//결제할 총 곡의 숫자를 위해 total객체 보내기
		mav.setViewName("/ES/popup/songChargeForm");
		
		return mav;
	}
	
	@RequestMapping("goTerms")
	public ModelAndView goPhoneTerms(int num){		//이용약관 가는 메소드
		ReadFile rf=new ReadFile();
		
		ModelAndView mav=new ModelAndView();
		List<String> listc=new ArrayList<>();
		
		if(num==1){		//이용약관
			listc=rf.phoneTerms(num);
			
		}else if(num==2){	//개인정보 수집 및 이용에 대한 안내 
			listc=rf.phoneTerms(num);
		}else if(num==3){	//카드 이용약관
			listc=rf.cardTerms(num);
		}
		
		mav.addObject("listc", listc);
		
		mav.setViewName("/ES/popup/viewTerms");
		return mav;
	}
}
