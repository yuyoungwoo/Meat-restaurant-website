package board2;

import java.sql.Date;

public class Board2DTO {

	private int idx;
	private String mtitle;
	private String mwriter;
	private String meatcontext;
	private String photo_review;
	private int viewCount;
	private Date writeDate;
	private int price;
	private String meat_name;
	private int deleted;
	private String menu_name;
	
	
	
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public String getMeatcontext() {
		return meatcontext;
	}
	public void setMeatcontext(String meatcontext) {
		this.meatcontext = meatcontext;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getMwriter() {
		return mwriter;
	}
	public void setMwriter(String mwriter) {
		this.mwriter = mwriter;
	}
	
	public String getPhoto_review() {
		return photo_review;
	}
	public void setPhoto_review(String photo_review) {
		this.photo_review = photo_review;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMeat_name() {
		return meat_name;
	}
	public void setMeat_name(String meat_name) {
		this.meat_name = meat_name;
	}
	
	
	
}
