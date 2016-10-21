package spring.mvc.springPro.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.GenreList;
import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.song.ThemeList;
import spring.mvc.springPro.service.admin.AdminGenreService;
import spring.mvc.springPro.service.admin.AdminSongService;
import spring.mvc.springPro.service.admin.AdminThemeService;
import spring.mvc.springPro.service.admin.FileWorks;

@Controller
@RequestMapping("adminJK/music/song")
public class AdminSongController {

	@Autowired
	AdminSongService adminSongService;

	@Autowired
	AdminThemeService adminThemeService;
	
	@Autowired
	AdminGenreService adminGenreService;
	
	@Resource(name = "fileWorks")
	FileWorks FileWorks;

	@RequestMapping("/{view}")
	public String works(@PathVariable String view) {

		System.out.println("view : " + view);

		return "adminJK/music/song/" + view;
	}

	@RequestMapping(value = "/selectList", method = RequestMethod.GET)
	public ModelAndView selectList(String nowPage) {

		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		List<SongBean> listc = this.adminSongService.selectList(pBean);
		pBean.setRcvCount(listc.size());
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("pBean",pBean);
		mav.addObject("listc", listc);
		mav.setViewName("adminJK/music/song/selectList");

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
		List<SongBean> listc = this.adminSongService.selectListA(pBean);
		pBean.setRcvCount(listc.size());
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("pBean",pBean);
		mav.addObject("listc", listc);
		mav.setViewName("adminJK/music/song/selectListA");

		return mav;
	}
	
	@RequestMapping(value="/selectOne", method=RequestMethod.GET)
	public ModelAndView selectOne(Integer num) {
		
		SongBean bean = this.adminSongService.selectOne(num);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bean",bean);
		mav.setViewName("adminJK/music/song/selectOne");
		
		return mav;
	}

	@RequestMapping(value = "/insertOne", method = RequestMethod.GET)
	public ModelAndView insertForm() {
		
		List<GenreList> listcG = this.adminGenreService.selectList2();
		List<ThemeList> listcT = this.adminThemeService.selectList2();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("listcG", listcG);
		mav.addObject("listcT", listcT);
		mav.setViewName("adminJK/music/song/insertForm");
		
		return mav;
	}

	@RequestMapping(value = "/insertOne", method = RequestMethod.POST)
	public String insertOne(SongBean bean, @RequestParam ArrayList<String> genre
			, @RequestParam ArrayList<String> theme
			,@RequestParam(value = "upfilePhoto", required = false) MultipartFile upfilePhoto
			,@RequestParam(value = "upfile", required = false) MultipartFile upfile) {

//		장르태그
		bean.setMusicStyle(genre.toString());
//		테마태그
		bean.setThemeTag(theme.toString());
		
//		 upload셋팅
		boolean isExistUpPhotoFile = this.FileWorks.uploadAndGetName("song", upfilePhoto);
		boolean isExistUpFile = this.FileWorks.uploadAndGetName("song", upfile);

		if (isExistUpPhotoFile) {
			bean.setPhotoSysName(FileWorks.getSysName());
			bean.setPhotoOrgName(FileWorks.getOrgName());
		} else {
			bean.setPhotoSysName("none");
			bean.setPhotoOrgName("none");
		}
		if (isExistUpFile) {
			bean.setSysName(FileWorks.getSysName());
			bean.setOrgName(FileWorks.getOrgName());
		} else {
			bean.setSysName("none");
			bean.setOrgName("none");
		}

		int res = this.adminSongService.insertOne(bean);

		if (res > 0) {
			System.out.println("#.song 입력성공");
		} else {
			System.out.println("#.song 입력실패");
		}

		return "redirect:selectList";
	}

	@RequestMapping(value = "/updateOne", method = RequestMethod.GET)
	public ModelAndView updateForm(Integer num) {

		SongBean bean = this.adminSongService.selectOne(num);
		List<GenreList> listcG = this.adminGenreService.selectList2();
		List<ThemeList> listcT = this.adminThemeService.selectList2();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("listcG", listcG);
		mav.addObject("listcT", listcT);
		mav.addObject("bean", bean);
		mav.setViewName("adminJK/music/song/updateForm");

		return mav;
	}

	@RequestMapping(value = "/updateOne", method = RequestMethod.POST)
	public String updateOne(SongBean bean, @RequestParam ArrayList<String> genre
			, @RequestParam ArrayList<String> theme
			,@RequestParam(value = "upfilePhoto", required = false) MultipartFile upfilePhoto
			,@RequestParam(value = "upfile", required = false) MultipartFile upfile) {

//		장르태그
		bean.setMusicStyle(genre.toString());
//		테마태그
		bean.setThemeTag(theme.toString());

//		 upload셋팅
		boolean isExistUpPhotoFile = this.FileWorks.uploadAndGetName("song", upfilePhoto);
		boolean isExistUpFile = this.FileWorks.uploadAndGetName("song", upfile);

		if (isExistUpPhotoFile) {
			bean.setPhotoSysName(FileWorks.getSysName());
			bean.setPhotoOrgName(FileWorks.getOrgName());
		} else {
			bean.setPhotoSysName(bean.getPhotoSysName());
			bean.setPhotoOrgName(bean.getPhotoOrgName());
		}
		if (isExistUpFile) {
			bean.setSysName(FileWorks.getSysName());
			bean.setOrgName(FileWorks.getOrgName());
		} else {
			bean.setSysName(bean.getSysName());
			bean.setOrgName(bean.getOrgName());
		}
		
		int res = this.adminSongService.updateOne(bean);

		if (res > 0) {
			System.out.println("#.song 수정성공");
		} else {
			System.out.println("#.song 수정실패");
		}

		return "redirect:selectList";
	}

	@RequestMapping(value = "/deleteOne", method = RequestMethod.GET)
	public String deleteOne(Integer num) {

		int res = this.adminSongService.deleteOne(num);

		if (res > 0) {
			System.out.println("#.song 삭제성공");
		} else {
			System.out.println("#.song 삭제실패");
		}

		return "redirect:selectList";
	}

}
