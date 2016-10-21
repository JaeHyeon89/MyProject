package spring.mvc.springPro.bean.song;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("commentBean")
public class Commentri {

	private Integer num;
	private String writer;
	private String content;
	private Date regdate;
	
	
	public Commentri() {
		// TODO Auto-generated constructor stub
	}


	public Integer getNum() {
		return num;
	}


	public void setNum(Integer num) {
		this.num = num;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	
	
	
}
