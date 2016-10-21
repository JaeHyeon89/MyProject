package spring.mvc.springPro.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.ThemeList;
import spring.mvc.springPro.service.admin.AdminThemeService;

@Controller
@RequestMapping("adminJK/music/theme")
public class AdminThemeController {

	@Autowired
	AdminThemeService adminThemeService;


	@RequestMapping("/{view}")
	public String works(@PathVariable String view) {

		System.out.println("view : " + view);

		return "adminJK/music/theme/" + view;
	}

	@RequestMapping(value = "/selectList", method = RequestMethod.GET)
	public ModelAndView selectList(String nowPage) {

		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		List<ThemeList> listc = this.adminThemeService.selectList(pBean);
		pBean.setRcvCount(listc.size());
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("pBean",pBean);
		mav.addObject("listc", listc);
		mav.setViewName("adminJK/music/theme/selectList");

		return mav;
	}

	@RequestMapping(value = "/insertOne", method = RequestMethod.GET)
	public String insertForm() {

		return "adminJK/music/theme/insertForm";
	}

	@RequestMapping(value = "/insertOne", method = RequestMethod.POST)
	public String insertOne(ThemeList bean) {



		int res = this.adminThemeService.insertOne(bean);

		if (res > 0) {
			System.out.println("#.theme 입력성공");
		} else {
			System.out.println("#.theme 입력실패");
		}

		return "redirect:selectList";
	}

	@RequestMapping(value = "/updateOne", method = RequestMethod.GET)
	public ModelAndView updateForm(Integer num) {

		ThemeList bean = this.adminThemeService.selectOne(num);

		ModelAndView mav = new ModelAndView();

		mav.addObject("bean", bean);
		mav.setViewName("adminJK/music/theme/updateForm");

		return mav;
	}

	@RequestMapping(value = "/updateOne", method = RequestMethod.POST)
	public String updateOne(ThemeList bean) {

		
		int res = this.adminThemeService.updateOne(bean);

		if (res > 0) {
			System.out.println("#.theme 수정성공");
		} else {
			System.out.println("#.theme 수정실패");
		}

		return "redirect:selectList";
	}

	@RequestMapping(value = "/deleteOne", method = RequestMethod.GET)
	public String deleteOne(Integer num) {

		int res = this.adminThemeService.deleteOne(num);

		if (res > 0) {
			System.out.println("#.theme 삭제성공");
		} else {
			System.out.println("#.theme 삭제실패");
		}

		return "redirect:selectList";
	}

}
