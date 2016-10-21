package spring.mvc.springPro.bean.song;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("songBean")
public class SongBean {

	private Integer num;
	private String albumName;
	private String songName;
	private String artistName;
	private String lyrics;
	private String songIntro;
	private String youtube;
	private String photoSysName; //추가
	private String photoOrgName; //추가
	private String sysName; //n->N변경
	private String orgName; //n->N변경
	private String musicStyle;
	private String themeTag;
	private int recomCount; //추가
	private String dateOfIssue;
	private Date regdate;
	
	
	
	public SongBean() {
		// TODO Auto-generated constructor stub
	}



	public Integer getNum() {
		return num;
	}



	public void setNum(Integer num) {
		this.num = num;
	}



	public String getAlbumName() {
		return albumName;
	}



	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}



	public String getSongName() {
		return songName;
	}



	public void setSongName(String songName) {
		this.songName = songName;
	}



	public String getLyrics() {
		return lyrics;
	}



	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}



	public String getArtistName() {
		return artistName;
	}



	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}



	public String getDateOfIssue() {
		return dateOfIssue;
	}



	public void setDateOfIssue(String dateOfIssue) {
		this.dateOfIssue = dateOfIssue;
	}



	public String getPhotoSysName() {
		return photoSysName;
	}



	public void setPhotoSysName(String photoSysName) {
		this.photoSysName = photoSysName;
	}



	public String getPhotoOrgName() {
		return photoOrgName;
	}



	public void setPhotoOrgName(String photoOrgName) {
		this.photoOrgName = photoOrgName;
	}



	public String getSysName() {
		return sysName;
	}



	public void setSysName(String sysName) {
		this.sysName = sysName;
	}



	public String getOrgName() {
		return orgName;
	}



	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}



	public String getMusicStyle() {
		return musicStyle;
	}



	public void setMusicStyle(String musicStyle) {
		this.musicStyle = musicStyle;
	}



	public String getThemeTag() {
		return themeTag;
	}



	public void setThemeTag(String themeTag) {
		this.themeTag = themeTag;
	}



	public String getSongIntro() {
		return songIntro;
	}



	public void setSongIntro(String songIntro) {
		this.songIntro = songIntro;
	}


	

	public String getYoutube() {
		return youtube;
	}



	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	public int getRecomCount() {
		return recomCount;
	}



	public void setRecomCount(int recomCount) {
		this.recomCount = recomCount;
	}

	
	
	
}
