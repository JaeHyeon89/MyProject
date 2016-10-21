package spring.mvc.springPro.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.customer.UserQuestionBoard;
import spring.mvc.springPro.service.admin.AdminUserQuestionService;

@Controller
@RequestMapping("adminJK/customer/userQuestion")
public class AdminUserQuestionController {

	@Autowired
	AdminUserQuestionService adminUserQuestionService;


	@RequestMapping("/{view}")
	public String works(@PathVariable String view) {

		System.out.println("view : " + view);

		return "adminJK/customer/userQuestion/" + view;
	}

	@RequestMapping(value = "/selectList", method = RequestMethod.GET)
	public ModelAndView selectList(String nowPage) {

		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		List<UserQuestionBoard> listc = this.adminUserQuestionService.selectList(pBean);
		pBean.setRcvCount(listc.size());
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("pBean",pBean);
		mav.addObject("listc", listc);
		mav.setViewName("adminJK/customer/userQuestion/selectList");

		return mav;
	}
	
	@RequestMapping(value = "/selectListA", method = RequestMethod.GET)
	public ModelAndView selectListA(String nowPage) {

		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		List<UserQuestionBoard> listc = this.adminUserQuestionService.selectListA(pBean);
		pBean.setRcvCount(listc.size());
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("pBean",pBean);
		mav.addObject("listc", listc);
		mav.setViewName("adminJK/customer/userQuestion/selectListA");

		return mav;
	}
	
	@RequestMapping(value="/selectOne", method=RequestMethod.GET)
	public ModelAndView selectOne(Integer num) {
		
		UserQuestionBoard bean = this.adminUserQuestionService.selectOne(num);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bean",bean);
		mav.setViewName("adminJK/customer/userQuestion/selectOne");
		
		return mav;
	}

	@RequestMapping(value = "/insertOne", method = RequestMethod.GET)
	public ModelAndView insertForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminJK/customer/userQuestion/insertForm");
		
		return mav;
	}

	@RequestMapping(value = "/insertOne", method = RequestMethod.POST)
	public String insertOne(UserQuestionBoard bean){

		int res = this.adminUserQuestionService.insertOne(bean);

		if (res > 0) {
			System.out.println("#.userQuestion 입력성공");
		} else {
			System.out.println("#.userQuestion 입력실패");
		}

		return "redirect:selectList";
	}

	@RequestMapping(value = "/updateOne", method = RequestMethod.GET)
	public ModelAndView updateForm(Integer num) {

		UserQuestionBoard bean = this.adminUserQuestionService.selectOne(num);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bean", bean);
		mav.setViewName("adminJK/customer/userQuestion/updateForm");

		return mav;
	}

	@RequestMapping(value = "/updateOne", method = RequestMethod.POST)
	public String updateOne(UserQuestionBoard bean){
		
		int res = this.adminUserQuestionService.updateOne(bean);

		if (res > 0) {
			System.out.println("#.userQuestion 수정성공");
		} else {
			System.out.println("#.userQuestion 수정실패");
		}

		return "redirect:selectList";
	}

	@RequestMapping(value = "/deleteOne", method = RequestMethod.GET)
	public String deleteOne(Integer num) {

		int res = this.adminUserQuestionService.deleteOne(num);

		if (res > 0) {
			System.out.println("#.userQuestion 삭제성공");
		} else {
			System.out.println("#.userQuestion 삭제실패");
		}

		return "redirect:selectList";
	}

}
