package spring.mvc.springPro;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.AlbumCommentBean;
import spring.mvc.springPro.bean.song.GenreList;
import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.song.ThemeList;
import spring.mvc.springPro.service.JG.SongRepository;


@Controller
public class SongController {

	
	
	@Autowired
	SongRepository SongRepository;

	ModelAndView mav;
	
	
	@RequestMapping("kwang/info/photo")
	public ModelAndView works(@RequestParam String photo) {

		ModelAndView mav = new ModelAndView();
		System.out.println(photo);
		mav.addObject("photo",photo);
		mav.setViewName("kwang/Info/photo");
		
		
		return mav;
	}
	
	
//	음악차트
	@RequestMapping(value="kwang/total", method=RequestMethod.GET)
	public ModelAndView goMusicPage(){
		mav = new ModelAndView();
		songList();
		realTimeList();
		mav.setViewName("kwang/total");
		return mav;
		
	}
	
//	앨범차트
	@RequestMapping(value="kwang/album", method=RequestMethod.GET)
	public ModelAndView goAlbumPage(){
		mav = new ModelAndView();
		
		albumList();
		mav.setViewName("kwang/album");
		return mav;
		
	}
	
	
//	테바별
//	@RequestMapping(value="kwang/theme", method=RequestMethod.GET)
//	public ModelAndView goThemePage(){
//		System.out.println("awrer");
//		mav = new ModelAndView();
//		
//		themeStyle();
//		mav.setViewName("kwang/theme");
//		return mav;
//		
//	}
	
	
//	앨범점보보기 //코멘트 기능 보강
	@RequestMapping("albumInfo")
	public ModelAndView goAlbumInfo(@RequestParam("name") String name){
		ModelAndView mav=new ModelAndView();
		List<Object> listAlbum = this.SongRepository.albumInfo(name);
		List<Object> listSong = this.SongRepository.albumInSong(name);
		AlbumBean bean = (AlbumBean)listAlbum.get(0);
		List<Object> listCmt = this.SongRepository.commentSelectList(bean.getNum());
		mav.addObject("listAlbum",listAlbum);
		mav.addObject("listSong", listSong);
		mav.addObject("listCmt", listCmt);
		mav.addObject("bean",bean);
		mav.addObject("name",name);
		mav.setViewName("/kwang/Info/AlbumInfo");
		return mav;
	}
	
	
	
	
//	아티스트정보보기
	@RequestMapping("artistInfo")
	public ModelAndView goArtistInfo(@RequestParam("name") String name) {
		ModelAndView mav=new ModelAndView();
		List<Object> listArtist = this.SongRepository.artistInfo(name);
		List<Object> artistSong = this.SongRepository.artistSong(name);
		mav.addObject("listArtist",listArtist);
		mav.addObject("artistSong",artistSong);
		mav.setViewName("/kwang/Info/ArtistInfo");
		return mav;
		
	}
	
//	가사보기
	@RequestMapping("lyrics")
	public ModelAndView goLyricsInfo(@RequestParam("num") int num) {
		ModelAndView mav=new ModelAndView();
		List<Object> listLyrics = this.SongRepository.lyricsInfo(num);
		mav.addObject("listLyrics",listLyrics);
		mav.setViewName("/kwang/Info/Lyrics");
		return mav;
		
	}
	
	
//	테마별 보기
	@RequestMapping(value="kwang/theme", method=RequestMethod.GET)
	public ModelAndView gothemeInfo() {
		System.out.println("들어옴");
		ModelAndView mav=new ModelAndView();
		System.out.println("들어옴444");
		List<SongBean> list01Theme = this.SongRepository.list01Theme();
		List<SongBean> list02Theme = this.SongRepository.list02Theme();
		List<SongBean> list03Theme = this.SongRepository.list03Theme();
		List<SongBean> list04Theme = this.SongRepository.list04Theme();
		List<SongBean> list05Theme = this.SongRepository.list05Theme();
		List<SongBean> list06Theme = this.SongRepository.list06Theme();
		List<SongBean> list07Theme = this.SongRepository.list07Theme();
		System.out.println("들어옴1");
		mav.addObject("list01Theme",list01Theme);
		mav.addObject("list02Theme",list02Theme);
		mav.addObject("list03Theme",list03Theme);
		mav.addObject("list04Theme",list04Theme);
		mav.addObject("list05Theme",list05Theme);
		mav.addObject("list06Theme",list06Theme);
		mav.addObject("list07Theme",list07Theme);
		System.out.println("들어옴2");
		mav.setViewName("kwang/theme");
		System.out.println("들어옴3");
		return mav;
	}	
//테마별 보기 12.21추가
@RequestMapping(value="kwang/theme2", method=RequestMethod.GET)
public ModelAndView gothemeInfo2() {
	ModelAndView mav=new ModelAndView();
	
	List<ThemeList> themeList = this.SongRepository.themeList();
	
	HashMap<Integer,List<SongBean>> hmap = new HashMap<>();
	
	for(ThemeList theme : themeList) {
		List<SongBean> bean = this.SongRepository.selectList(theme);
		hmap.put(theme.getNum(), bean);
	}
	mav.addObject("themeList",themeList);
	mav.addObject("hmap",hmap);
	mav.setViewName("kwang/theme2");
	return mav;
}

//장르별 보기 12.30추가
@RequestMapping(value="kwang/genre", method=RequestMethod.GET)
public ModelAndView gogenreInfo2() {
	ModelAndView mav=new ModelAndView();
	
	List<GenreList> genreList = this.SongRepository.genreList();
	
	HashMap<Integer,List<SongBean>> hmap = new HashMap<>();
	
	for(GenreList genre : genreList) {
		List<SongBean> bean = this.SongRepository.selectListG(genre);
		hmap.put(genre.getNum(), bean);
	}
	mav.addObject("genreList",genreList);
	mav.addObject("hmap",hmap);
	mav.setViewName("kwang/genre");
	return mav;
}
	
	

//	음악재생	
	@RequestMapping("musicPlayer")
	public ModelAndView musicPlayer(HttpServletRequest request){
		
		String[] rcv=request.getParameterValues("num");
		List<SongBean> songList=new ArrayList<>();
		for(int i=0; i<rcv.length; i++){
			int num=Integer.parseInt(rcv[i]);
			SongBean songBean=this.SongRepository.choiceList(num);
			songList.add(songBean);
			
		}
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("songList", songList);
		mav.setViewName("/kwang/song/MusicPlayer");
		
		return mav;
	}
	
//	선택재생
	@RequestMapping("checkPlay")
	public ModelAndView checkPlay(HttpServletRequest request) {
		
		System.out.println("들어오나?");
		
		String[] rcv=request.getParameterValues("num");
		List<SongBean> checkList=new ArrayList<>();
		System.out.println("들어오나?1");
		for(int i=0; i<rcv.length; i++){
			int num=Integer.parseInt(rcv[i]);
			System.out.println(num);
			System.out.println("들어오나?2");
			SongBean songBean=this.SongRepository.checkList(num);
			System.out.println("들어오나?3");
			checkList.add(songBean);
			
		}
		System.out.println("들어오나?4");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("songList", checkList);
		mav.setViewName("/kwang/song/MusicPlayer");
		
		return mav;
	}
		
		
	
	
//	추천하기
	@RequestMapping("recommend")
	public ModelAndView recommend(@RequestParam("num") int num) {
		ModelAndView mav=new ModelAndView();
		
		int res = this.SongRepository.recommend(num);
		String msg="";
		
		if(res>0){
			msg="성공";
		}else{
			msg="실패";
		}
		
		mav.addObject("msg", msg);
		mav.setViewName("/kwang/popup/recommend");
		return mav;
	}
	
	
// 앨범추천
//	@RequestMapping("likeAlbum")
//	public ModelAndView likeAlbum(@RequestParam("num") int num) {
//		ModelAndView mav=new ModelAndView();
//		
//		int res = this.SongRepository.likeAlbum(num);
//		String msg="";
//		
//		if(res>0){
//			msg="성공";
//		}else{
//			msg="실패";
//		}
//		
//		mav.addObject("msg", msg);
//		mav.setViewName("/kwang/popup/recommend");
//		return mav;
//	}
	
	
	
//	앨범평점 주기
	@RequestMapping("pointCount")
	public ModelAndView pointCount(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		
		int num=Integer.parseInt(request.getParameter("num"));
		int rating=Integer.parseInt(request.getParameter("star"));
		
		AlbumBean bean =new AlbumBean();
		bean.setNum(num);
		bean.setAvgCount((double)rating);
		
		int res = this.SongRepository.pointCount(num);
		int res2 = this.SongRepository.ratingCount(bean);
		int res3 = this.SongRepository.avgCount(num);
		
		String msg="";
		
		if(res>0 || res2 >0 || res3>0){
			msg="평점이 등록되었습니다.";
		}else{
			msg="실패";
		}
		
		mav.addObject("msg", msg);
		mav.setViewName("/kwang/popup/starRating");
		return mav;
	}
//	마이앨범에 담기
//	public void addMyAlbum(@RequestParam("songNum") Integer num) {
//		
//	}
	
//	다운로드
//	public void download(@RequestParam("songNum") Integer num) {
//		
//	}
	
//	뮤직비디오 보기(2015-12-30일 추가)
	@RequestMapping("muvi")
	public ModelAndView muvi(@RequestParam("num") int num){
		ModelAndView mav=new ModelAndView();
		
		SongBean songBean=this.SongRepository.checkList(num);
		
		mav.addObject("songBean", songBean);
		mav.setViewName("/kwang/popup/muviPlayer");
		
		
		return mav;
	}
	
	
	public void songList() {
//		디폴트로 나오는 곡 리스트를 뽑아오는 메소드
		List<Object> listc = this.SongRepository.songList();
		mav.addObject("listc",listc);
		
	}

	
	
