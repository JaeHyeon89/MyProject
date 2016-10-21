package spring.mvc.springPro.bean.song;

import org.apache.ibatis.type.Alias;

@Alias("themeList")
public class ThemeList {

	private int num;
	private String theme;
	
	
	public ThemeList() {
		// TODO Auto-generated constructor stub
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getTheme() {
		return theme;
	}


	public void setTheme(String theme) {
		this.theme = theme;
	}

	
}
