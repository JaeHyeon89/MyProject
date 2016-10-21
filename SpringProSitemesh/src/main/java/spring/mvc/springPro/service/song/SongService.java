package spring.mvc.springPro.service.song;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.song.TempSongBean;
import spring.mvc.springPro.bean.user.UserAlbum;
import spring.mvc.springPro.dao.song.SongDao;

@Service("songServ")
public class SongService {

	@Resource(name="songDao")
	SongDao songDao;

	public List<SongBean> getSongList(UserAlbum album) {
		return songDao.getSongList(album);
	}
	
	
	
}
