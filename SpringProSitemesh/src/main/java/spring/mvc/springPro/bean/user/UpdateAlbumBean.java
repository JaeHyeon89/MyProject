package spring.mvc.springPro.bean.user;

import org.apache.ibatis.type.Alias;

@Alias("updateAlbum")
public class UpdateAlbumBean {

	private int userNum;
	private String updateTarget;
	private String updateContent;
	
	
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUpdateContent() {
		return updateContent;
	}
	public void setUpdateContent(String updateContent) {
		this.updateContent = updateContent;
	}
	public String getUpdateTarget() {
		return updateTarget;
	}
	public void setUpdateTarget(String updateTarget) {
		this.updateTarget = updateTarget;
	}
	public String getUpdateAlbumContent() {
		return updateContent;
	}
	public void setUpdateAlbumContent(String updateAlbumContent) {
		this.updateContent = updateAlbumContent;
	}
	
	
	
}
