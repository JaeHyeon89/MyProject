package spring.mvc.springPro.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.customer.InfoBoard;
import spring.mvc.springPro.service.admin.AdminInfoService;

@Controller
@RequestMapping("adminJK/customer/info")
public class AdminInfoController {

	@Autowired
	AdminInfoService adminInfoService;


	@RequestMapping("/{view}")
	public String works(@PathVariable String view) {

		System.out.println("view : " + view);

		return "adminJK/customer/info/" + view;
	}

	@RequestMapping(value = "/selectList", method = RequestMethod.GET)
	public ModelAndView selectList(String nowPage) {

		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		List<InfoBoard> listc = this.adminInfoService.selectList(pBean);
		pBean.setRcvCount(listc.size());
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("pBean",pBean);
		mav.addObject("listc", listc);
		mav.setViewName("adminJK/customer/info/selectList");

		return mav;
	}
	
	@RequestMapping(value="/selectOne", method=RequestMethod.GET)
	public ModelAndView selectOne(Integer num) {
		
		InfoBoard bean = this.adminInfoService.selectOne(num);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bean",bean);
		mav.setViewName("adminJK/customer/info/selectOne");
		
		return mav;
	}

	@RequestMapping(value = "/insertOne", method = RequestMethod.GET)
	public ModelAndView insertForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminJK/customer/info/insertForm");
		
		return mav;
	}

	@RequestMapping(value = "/insertOne", method = RequestMethod.POST)
	public String insertOne(InfoBoard bean){

		int res = this.adminInfoService.insertOne(bean);

		if (res > 0) {
			System.out.println("#.info 입력성공");
		} else {
			System.out.println("#.info 입력실패");
		}

		return "redirect:selectList";
	}

	@RequestMapping(value = "/updateOne", method = RequestMethod.GET)
	public ModelAndView updateForm(Integer num) {

		InfoBoard bean = this.adminInfoService.selectOne(num);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bean", bean);
		mav.setViewName("adminJK/customer/info/updateForm");

		return mav;
	}

	@RequestMapping(value = "/updateOne", method = RequestMethod.POST)
	public String updateOne(InfoBoard bean){
	
		int res = this.adminInfoService.updateOne(bean);

		if (res > 0) {
			System.out.println("#.info 수정성공");
		} else {
			System.out.println("#.info 수정실패");
		}

		return "redirect:selectList";
	}

	@RequestMapping(value = "/deleteOne", method = RequestMethod.GET)
	public String deleteOne(Integer num) {

		int res = this.adminInfoService.deleteOne(num);

		if (res > 0) {
			System.out.println("#.info 삭제성공");
		} else {
			System.out.println("#.info 삭제실패");
		}

		return "redirect:selectList";
	}

}
