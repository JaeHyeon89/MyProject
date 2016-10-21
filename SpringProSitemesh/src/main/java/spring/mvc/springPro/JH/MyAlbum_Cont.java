package spring.mvc.springPro.JH;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.user.UpdateAlbumBean;
import spring.mvc.springPro.bean.user.UserAlbum;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.service.song.SongService;
import spring.mvc.springPro.service.user.UserService;

@Controller
public class MyAlbum_Cont {

	ModelAndView mav;
	int count;
	
	@Autowired
	UserService uServ;
	
	@Autowired
	SongService songServ;
	
	// 앨범 페이지로 이동
	@RequestMapping(value="JH/04_myPage/myAlbum/go", method=RequestMethod.GET)
	public ModelAndView goPage(HttpSession session){
		mav= new ModelAndView();
		
		
		if(session.getAttribute("nowLogon") != null){
			UserInfo info = (UserInfo)session.getAttribute("nowLogon");
			UserAlbum album = uServ.getMyAlbum(info);
			
			if(album != null){
				
				List<SongBean> myAlbum1 = getSong(album.getAlbumContent1());
				List<SongBean> myAlbum2 = getSong(album.getAlbumContent2());
				List<SongBean> myAlbum3 = getSong(album.getAlbumContent3());
				
				mav.addObject("myAlbum1", myAlbum1);
				mav.addObject("myAlbum2", myAlbum2);
				mav.addObject("myAlbum3", myAlbum3);
				mav.addObject("myAlbumInfo", album);
				System.out.println("앨범 1 : " + album.getAlbumContent1());
				System.out.println("앨범 2 : " + album.getAlbumContent2());
				System.out.println("앨범 3 : " + album.getAlbumContent3());
			}else {
				System.out.println("넌 뭔데 앨범이 없냐?" + info.getNum());
				
			}
			mav.setViewName("JH/05_myAlbum/myAlbum_main");
			
		}else {
			mav.setViewName("JH/00_error/needLogin");
		}
		
		return mav;
	}
	
	//앨범 추가하기 전 목록 불러오기
	@RequestMapping(value="JH/04_myPage/myAlbum/albumCall", method=RequestMethod.POST)
	public @ResponseBody String albumCall(HttpSession session){
		Gson gson = new Gson();
		HashMap<String, Object> mapc = new HashMap<>();
		UserInfo info = (UserInfo)session.getAttribute("nowLogon");
		UserAlbum album = uServ.getMyAlbum(info);
		mapc.put("albumBean", album);
		
		
		if(album.getAlbumContent1() != null){
			String[] content1 = makeArray(album.getAlbumContent1());
			mapc.put("albumLength1", content1.length);
		}else {
			mapc.put("albumLength1", 0);
		}
		
		if(album.getAlbumContent2() != null){
			String[] content2 = makeArray(album.getAlbumContent2());
			mapc.put("albumLength2", content2.length);
		}else {
			mapc.put("albumLength2", 0);
		}
		
		if(album.getAlbumContent3() != null){
			String[] content3 = makeArray(album.getAlbumContent3());
			mapc.put("albumLength3", content3.length);
		}else {
			mapc.put("albumLength3", 0);
		}
		
		return gson.toJson(mapc);
	}
	
	// 앨범 추가
	@RequestMapping(value="JH/04_myPage/myAlbum/addAlbum", method=RequestMethod.POST)
	public @ResponseBody String addAlbum(HttpServletRequest req, HttpSession session){
		String albumNum = req.getParameter("albumNum");
		String addNum = req.getParameter("addNum");
		
		UserInfo info = (UserInfo)session.getAttribute("nowLogon");
		UserAlbum album = uServ.getMyAlbum(info);
		
		String target = null;
		String content = null;
		
		if(albumNum.equals("1")){
			content = album.getAlbumContent1();
			target = "albumContent1";
		}else if(albumNum.equals("2")){
			content = album.getAlbumContent2();
			target = "albumContent2";
		}else if(albumNum.equals("3")){
			content = album.getAlbumContent3();
			target = "albumContent3";
		}else {
			System.out.println("뭐가 온거니? 앨범추가 : " + albumNum);
			return "????";
		}
		
		String updateAlbumContent = addAlbumSong(content, addNum);
		if(updateAlbumContent != null){
			UpdateAlbumBean updateAlbum = new UpdateAlbumBean();
			updateAlbum.setUserNum(info.getNum());
			updateAlbum.setUpdateTarget(target);
			updateAlbum.setUpdateAlbumContent(updateAlbumContent);
			
			boolean addOk = uServ.addAlbum(updateAlbum);
			if(addOk){
				return "addOk";
			}else {
				return "!!!!!!!";
			}
			
		}else {
			return "already";
		}
		
	}
	
	
	// 앨범에 곡 여러개 추가
	@RequestMapping(value = "JH/04_myPage/myAlbum/arrayAddAlbum", method = RequestMethod.POST)
	public @ResponseBody Object arrayAddAlbum(HttpServletRequest req, HttpSession session) {
		
		Gson gson = new Gson();
		String[] addSongs = req.getParameterValues("addArray");
		String albumNum = req.getParameter("albumNum");

		UserInfo info = (UserInfo) session.getAttribute("nowLogon");
		UserAlbum album = uServ.getMyAlbum(info);

		String target = null;
		String content = null;

		if (albumNum.equals("1")) {
			content = album.getAlbumContent1();
			target = "albumContent1";
		} else if (albumNum.equals("2")) {
			content = album.getAlbumContent2();
			target = "albumContent2";
		} else if (albumNum.equals("3")) {
			content = album.getAlbumContent3();
			target = "albumContent3";
		} else {
			System.out.println("뭐가 온거니? 앨범에 여러곡 추가 : " + albumNum);
			return "????";
		}

		String updateAlbumContent = addArrayAlbum(content, addSongs);
		if (updateAlbumContent != "") {
			UpdateAlbumBean updateAlbum = new UpdateAlbumBean();
			updateAlbum.setUserNum(info.getNum());
			updateAlbum.setUpdateTarget(target);
			updateAlbum.setUpdateAlbumContent(updateAlbumContent);

			boolean addOk = uServ.addAlbum(updateAlbum);
			if (addOk) {
				return gson.toJson(count);
			} else {
				return gson.toJson("!!!!!!!");
			}

		} else {
			return gson.toJson(count);
		}

	}
	
