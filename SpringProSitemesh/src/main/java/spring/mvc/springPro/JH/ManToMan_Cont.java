package spring.mvc.springPro.JH;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.customer.UserQuestionBoard;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.service.user.CustomerService;


@Controller
public class ManToMan_Cont {

	ModelAndView mav;
	
	@Resource(name="cServ")
	CustomerService cServ;
	
	@RequestMapping(value="JH/06_manToMan/goInquire", method=RequestMethod.GET )
	public ModelAndView goPage(HttpSession session){
		
		mav = new ModelAndView();
		if(session.getAttribute("nowLogon") != null){
			mav.setViewName("JH/06_manToMan/goInquire");
		}else {
			mav.setViewName("JH/00_error/needLogin");
		}
		return mav;
	}
	
	@RequestMapping(value="JH/06_manToMan/goInquire", method=RequestMethod.POST)
	public ModelAndView inquire(HttpSession session, UserQuestionBoard bean){
		mav = new ModelAndView();
		UserInfo info = (UserInfo)session.getAttribute("nowLogon");
		
		bean.setWriter(info.getId());
		
		boolean count = cServ.countMyQuestion(info);
		
		if(count){ // 유저가 남긴 1:1문의 중 답변을 받지 않은 글의 개수 5개 미만
			boolean ok = cServ.insertQuestion(bean);
			if(ok){
				mav.addObject("msg", "문의가 등록되었습니다. 내 문의보기에서 확인이 가능합니다");
			}else{
				System.out.println("저장 실패");
				mav.addObject("msg", "문의가 등록에 실패했습니다. 같은 오류가 반복되면 관리자에게 문의해주세요");
			}
		}else { // 유저가 남긴 1:1문의 중 답변을 받지 않은 글의 개수 5개 미만 - 제한 사유
			mav.addObject("msg", "회원님의 문의가 접수중입니다. 답변이 완료되면 문의해주세요.");
		}
		
		
		mav.setViewName("JH/06_manToMan/inqConn");
		return mav;
	}
	
	
	@RequestMapping(value="JH/06_manToMan/myInquireList", method=RequestMethod.GET)
	public ModelAndView myInquire(HttpSession session){
		mav = new ModelAndView();
		UserInfo bean = (UserInfo)session.getAttribute("nowLogon");
		
		List<Object> listc = cServ.getMyInquire(bean);
		
		if(listc != null){
			mav.addObject("myQuestion", listc);
		}else{
//			mav.addObject("myQuestion", null);
		}
		mav.addObject("myQuest", "ok");
		mav.setViewName("JH/06_manToMan/myQuestion");
		return mav;
	}
	
}
