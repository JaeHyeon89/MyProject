package spring.mvc.springPro.service.search;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.ArtistBean;
import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.dao.search.SearchDao;

@Service("searchService")
public class SearchService extends DefaultTransactionDefinition{
	
	@Resource(name="searchDao")
	SearchDao searchDao;
	
	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;
	
	public List<SongBean> getAddSongList(String term) {
		return this.searchDao.getAddSongList(term);
	}

	public List<AlbumBean> getAddAlbumList(String term) {
		return this.searchDao.getAddAlbumList(term);
	}

	public List<ArtistBean> getaddArtistList(String term) {
		return this.searchDao.getaddArtistList(term);
	}

	public List<SongBean> songSearch(PageBean pbean) {
		return this.searchDao.songSearch(pbean);
	}

	public List<AlbumBean> albumSearch(PageBean pbean) {
		return this.searchDao.albumSearch(pbean);
	}

	public List<ArtistBean> artistSearch(PageBean pbean) {
		return this.searchDao.artistSearch(pbean);
	}


}
