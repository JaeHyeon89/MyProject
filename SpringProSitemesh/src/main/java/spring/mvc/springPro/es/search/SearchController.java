package spring.mvc.springPro.es.search;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.ArtistBean;
import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.service.search.SearchService;

@Controller
@RequestMapping("search/*")
public class SearchController {
	
	@Resource(name="searchService")
	SearchService searchService;
	
	@RequestMapping(value="/auto", method=RequestMethod.GET)
    public void auto(String term, HttpServletResponse response) throws Exception {
		
		String rcv=term.replaceAll(" ", "");
		response.setCharacterEncoding("UTF-8");
		ArrayList<JSONObject> listc=new ArrayList<>();
		
        List<SongBean> songName = this.searchService.getAddSongList(rcv);
        List<AlbumBean> albumName=this.searchService.getAddAlbumList(rcv);
        List<ArtistBean> artistName=this.searchService.getaddArtistList(rcv);
        
        // 응답해야 하는 문자열 : [{label:~,value:~},{label:~,value:~}]
        JSONArray array = new JSONArray();
        if(songName.size()>0){	//검색바에 노래이름을 칠때
	        for(SongBean each : songName) {
	            JSONObject obj = new JSONObject();
	            obj.put("label", each.getSongName());
	            obj.put("value", each.getSongName());
	            listc.add(obj);
	            if(listc.size()<=10){
	            	array.put(obj);
	            }
	        }
        }
        if(albumName.size()>0){	//검색바에 앨범이름을 칠때
        	 for(AlbumBean each : albumName) {
 	            JSONObject obj = new JSONObject();
 	            obj.put("label", each.getAlbumName());
 	            obj.put("value", each.getAlbumName());
 	            listc.add(obj);
	            if(listc.size()<=10){
	            	array.put(obj);
	            }
 	        }
        }
        if(artistName.size()>0){ //검색바에 가수이름을 칠때
        	for(ArtistBean each : artistName){
        		JSONObject obj=new JSONObject();
        		obj.put("label", each.getArtistName());
        		obj.put("value", each.getArtistName());
        		listc.add(obj);
 	            if(listc.size()<=10){
 	            	array.put(obj);
 	            }
        	}
        }
        
        PrintWriter pw = response.getWriter();
    	pw.print(array);
    	pw.flush();
    	pw.close();
}
	
	@RequestMapping("song")
	public ModelAndView songSearch(HttpServletRequest request){
		
		
		ModelAndView mav=new ModelAndView();
		
		String search=request.getParameter("search");
		String[] array=search.split(" ");
		PageBean pbean=new PageBean();
		
		if(request.getParameter("nowPage") != null){
			pbean.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
		}else{
			pbean.setNowPage(1);
		}
		pbean.setSearch(array);
		
		List<SongBean> songListc=this.searchService.songSearch(pbean);
		pbean.setRcvCount(songListc.size());
		
		mav.addObject("size", songListc.size());
		mav.addObject("songListc", songListc);
		mav.addObject("search", search);
		mav.addObject("pbean", pbean);
		mav.setViewName("/ES/search/songSearchRes");
		
		return mav;
	}
	
	@RequestMapping("album")
	public ModelAndView albumSearch(HttpServletRequest request){
		
		String search=request.getParameter("search");
		String[] rcv=search.split(" ");
		ModelAndView mav=new ModelAndView();
		PageBean pbean=new PageBean();
		
		if(request.getParameter("nowPage") != null){
			pbean.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
		}else{
			pbean.setNowPage(1);
		}
		pbean.setSearch(rcv);
		
		List<AlbumBean> albumListc=this.searchService.albumSearch(pbean);
		pbean.setRcvCount(albumListc.size());
		
		mav.addObject("pbean", pbean);
		mav.addObject("size", albumListc.size());
		mav.addObject("albumListc", albumListc);
		mav.addObject("search", search);
		mav.setViewName("/ES/search/albumSearchRes");
		
		return mav;
	}
	
	@RequestMapping("artist")
	public ModelAndView artist(HttpServletRequest request){
		String search=request.getParameter("search");
		
		String[] rcv=search.split(" ");
		ModelAndView mav=new ModelAndView();
		PageBean pbean=new PageBean();
		
		if(request.getParameter("nowPage") != null){
			pbean.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
		}else{
			pbean.setNowPage(1);
		}
		pbean.setSearch(rcv);
		
		List<ArtistBean> artistListc=this.searchService.artistSearch(pbean);
		pbean.setRcvCount(artistListc.size());
		
		mav.addObject("pbean", pbean);
		mav.addObject("size", artistListc.size());
		mav.addObject("artistListc", artistListc);
		mav.addObject("search", search);
		mav.setViewName("/ES/search/artistSearchRes");
		
		return mav;
	}
	
	@RequestMapping("lyrics")
	public ModelAndView lyrics(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		String search=request.getParameter("search");
		
		String[] rcv=search.split(" ");
		PageBean pbean=new PageBean();
		
		if(request.getParameter("nowPage") != null){
			pbean.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
		}else{
			pbean.setNowPage(1);
		}
		pbean.setSearch(rcv);
		
		List<SongBean> lyricsListc=this.searchService.songSearch(pbean);
		pbean.setRcvCount(lyricsListc.size());
		
		mav.addObject("pbean", pbean);
		mav.addObject("size", lyricsListc.size());
		mav.addObject("lyricsListc", lyricsListc);
		mav.addObject("search", search);
		mav.setViewName("/ES/search/lyricsSearchRes");
		
		return mav;
	}
	
}
