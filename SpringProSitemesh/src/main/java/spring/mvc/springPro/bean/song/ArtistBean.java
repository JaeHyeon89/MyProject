package spring.mvc.springPro.bean.song;


import org.apache.ibatis.type.Alias;


@Alias("artistBean")
public class ArtistBean {

	private Integer num;
	private String artistName;
	private String member;
	private String nationality;
	private String photoSysName; //추가
	private String photoOrgName; //추가
	private String sysName; //n->N변경
	private String orgName; //n->N변경
	private String debut;
	
	
	
	public ArtistBean() {
		// TODO Auto-generated constructor stub
	}



	public Integer getNum() {
		return num;
	}



	public void setNum(Integer num) {
		this.num = num;
	}



	public String getArtistName() {
		return artistName;
	}



	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}



	public String getMember() {
		return member;
	}



	public void setMember(String member) {
		this.member = member;
	}



	public String getNationality() {
		return nationality;
	}



	public void setNationality(String nationality) {
		this.nationality = nationality;
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



	public String getDebut() {
		return debut;
	}



	public void setDebut(String debut) {
		this.debut = debut;
	}

	
	
}
