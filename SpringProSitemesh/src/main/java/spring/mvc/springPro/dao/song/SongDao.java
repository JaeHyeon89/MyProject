package spring.mvc.springPro.dao.song;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.song.TempSongBean;
import spring.mvc.springPro.bean.user.UserAlbum;

@Repository("songDao")
public class SongDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<SongBean> getSongList(UserAlbum album) {
		return sqlSessionTemplate.selectList("mapperUserAlbum.myAlbumSongList", album);
	}

	public SongBean getBuyedSong(SongBean temp) {
		return sqlSessionTemplate.selectOne("mapperMypage.myBuyedSong", temp);
	}

//	public List<SongBean> getSongList(List<Integer> tempList) {
//		return sqlSessionTemplate.selectList("mapperMypage.myBuySongList", tempList);
//	}
	
}
