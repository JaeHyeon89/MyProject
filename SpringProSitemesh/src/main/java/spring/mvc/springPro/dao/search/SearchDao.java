package spring.mvc.springPro.dao.search;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.ArtistBean;
import spring.mvc.springPro.bean.song.SongBean;

@Repository("searchDao")
public class SearchDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<SongBean> getAddSongList(String term) {
		return this.sqlSessionTemplate.selectList("mapperSearch.selSongList", term);
	}

	public List<AlbumBean> getAddAlbumList(String term) {
		return this.sqlSessionTemplate.selectList("mapperSearch.selAlbumList", term);
	}

	public List<ArtistBean> getaddArtistList(String term) {
		return this.sqlSessionTemplate.selectList("mapperSearch.selArtistList", term);
	}

	public List<SongBean> songSearch(PageBean pbean) {
		return this.sqlSessionTemplate.selectList("mapperSearch.songSearch", pbean);
	}

	public List<AlbumBean> albumSearch(PageBean pbean) {
		return this.sqlSessionTemplate.selectList("mapperSearch.albumSearch", pbean);
	}

	public List<ArtistBean> artistSearch(PageBean pbean) {
		return this.sqlSessionTemplate.selectList("mapperSearch.artistSearch", pbean);
	}

	
	
}
