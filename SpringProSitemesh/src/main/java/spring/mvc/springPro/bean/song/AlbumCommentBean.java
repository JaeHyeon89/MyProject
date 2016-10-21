package spring.mvc.springPro.bean.song;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("albumCommentBean")
public class AlbumCommentBean {

	private Integer num;
	private Integer albumNum;
	private String writer;
	private String content;
	private Date regdate;
	
	
	public AlbumCommentBean() {
		// TODO Auto-generated constructor stub
	}


	public Integer getNum() {
		return num;
	}


	public void setNum(Integer num) {
		this.num = num;
	}


	public Integer getAlbumNum() {
		return albumNum;
	}


	public void setAlbumNum(Integer albumNum) {
		this.albumNum = albumNum;
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
