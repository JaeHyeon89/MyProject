package spring.mvc.springPro.bean.song;

import org.apache.ibatis.type.Alias;

@Alias("genreList")
public class GenreList {

	private int num;
	private String genre;
	
	
	public GenreList() {
		// TODO Auto-generated constructor stub
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}

	
}
