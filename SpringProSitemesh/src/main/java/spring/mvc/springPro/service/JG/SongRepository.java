package spring.mvc.springPro.service.JG;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.AlbumCommentBean;
import spring.mvc.springPro.bean.song.GenreList;
import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.song.ThemeList;

@Service("songRepository")
public class SongRepository extends DefaultTransactionDefinition{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	SqlSessionFactory SqlSessionFactory;
	

	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;
	
	
	public List<Object> songList() {
		return this.sqlSessionTemplate.selectList("mapperSong.songList");
	}
	
	public List<Object> realTimeList() {
		return this.sqlSessionTemplate.selectList("mapperSong.realTimeList");
	}
	
	
	
	public List<Object> albumList() {
		
		return this.sqlSessionTemplate.selectList("mapperSong.albumList");
	}

//	테마메인
	public List<Object> themeStyle() {
		return this.sqlSessionTemplate.selectList("mapperSong.themeStyle");
	}

//	앨범정보
	public List<Object> albumInfo(String name) {
		return this.sqlSessionTemplate.selectList("mapperSong.albumInfo", name);
	}

//	아티스트정보
	public List<Object> artistInfo(String name) {
		return this.sqlSessionTemplate.selectList("mapperSong.artistInfo", name);
	}

//	가사보기
	public List<Object> lyricsInfo(int num) {
		return this.sqlSessionTemplate.selectList("mapperSong.lyricsInfo", num);
	}

	
//	테마 분류별 보기 -------------------------------------------
	public List<SongBean> list01Theme() {
		return this.sqlSessionTemplate.selectList("mapperSong.list01Theme");
	}
	public List<SongBean> list02Theme() {
		return this.sqlSessionTemplate.selectList("mapperSong.list02Theme");
	}
	public List<SongBean> list03Theme() {
		return this.sqlSessionTemplate.selectList("mapperSong.list03Theme");
	}
	public List<SongBean> list04Theme() {
		return this.sqlSessionTemplate.selectList("mapperSong.list04Theme");
	}
	public List<SongBean> list05Theme() {
		return this.sqlSessionTemplate.selectList("mapperSong.list05Theme");
	}
	public List<SongBean> list06Theme() {
		return this.sqlSessionTemplate.selectList("mapperSong.list06Theme");
	}
	public List<SongBean> list07Theme() {
		return this.sqlSessionTemplate.selectList("mapperSong.list07Theme");
	}
	
	
//	--------------------------------------------
	
	
	
	
	

//	재생
	public SongBean choiceList(int num) {
		return this.sqlSessionTemplate.selectOne("mapperSong.choiceList", num);
	}
	
//	선택재생
	public SongBean checkList(int num) {
		System.out.println("들어오나?5555");
		return this.sqlSessionTemplate.selectOne("mapperSong.checkList", num);
	}

//	추천하기
	public int recommend(int num) {
//		SqlSession session = null;
		
		status = tx.getTransaction(this);
//		session = SqlSessionFactory.openSession(false);
		
		
		int res = this.sqlSessionTemplate.update("mapperSong.recommend", num);
		
		if(res > 0 ) {
			tx.commit(status);
			
		}else {
			if(!status.isCompleted())
				tx.rollback(status);
		
		}
		
		return res;
	}
	
//	앨범좋아요
	public int likeAlbum(int num) {
		
		status = tx.getTransaction(this);
		
		int res = this.sqlSessionTemplate.update("mapperSong.likeAlbum", num);
		
		if(res > 0 ) {
			tx.commit(status);
			
		}else {
			if(!status.isCompleted())
				tx.rollback(status);
		
		}
		
		
		return res;
		
	}

	
	
//	앨범 평점 주기
	public int pointCount(int num) {
	status = tx.getTransaction(this);
		
		int res = this.sqlSessionTemplate.update("mapperSong.pointCount", num);
		
		if(res > 0 ) {
			tx.commit(status);
			
		}else {
			if(!status.isCompleted())
				tx.rollback(status);
		
		}
		
		
		return res;
	}

	public int ratingCount(AlbumBean bean) {
		status = tx.getTransaction(this);
		
		int res = this.sqlSessionTemplate.update("mapperSong.ratingCount", bean);
		
		
		
		if(res > 0 ) {
			tx.commit(status);
			
		}else {
			if(!status.isCompleted())
				tx.rollback(status);
		
		}
		
		
		return res;
	}

	public int avgCount(int num) {
		status = tx.getTransaction(this);
		
		int res = this.sqlSessionTemplate.update("mapperSong.avgCount", num);
		
		
		
		if(res > 0 ) {
			tx.commit(status);
			
		}else {
			if(!status.isCompleted())
				tx.rollback(status);
		
		}
		
		
		return res;
	}

	
	
//	테마테이블에서 테마정보 뽑아오기(2015-12-21 메소드 추가)
	public List<ThemeList> themeList() {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperSong.themeSelectList");
	}

//	장르테이블에서 장르정보 뽑아오기(2015-12-30 메소드 추가)
	public List<GenreList> genreList() {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperSong.genreSelectList");
	}

//	송테이블에서 송정보 뽑아오기(2015-12-21 메소드 추가)
	public List<SongBean> selectList(ThemeList theme) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperSong.selectList",theme);
	}
	
//	송테이블에서 송정보 뽑아오기(2015-12-30 메소드 추가)
	public List<SongBean> selectListG(GenreList genre) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperSong.selectListG",genre);
	}

	public List<Object> albumInSong(String name) {
		return this.sqlSessionTemplate.selectList("mapperSong.albumInSong", name);
	}

	public List<Object> artistSong(String name) {
		return this.sqlSessionTemplate.selectList("mapperSong.artistSong", name);
	}

//	코멘트 기능 추가(2015-12-31 메소드 추가)
	public List<Object> commentSelectList(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperSong.commentSelectList", num);
	}
	public int commentInsertOne(AlbumCommentBean bean) {
		// TODO Auto-generated method stub
		// 진행 시점 잡기
		status = tx.getTransaction(this);

		int res = 0;
		res = this.sqlSessionTemplate.insert("mapperSong.commentInsertOne",bean);

		try {

			if (res > 0) {
				tx.commit(status);
			} else {
				if (!status.isCompleted()) {
					tx.rollback(status);
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return res;
	}
	public int commentDeleteOne(Integer num) {
		// TODO Auto-generated method stub
		// 진행 시점 잡기
		status = tx.getTransaction(this);

		int res = 0;
		res = this.sqlSessionTemplate.update("mapperSong.commentDeleteOne", num);

		try {

			if (res > 0) {
				tx.commit(status);
			} else {
				if (!status.isCompleted()) {
					tx.rollback(status);
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return res;
	}

	



}
