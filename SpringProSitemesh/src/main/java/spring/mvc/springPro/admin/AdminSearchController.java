package spring.mvc.springPro.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.ArtistBean;
import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.service.admin.AdminSearchService;

@Controller
@RequestMapping("adminJK/search")
public class AdminSearchController {

	@Autowired
	AdminSearchService adminSearchService; 
	
	@RequestMapping("/{view}")
	public String works(@PathVariable String view){
		
		System.out.println("view : "+view);
		
		return "adminJK/search/"+view;
	}

	@RequestMapping(value="/selectAlbumList", method=RequestMethod.GET)
	public ModelAndView selectAlbumList(String search,String nowPage) {
		
		System.out.println("selectAlbumList검색어 : " + search);
		
		
		
		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		String[] array=search.split(" ");
		pBean.setSearch(array);
		
		List<AlbumBean> albumListc = this.adminSearchService.resultAlbumList(pBean);
		pBean.setRcvCount(albumListc.size());
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pBean",pBean);
		mav.addObject("albumListc",albumListc);
		mav.setViewName("adminJK/search/resultList");
		
		return mav;
	}
	
	@RequestMapping(value="/selectSongList", method=RequestMethod.GET)
	public ModelAndView selectSongList(String search,String nowPage) {
		
		System.out.println("selectSongList검색어 : " + search);
		
		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		String[] array=search.split(" ");
		pBean.setSearch(array);
		
		
		List<SongBean> songListc = this.adminSearchService.resultSongList(pBean);
		pBean.setRcvCount(songListc.size());
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pBean",pBean);
		mav.addObject("songListc",songListc);
		mav.setViewName("adminJK/search/resultList");
		
		return mav;
	}
	
	@RequestMapping(value="/selectArtistList", method=RequestMethod.GET)
	public ModelAndView selectArtistList(String search,String nowPage) {
		
		System.out.println("selectArtistList검색어 : " + search);
		
		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		String[] array=search.split(" ");
		pBean.setSearch(array);
		
		List<ArtistBean> artistListc = this.adminSearchService.resultArtistList(pBean);
		pBean.setRcvCount(artistListc.size());
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pBean",pBean);
		mav.addObject("artistListc",artistListc);
		mav.setViewName("adminJK/search/resultList");
		
		return mav;
	}
	
	@RequestMapping(value="/selectUserList", method=RequestMethod.GET)
	public ModelAndView selectUserList(String search,String nowPage) {
		
		System.out.println("selectUserList검색어 : " + search);
		
		
		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		String[] array=search.split(" ");
		pBean.setSearch(array);
		
		List<UserInfo> userListc = this.adminSearchService.resultUserList(pBean);
		pBean.setRcvCount(userListc.size());
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pBean",pBean);
		mav.addObject("userListc",userListc);
		mav.setViewName("adminJK/search/resultList");
		
		return mav;
	}
	
	@RequestMapping(value="/selectList", method=RequestMethod.GET)
	public ModelAndView selectList(String search,String nowPage) {
		
		System.out.println("selectList검색어 : " + search);
		
		PageBean pBean = new PageBean();
		if(nowPage != null)	{
			pBean.setNowPage(Integer.parseInt(nowPage));
		} else {
			pBean.setNowPage(1);
		}
		String[] array=search.split(" ");
		pBean.setSearch(array);
		
		
		List<AlbumBean> albumListc = this.adminSearchService.resultAlbumList(pBean);
		List<SongBean> songListc = this.adminSearchService.resultSongList(pBean);
		List<ArtistBean> artistListc = this.adminSearchService.resultArtistList(pBean);
		List<UserInfo> userListc = this.adminSearchService.resultUserList(pBean);
		
		pBean.setRcvCount(5);//최신 5개씩만
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pBean",pBean);
		mav.addObject("albumListc",albumListc);
		mav.addObject("songListc",songListc);
		mav.addObject("artistListc",artistListc);
		mav.addObject("userListc",userListc);
		mav.setViewName("adminJK/search/resultList");
		
		return mav;
	}
	
}


