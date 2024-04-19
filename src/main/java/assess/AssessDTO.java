package assess;

public class AssessDTO {
	private int idx;
	private String member_userid;
	private int board_idx;
	private int likecount;
	private int hatecount;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMember_userid() {
		return member_userid;
	}
	public void setMember_userid(String member_userid) {
		this.member_userid = member_userid;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public int getHatecount() {
		return hatecount;
	}
	public void setHatecount(int hatecount) {
		this.hatecount = hatecount;
	}
	
	
}
