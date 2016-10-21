package spring.mvc.springPro.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.customer.UserQuestionBoard;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.service.admin.AdminUserInfoService;
import spring.mvc.springPro.service.admin.AdminUserQuestionService;

@Controller
@RequestMapping("adminJK/user/userInfo")
public class AdminUserInfoController {

	@Autowired
	AdminUserInfoService adminUserInfoService;
	
	@Autowired
	AdminUserQuestionService adminUserQuestionService;

	@RequestMapping("/{view}")
	public String works(@PathVariable String view) {

		System.out.println("view : " + view);

		return "adminJK/user/userInfo/" + view;
	}

	@RequestMapping(value = "/selectList", method = RequestMethod.GET)
	public ModelAndView selectList(String nowPage) {

		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		List<UserInfo> listc = this.adminUserInfoService.selectList(pBean);
		pBean.setRcvCount(listc.size());
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("pBean",pBean);
		mav.addObject("listc", listc);
		mav.setViewName("adminJK/user/userInfo/selectList");

		return mav;
	}
	
	@RequestMapping(value="/selectOne", method=RequestMethod.GET)
	public ModelAndView selectOne(Integer num) {
		
		UserInfo bean = this.adminUserInfoService.selectOne(num);
		List<UserQuestionBoard> listc = this.adminUserQuestionService.selectList2();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bean",bean);
		mav.addObject("listc",listc);
		mav.setViewName("adminJK/user/userInfo/selectOne");
		
		return mav;
	}

	@RequestMapping(value = "/insertOne", method = RequestMethod.GET)
	public String insertForm() {

		return "adminJK/user/userInfo/insertForm";
	}

	@RequestMapping(value = "/insertOne", method = RequestMethod.POST)
	public String insertOne(UserInfo bean, @RequestParam String ticketEnd2) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try {
			Date ticketEnd = sdf.parse(ticketEnd2);
			bean.setTicketEnd(ticketEnd);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int res = this.adminUserInfoService.insertOne(bean);

		if (res > 0) {
			System.out.println("#.userInfo 입력성공");
		} else {
			System.out.println("#.userInfo 입력실패");
		}

		return "redirect:selectList";
	}

	@RequestMapping(value = "/updateOne", method = RequestMethod.GET)
	public ModelAndView updateForm(Integer num) {

		UserInfo bean = this.adminUserInfoService.selectOne(num);

		ModelAndView mav = new ModelAndView();

		mav.addObject("bean", bean);
		mav.setViewName("adminJK/user/userInfo/updateForm");

		return mav;
	}

	@RequestMapping(value = "/updateOne", method = RequestMethod.POST)
	public String updateOne(UserInfo bean, @RequestParam String ticketEnd2) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
		
		try {
			Date ticketEnd = sdf.parse(ticketEnd2);
			bean.setTicketEnd(ticketEnd);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int res = this.adminUserInfoService.updateOne(bean);

		if (res > 0) {
			System.out.println("#.userInfo 수정성공");
		} else {
			System.out.println("#.userInfo 수정실패");
		}

		return "redirect:selectList";
	}

	@RequestMapping(value = "/deleteOne", method = RequestMethod.GET)
	public String deleteOne(Integer num) {

		int res = this.adminUserInfoService.deleteOne(num);

		if (res > 0) {
			System.out.println("#.userInfo 삭제성공");
		} else {
			System.out.println("#.userInfo 삭제실패");
		}

		return "redirect:selectList";
	}

}
