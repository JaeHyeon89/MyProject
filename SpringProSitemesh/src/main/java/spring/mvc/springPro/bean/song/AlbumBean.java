package spring.mvc.springPro.bean.song;

import java.util.Date;

import org.apache.ibatis.type.Alias;


@Alias("albumBean")
public class AlbumBean {
//
//	recomCount 				number(10),		--추천 수
//	totalCount				number(10),		--평점 토탈
//	avgCount				number(5,1)		--평점 평균

	
	private Integer num;
	private String albumName;
	private String artistName;
	private String photoSysName; //추가
	private String photoOrgName; //추가
	private String sysName;		//n->N 변경
	private String orgName;		//n->N 변경
	private String musicStyle;
	private String albumIntro;
	private Integer recomCount;
	private Integer totalCount;
	private Double avgCount;
	private String dateOfIssue;
	private Date regDate;		//d->D 변경
	
	
	
	public AlbumBean() {
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



	public String getArtistName() {
		return artistName;
	}



	public void setArtistName(String artistName) {
		this.artistName = artistName;
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



	public String getAlbumIntro() {
		return albumIntro;
	}



	public void setAlbumIntro(String albumIntro) {
		this.albumIntro = albumIntro;
	}



	public Integer getRecomCount() {
		return recomCount;
	}



	public void setRecomCount(Integer recomCount) {
		this.recomCount = recomCount;
	}



	public Integer getTotalCount() {
		return totalCount;
	}



	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}



	public Double getAvgCount() {
		return avgCount;
	}



	public void setAvgCount(Double avgCount) {
		this.avgCount = avgCount;
	}



	public String getDateOfIssue() {
		return dateOfIssue;
	}



	public void setDateOfIssue(String dateOfIssue) {
		this.dateOfIssue = dateOfIssue;
	}



	public Date getRegDate() {
		return regDate;
	}



	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	
	
	
}
