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
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.AlbumCommentBean;
import spring.mvc.springPro.bean.song.GenreList;
import spring.mvc.springPro.service.admin.AdminAlbumService;
import spring.mvc.springPro.service.admin.AdminGenreService;
import spring.mvc.springPro.service.admin.FileWorks;

@Controller
@RequestMapping("adminJK/music/album")
public class AdminAlbumController {

	@Autowired
	AdminAlbumService adminAlbumService; 
	
	@Autowired
	AdminGenreService adminGenreService;
	
	@Resource(name="fileWorks")
	FileWorks FileWorks;
	
	@RequestMapping("/{view}")
	public String works(@PathVariable String view){
		
		System.out.println("view : "+view);
		
		return "adminJK/music/album/"+view;
	}

	@RequestMapping(value="/selectList", method=RequestMethod.GET)
	public ModelAndView selectList(String nowPage) {
		
		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		List<AlbumBean> listc = this.adminAlbumService.selectList(pBean);
		pBean.setRcvCount(listc.size());
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pBean",pBean);
		mav.addObject("listc",listc);
		mav.setViewName("adminJK/music/album/selectList");
		return mav;
	}
	
	@RequestMapping(value="/selectListA", method=RequestMethod.GET)
	public ModelAndView selectListA(String nowPage) {
		
		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		List<AlbumBean> listc = this.adminAlbumService.selectListA(pBean);
		pBean.setRcvCount(listc.size());
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pBean",pBean);
		mav.addObject("listc",listc);
		mav.setViewName("adminJK/music/album/selectListA");
		return mav;
	}
	
	@RequestMapping(value="/selectOne", method=RequestMethod.GET)
	public ModelAndView selectOne(Integer num) {
		
		AlbumBean bean = this.adminAlbumService.selectOne(num);
		List<AlbumCommentBean> listc = this.adminAlbumService.commentSelectList(num);
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bean",bean);
		mav.addObject("listc",listc);
		mav.setViewName("adminJK/music/album/selectOne");
		
		return mav;
	}
	
	
	@RequestMapping(value="/insertOne", method=RequestMethod.GET)
	public ModelAndView insertForm() {
		
		List<GenreList> listc = this.adminGenreService.selectList2();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("listc", listc);
		mav.setViewName("adminJK/music/album/insertForm");
		
		return mav;
	}
	
	@RequestMapping(value="/insertOne", method=RequestMethod.POST)
	public String insertOne(AlbumBean bean, @RequestParam ArrayList<String> genre
			,@RequestParam(value = "upfilePhoto", required = false) MultipartFile upfilePhoto
			,@RequestParam(value = "upfile", required = false) MultipartFile upfile) {

//		장르태그
		bean.setMusicStyle(genre.toString());
		
//		평점계산
		if (bean.getRecomCount()==0) {
			bean.setAvgCount(0.0);
		}else {
			bean.setAvgCount((double)bean.getTotalCount()/bean.getRecomCount());
		}
		
//		 upload셋팅
		boolean isExistUpPhotoFile = this.FileWorks.uploadAndGetName("album", upfilePhoto);
		boolean isExistUpFile = this.FileWorks.uploadAndGetName("album", upfile);

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
		
		
		int res = this.adminAlbumService.insertOne(bean);
		
		if(res>0) {
			System.out.println("#.album 입력성공");
		} else {
			System.out.println("#.album 입력실패");
		}
		
		return "redirect:selectList";
	}
	
	@RequestMapping(value="/updateOne", method=RequestMethod.GET)
	public ModelAndView updateForm(Integer num) {
		
		
		AlbumBean bean = this.adminAlbumService.selectOne(num);
		List<GenreList> listc = this.adminGenreService.selectList2();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("listc", listc);
		mav.addObject("bean",bean);
		mav.setViewName("adminJK/music/album/updateForm");
		
		return mav;
	}
	
	@RequestMapping(value="/updateOne", method=RequestMethod.POST)
	public String updateOne(AlbumBean bean, @RequestParam ArrayList<String> genre
			,@RequestParam(value = "upfilePhoto", required = false) MultipartFile upfilePhoto
			,@RequestParam(value = "upfile", required = false) MultipartFile upfile) {

//		장르태그
		bean.setMusicStyle(genre.toString());
	
//		평점계산
		if (bean.getRecomCount()==0) {
			bean.setAvgCount(0.0);
		}else {
			bean.setAvgCount((double)bean.getTotalCount()/bean.getRecomCount());
		}
		
//		 upload셋팅
		boolean isExistUpPhotoFile = this.FileWorks.uploadAndGetName("album", upfilePhoto);
		boolean isExistUpFile = this.FileWorks.uploadAndGetName("album", upfile);

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
		
		
		int res = this.adminAlbumService.updateOne(bean);
		
		if(res>0) {
			System.out.println("#.user 수정성공");
		} else {
			System.out.println("#.user 수정실패");
		}
		
		return "redirect:selectList";
	}
	
	@RequestMapping(value="/deleteOne", method=RequestMethod.GET)
	public String deleteOne(Integer num) {
	
		
		int res = this.adminAlbumService.deleteOne(num);
		
		if(res>0) {
			System.out.println("#.album 삭제성공");
		} else {
			System.out.println("#.album 삭제실패");
		}
		
		return "redirect:selectList";
	}
	
	
	
	
	@RequestMapping(value="/comment/insertOne", method=RequestMethod.POST)
	public String commentInsertOne(AlbumCommentBean bean) {
		
		int res = this.adminAlbumService.commentInsertOne(bean);
		
		if(res>0) {
			System.out.println("#.album 입력성공");
		} else {
			System.out.println("#.album 입력실패");
		}
		
		return "redirect:../selectList";
	}
	
	
	@RequestMapping(value="/comment/updateOne", method=RequestMethod.POST)
	public String commentUpdateOne(AlbumCommentBean bean) {
	
		
		
		int res = this.adminAlbumService.commentUpdateOne(bean);
		
		if(res>0) {
			System.out.println("#.user 수정성공");
		} else {
			System.out.println("#.user 수정실패");
		}
		
		return "redirect:../selectList";
	}
	
	@RequestMapping(value="/comment/deleteOne", method=RequestMethod.GET)
	public String commentDeleteOne(Integer num) {
	
		
		int res = this.adminAlbumService.commentDeleteOne(num);
		
		if(res>0) {
			System.out.println("#.album 삭제성공");
		} else {
			System.out.println("#.album 삭제실패");
		}
		return "redirect:../selectList";
	}
	
}


