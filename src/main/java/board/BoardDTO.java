package board;

import java.sql.Date;

//	IDX       NOT NULL NUMBER         
//	TITLE     NOT NULL VARCHAR2(500)  
//	WRITER    NOT NULL VARCHAR2(100)  
//	CONTENT   NOT NULL VARCHAR2(4000) 
//	IMAGE              VARCHAR2(500)  
//	IPADDR    NOT NULL VARCHAR2(100)  
//	VIEWCOUNT          NUMBER         
//	WRITEDATE          DATE   

public class BoardDTO {
	private int idx;
	private String title;
	private String writer;
	private String content;
	private String image;
	private String ipaddr;
	private int viewCount;
	private Date writeDate;
	private int newPost;
	private int deleted;
	private int importlist;
	
	
	
	public int getImportlist() {
		return importlist;
	}
	public void setImportlist(int importlist) {
		this.importlist = importlist;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	
	public int getNewPost() {
		return newPost;
	}
	public void setNewPost(int newPost) {
		this.newPost = newPost;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
