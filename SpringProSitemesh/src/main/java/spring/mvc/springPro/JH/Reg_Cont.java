package spring.mvc.springPro.JH;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.buy.PhoneBean;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.service.user.UserService;


@Controller
public class Reg_Cont {
	
	ModelAndView mav;

	@Autowired
	UserService uServ;
	
	
	@RequestMapping(method=RequestMethod.GET)
	public void goPage(){
		
	}
	
	@RequestMapping(value="JH/01_reg/idCheck", method=RequestMethod.POST)
	public @ResponseBody Object idCheck(UserInfo bean){
		Object result;
		UserInfo res = (UserInfo) uServ.idCheck(bean);
		if (res == null) {
			result = "aa";
		} else {
			result = "bb";
		}
		
		return result;
	}
	
	@RequestMapping(value="JH/01_reg/phoneCheck", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public @ResponseBody Object phoneCheck(PhoneBean phoneBean){
		phoneBean.setPhoneNum();
		Object result;
		System.out.println(phoneBean.getTong());
		boolean checkOk = uServ.phoneCheck(phoneBean);
		
		if(checkOk){ // 일치할 경우
			System.out.println("일치");
			result = "a";
		}else { //일치하는 값이 없을 경우
			System.out.println("불일치");
			result = "b";
		}
		return result;
	}
	
	@RequestMapping(value="JH/01_reg/phoneCheck2", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public @ResponseBody Object phoneCheck2(HttpServletRequest req){
		Object result;
		
		if(req.getParameter("conn").equals("1111")){
			result = "인증번호 일치!";
		}else {
			result = null;
		}
		return result;
	}
	
	
	@RequestMapping(value="JH/01_reg/regForm", method=RequestMethod.POST)
	public ModelAndView regForm(UserInfo bean){
		mav = new ModelAndView();
		
		PhoneBean phoneBean = new PhoneBean();
		phoneBean.setPhoneNum(bean.getPhone());
		Object res2 = uServ.userPhoneCheck(phoneBean);
		if(res2 == null){ // 동일한 휴대폰으로 가입된 아이디가 없을 경우
			Object res = uServ.insertOne(bean);
			if(res!=null){ // 회원가입 완료
				mav.addObject("rConn", "good");
			}else {
				System.out.println("회원가입 실패다. 좀 알아봐야쓰겄다");
			}
			
		}else { // 동일한 휴대폰으로 가입된 아이디가 있을 경우
			mav.addObject("rConn", "duple");
			System.out.println("같은 휴대폰으로 가입된 아이디가 있다");
		}
		
		mav.setViewName("JH/01_reg/regConn");
		return mav;
	}
}
