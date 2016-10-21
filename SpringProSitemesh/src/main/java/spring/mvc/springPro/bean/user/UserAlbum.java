package spring.mvc.springPro.bean.user;

import java.util.ArrayList;

import org.apache.ibatis.type.Alias;

@Alias("userAlbum")
public class UserAlbum {

	private int num;
	private String albumName1;
	private String albumName2;
	private String albumName3;
	private String albumContent1;
	private String albumContent2;
	private String albumContent3;
	private String[] songArray;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String[] getSongArray() {
		return songArray;
	}
	public void setSongArray(String[] songArray) {
		this.songArray = songArray;
	}
	public String getAlbumName1() {
		return albumName1;
	}
	public void setAlbumName1(String albumName1) {
		this.albumName1 = albumName1;
	}
	public String getAlbumName2() {
		return albumName2;
	}
	public void setAlbumName2(String albumName2) {
		this.albumName2 = albumName2;
	}
	public String getAlbumName3() {
		return albumName3;
	}
	public void setAlbumName3(String albumName3) {
		this.albumName3 = albumName3;
	}
	public String getAlbumContent1() {
		return albumContent1;
	}
	public void setAlbumContent1(String albumContent1) {
		this.albumContent1 = albumContent1;
	}
	public String getAlbumContent2() {
		return albumContent2;
	}
	public void setAlbumContent2(String albumContent2) {
		this.albumContent2 = albumContent2;
	}
	public String getAlbumContent3() {
		return albumContent3;
	}
	public void setAlbumContent3(String albumContent3) {
		this.albumContent3 = albumContent3;
	}
	
	
	
	
}