	//앨범에서 곡 삭제
	@RequestMapping(value="JH/04_myPage/myAlbum/delAlbum", method=RequestMethod.POST)
	public @ResponseBody Object delAlbum(HttpServletRequest req){
		Object res = null;
		String delNum = req.getParameter("delNum");
		String albumContent	= req.getParameter("albumContent");
		String updateTarget = req.getParameter("target");
		int userNum = Integer.parseInt(req.getParameter("userNum"));
		
		String updateAlbumContent = makeUpdateContent(albumContent, delNum);

		UpdateAlbumBean updateAlbum = new UpdateAlbumBean();
		updateAlbum.setUserNum(userNum);
		updateAlbum.setUpdateTarget(updateTarget);
		updateAlbum.setUpdateAlbumContent(updateAlbumContent);
		
		boolean updateOk = uServ.updateAlbum(updateAlbum);
		
		if(updateOk){
			System.out.println("삭제 성공");
			res = "ok";
		}else {
			
		}
		
		return res;
	}
	
	
	private List<SongBean> getSong(String albumContent){
		String[] tempArray = makeArray(albumContent);
		if(tempArray != null){
			UserAlbum album = new UserAlbum();
			album.setSongArray(tempArray);
			List<SongBean> listc = songServ.getSongList(album);
			return listc;
		}else {
			return null;
		}
	}
	
	private String addAlbumSong(String albumContent, String addNum){
		
		if(albumContent != null){
			String[] orgAlbumArray = makeArray(albumContent);
			boolean already = false;
			
			for (int i = 0; i < orgAlbumArray.length; i++) {
				if (orgAlbumArray[i].equals(addNum)) {// 추가하고자 하는 곡의 넘버
					System.out.println("[" + addNum + "]번 곡이 이미 있다.");
					already = true; // 같은 곡이 있다면
				} 
			} // for문 끝
			
			if(!already){ // 같은 곡이 없다면
				albumContent += "," + addNum;
				System.out.println("같은 곡이 없구나 : " + albumContent);
				return albumContent;
			}else {
				return null;
			}

		}else { // 원래부터 앨범에 아무것도 없을 경우
			System.out.println("앨범의 첫 곡이구나");
			albumContent = addNum;
			return albumContent;
		}
	}
	
	private String makeUpdateContent(String albumContent, String delNum){
		String[] orgAlbumArray = makeArray(albumContent);
		String newAlbumContent = "";
		boolean first = true;
		if(orgAlbumArray != null){
			
			
			for(int i=0; i<orgAlbumArray.length; i++){
				if(orgAlbumArray[i].equals(delNum)){//지우고자 하는 곡의 넘버
					System.out.println("[" + delNum + "]번 곡을 삭제하자");
				}else {
					if(first){ // 처음일때 
						first = false;
						newAlbumContent += orgAlbumArray[i];
					}else {
						newAlbumContent += "," + orgAlbumArray[i];
					}
				}// 삭제 if문 끝
				
			}// for문 끝
			
		}else { 
			System.out.println("아니 앨범에 아무것도 없는데 뭘 삭제한다고 그래?");
		}
		
		return newAlbumContent;
	}
	
	private String[] makeArray(String albumContent){
		String[] tempArray = null;
		if(albumContent != null){
			tempArray = albumContent.split(",");
			
		}else {
			System.out.println("이 앨범엔 아무것도 없어요");
		}
		return tempArray;
	}
	
	private String addArrayAlbum(String albumContent, String[] addSongs) {
		String updateAlbumContent = "";
		boolean first = true;
		count = 0;
		for (int i = 0; i < addSongs.length; i++) {
			if (albumContent != null) { // 앨범에 곡이 있을 경우
				System.out.println(albumContent + ", " + addSongs[i]);
				if(!albumContent.contains(addSongs[i])){ // 담고자 하는 곡이 앨범내에 없을 경우 
					if(first){
						updateAlbumContent = albumContent;
						first = false;
					}else {
						updateAlbumContent += "," + addSongs[i];
						count++;
					}
				}
			}else { // 앨범이 비어있는 경우(즉, 앨범에 곡을 처음으로 추가하는 경우)
				if(first){
					updateAlbumContent = addSongs[i];
					count++;
					first = false;
				}else {
					updateAlbumContent += "," + addSongs[i];
					count++;
				}
			}
		}
		System.out.println("선택 담기 한 결과 1-1 : 총 담은 곡 수 - " + count);
		System.out.println("선택 담기 한 결과 1-2 : " + updateAlbumContent);
		return updateAlbumContent;
	}
	
}










