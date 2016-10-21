package spring.mvc.springPro.JH;

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

import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.service.user.UserService;

@Controller
public class MyFriend_Cont {

	ModelAndView mav;
	
	@Autowired
	UserService uServ;
	
	// 친구 관리 페이지로 들어갈 때
	@RequestMapping(value="JH/04_myPage/myFriend", method=RequestMethod.GET)
	public ModelAndView goFriends(HttpSession session){
		mav = new ModelAndView();
		String[] friendList;
		UserInfo info = (UserInfo) session.getAttribute("nowLogon");
		
		System.out.println("나의 친구 : " + info.getFriends());
		
		if(info.getFriends() == null){ // 친구가 한명도 없으면
			
		}else { // 친구가 존재하면
			friendList = info.getFriends().split(",");
			info.setFriendArray(friendList);
			List<UserInfo> fList = uServ.getFriendList(info);
			mav.addObject("fList", fList);
		}
		
		
		mav.setViewName("JH/04_myPage/myFriend");
		
		return mav;
	}
	
	// 친구 관리 페이지에서 추가하려고 검색 할 때
	@RequestMapping(value="JH/04_myPage/friendSearch", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public @ResponseBody Object friendSearch(HttpServletRequest req){
		
		Gson gson = new Gson();
		HashMap<String, Object> result = new HashMap<>();
		mav= new ModelAndView();
		String searchType = req.getParameter("searchType");
		String searchName = req.getParameter("searchName");
		
		Object res = null;
		if(searchType.equals("id")){ //아이디 검색일 때
			res = uServ.searchUserById(searchName);
		}else if(searchType.equals("nick")){ // 닉네임 검색일 때
			res = uServ.searchUserByNick(searchName);
		}else {
			System.out.println("검색할 때 : 뭘 검색한거니???" + searchType);
		}
		
		if(res != null){
			return gson.toJson(res);
		}else {
			return gson.toJson(res);
		}
	}
	
//	친구 추가하기를 눌렀을때
	@RequestMapping(value="JH/04_myPage/friendAdd", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public @ResponseBody Object friendAdd(HttpSession session, HttpServletRequest req){
		
		Gson gson = new Gson();
		
		String friendnum = req.getParameter("friendnum");
		System.out.println(friendnum + "번 녀석을 추가하고 싶구나");
		Object res = null;
		
		String friends = alreadyFriend(session, friendnum);
		
		if(friends == null){//이미 친구가 존재함
			System.out.println("이미 있단다");
		}else { // 그 친구 없음 ㅠㅠ
			UserInfo bean = (UserInfo) session.getAttribute("nowLogon");
			if(friends.equals("first")){
				friends = friendnum;
			}else {
				friends += ","+friendnum;
			}
			bean.setFriends(friends);
			res = uServ.addFriend(bean);
		}
		return gson.toJson(res);
	}
	
	
//	친구 삭제하기를 눌렀을때
	@RequestMapping(value="JH/04_myPage/friendDel", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public @ResponseBody Object friendDel(HttpSession session, HttpServletRequest req){
		
		String res = null;
		
		String fDelNum = req.getParameter("fDelNum");
		UserInfo temp = (UserInfo)session.getAttribute("nowLogon");
		String orgFriends = temp.getFriends();
		
		String updateFriends = delFriend(orgFriends, fDelNum);
		temp.setFriends(updateFriends);
		
		boolean delOk = uServ.delFriend(temp);
		
		if(delOk){
			res = "delOk";
		}else {
			
		}
		
	
		return res;
	}
	
	
	private String delFriend(String orgFriends, String fDelNum){
		
		String updateFriends = "";
		boolean first = true;
		if(orgFriends != null){
			
			String[] orgFriendArray = orgFriends.split(",");
			
			for(int i=0; i<orgFriendArray.length; i++){
				if(orgFriendArray[i].equals(fDelNum)){
					
				}else {
					if(first){
						first = false;
						updateFriends += orgFriendArray[i];
					}else {
						updateFriends += "," + orgFriendArray[i];
					}
				}
			}// for문 끝
			
		}else {
			System.out.println("이리 들어올리가 없을텐데..");
		}
		System.out.println("수정이 끝난 친구 목록  : " + updateFriends);
		
		return updateFriends;
	}
	
	
	private String alreadyFriend(HttpSession session, String friendnum){
		UserInfo temp = (UserInfo)session.getAttribute("nowLogon");
		UserInfo res = (UserInfo) uServ.idCheck(temp);
		
		String friends = res.getFriends();
		if(friends != null){
			String[] friendArray = friends.split(",");
			for(int i=0; i<friendArray.length; i++){
				if(friendArray[i].equals(friendnum)){
					return null; // 같은 번호의 친구가 이미 컬럼에 존재하면
				}// if 끝
			}// for 끝
		}else {
			friends = "first";
		}
		System.out.println("111 : " + friends);
		return friends;
	}
	
	
	
}
