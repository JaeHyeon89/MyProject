package spring.mvc.springPro.JH;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.service.user.UserService;


@Controller
public class Log_Cont{
	@Resource(name="uServ")
	UserService uServ;
	
	ModelAndView mav;
	
	
	@RequestMapping(value="JH/02_log/logOut", method=RequestMethod.GET)
	public ModelAndView logOut(HttpSession session){
		mav = new ModelAndView();
		session.removeAttribute("nowLogon");
		mav.addObject("msg", "정상적으로 로그아웃 되었습니다.");
		mav.setViewName("home");
		
		return mav;
	}
	
//	로그인
	@RequestMapping(value="JH/02_log/login", method=RequestMethod.POST)
	public ModelAndView login(UserInfo bean, HttpSession session,HttpServletRequest req){
		System.out.println(req.getRequestURI());
		mav = new ModelAndView();
		String logMsg;
		Object res = uServ.selectOne(bean);
		
		if(res != null){
			UserInfo temp = (UserInfo) res;
			logMsg = temp.getNickName() + "님 환영합니다.";
			session.setAttribute("nowLogon", res);
		}else {
			logMsg = "일치하는 회원정보가 없습니다. 다시 시도해주세요.";
			System.out.println(logMsg);
		}
		mav.addObject("logMsg", logMsg);
		mav.setViewName("JH/02_log/logConn");
		return mav;
	}
	
	
//	아이디 찾기
	@RequestMapping(value="JH/02_log/idFind", method=RequestMethod.POST)
	public ModelAndView idFind(HttpServletRequest req){
		mav = new ModelAndView();
		
		UserInfo bean = new UserInfo();
		bean.setPhone(req.getParameter("phone"));
		
		Object res = uServ.findId(bean);
		
		if(res != null){
			UserInfo temp = (UserInfo) res;
			mav.addObject("findID", temp.getId());
		}else {
			mav.addObject("findID", -1);
		}
		mav.setViewName("JH/02_log/findConn");
		return mav;
	}
	
//	비밀번호 찾기
	@RequestMapping(value="JH/02_log/pwFind", method=RequestMethod.POST)
	public ModelAndView pwFind(UserInfo bean){
		mav = new ModelAndView();
		Object res = uServ.findPw(bean);
		
		if(res != null){
			UserInfo temp = (UserInfo) res;
			mav.addObject("findPW", temp);
		}else {
			mav.addObject("findPW", -1);
		}
		mav.setViewName("JH/02_log/findConn");
		return mav;
	}
	
//	비밀번호 찾은 후 수정
	@RequestMapping(value="JH/02_log/pwchange", method=RequestMethod.POST)
	public ModelAndView pwChange(UserInfo bean){
		mav = new ModelAndView();
		boolean ok = uServ.updatePassword(bean);
		
		if(ok){
			mav.addObject("findMsg", "비밀번호 변경에 성공했습니다.");
		}else {
			mav.addObject("findMsg", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
		}
		mav.setViewName("JH/02_log/findConn");
		return mav;
	}
	
}
