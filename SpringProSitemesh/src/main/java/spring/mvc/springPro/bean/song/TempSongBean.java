package spring.mvc.springPro.bean.song;

import org.apache.ibatis.type.Alias;

@Alias("tempSong")
public class TempSongBean {

	private int num;
	private String albumName;
	private String songName;
	private String artistName;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
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
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	
	
	
}
