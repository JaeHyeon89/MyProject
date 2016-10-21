package spring.mvc.springPro.JH;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.service.user.CustomerService;
import spring.mvc.springPro.service.user.UserService;

@Controller()
public class Customer_Cont {
	ModelAndView mav;
	
	@Autowired
	CustomerService cServ;
	
	@RequestMapping(value="JH/03_customer/c_main", method = RequestMethod.GET)
	public ModelAndView customerPage(){
//		System.out.println("Customer 클래스 : " + view);
		mav = new ModelAndView();
		getAllFAQ();
		getInfo();
//		mav.setViewName("JH/03_customer/"+view);
		mav.setViewName("JH/03_customer/c_main");
		return mav;
	}
	
	@RequestMapping(value="popup/FAQ/allFAQ", method = RequestMethod.GET)
	public ModelAndView allFAQ(){
//		System.out.println("Customer 클래스 : " + view);
		mav = new ModelAndView();
		getAllFAQ();
//		mav.setViewName("JH/03_customer/"+view);
		mav.setViewName("popup/FAQ/FAQ");
		return mav;
	}
	
	
//	계정관련
	@RequestMapping(value="popup/FAQ/userFAQ", method = RequestMethod.GET)
	public ModelAndView userFAQ(){
		mav = new ModelAndView();
		List<Object> userFAQ = cServ.getUserFAQ();
		mav.addObject("FAQList", userFAQ);
		mav.setViewName("popup/FAQ/FAQ");
		return mav;
	}
	
//	재생관련
	@RequestMapping(value="popup/FAQ/musicFAQ", method = RequestMethod.GET)
	public ModelAndView musicFAQ(){
		mav = new ModelAndView();
		List<Object> musicFAQ = cServ.getMusicFAQ();
		mav.addObject("FAQList", musicFAQ);
		mav.setViewName("popup/FAQ/FAQ");
		return mav;
	}
	
//	결제관련
	@RequestMapping(value="popup/FAQ/payFAQ", method = RequestMethod.GET)
	public ModelAndView payFAQ(){
		mav = new ModelAndView();
		List<Object> payFAQ = cServ.getPayFAQ();
		mav.addObject("FAQList", payFAQ);
		mav.setViewName("popup/FAQ/FAQ");
		return mav;
	}
	
	
	private void getAllFAQ(){
		List<Object> faqList = cServ.getFAQ();
		mav.addObject("FAQList", faqList);
		System.out.println(faqList.toString());
	}
	
	private void getInfo(){
		List<Object> infoList = cServ.getInfo();
		mav.addObject("infoList", infoList);
		System.out.println(infoList.toString());
	}
	
	
}