	public void realTimeList() {
//		실시간 곡 페이지에 담길 리스트를 뽑아오는 메소드
		List<Object> listr = this.SongRepository.realTimeList();
		mav.addObject("listr",listr);
		
	}
	
	public void albumList() {
		List<Object> listb = this.SongRepository.albumList();
		mav.addObject("listb",listb);
	}
	
	public void themeStyle() {
		List<Object> listTheme = this.SongRepository.themeStyle();
		mav.addObject("listTheme",listTheme);
	}
	
	
	@RequestMapping(value="kwang/comment/insertOne", method=RequestMethod.POST)
	public ModelAndView commentInsertOne(AlbumCommentBean bean,@RequestParam String name2) {
		ModelAndView mav = new ModelAndView();
		int res = this.SongRepository.commentInsertOne(bean);
		
		if(res>0) {
			System.out.println("#.album 입력성공");
			mav = goAlbumInfo(name2);
		} else {
			System.out.println("#.album 입력실패");
			mav = goAlbumInfo(name2);
		}
		return mav;
	}
	@RequestMapping(value="kwang/comment/deleteOne", method=RequestMethod.GET)
	public ModelAndView commentDeleteOne(Integer num,@RequestParam String name2) {
	
		ModelAndView mav = new ModelAndView();
		int res = this.SongRepository.commentDeleteOne(num);
		
		if(res>0) {
			System.out.println("#.album 삭제성공");
			mav = goAlbumInfo(name2);
		} else {
			System.out.println("#.album 삭제실패");
			mav = goAlbumInfo(name2);
		}
		return mav;
	}
	
	//01월 03일 추가
	@RequestMapping("songOnePlayer")
	public ModelAndView songOnePlayer(@RequestParam("num") int num) {
		ModelAndView mav=new ModelAndView();
		
		SongBean bean=this.SongRepository.choiceList(num);
		
		mav.addObject("bean", bean);
		mav.setViewName("kwang/song/songOnePlayer");
		return mav;
	}	
	
	
}
