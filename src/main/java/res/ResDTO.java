package res;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

//		idx         number          default res_seq.nextval primary key,
//		name        varchar2(100)        not null,
//		res_date        DATE            not null,
//		res_time        number          not null,
//		dateCount   number          not null,
//		timeCount   number          not null,
//		adult       number          not null,
//		chil        number          not null


public class ResDTO {
    private int idx;
    private String member_userid;
    private String name;
    private String res_year;
    private String res_month;
    private String res_day;
    private String res_hour;
    private String res_minute;
    private String adult;
    private String chil;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getRes_year() {
		return res_year;
	}
	public void setRes_year(String res_year) {
		this.res_year = res_year;
	}
	public String getRes_month() {
		return res_month;
	}
	public void setRes_month(String res_month) {
		this.res_month = res_month;
	}
	public String getRes_day() {
		return res_day;
	}
	public void setRes_day(String res_day) {
		this.res_day = res_day;
	}
	public String getRes_hour() {
		return res_hour;
	}
	public void setRes_hour(String res_hour) {
		this.res_hour = res_hour;
	}
	public String getRes_minute() {
		return res_minute;
	}
	public void setRes_minute(String res_minute) {
		this.res_minute = res_minute;
	}
	public String getAdult() {
		return adult;
	}
	public void setAdult(String adult) {
		this.adult = adult;
	}
	public String getChil() {
		return chil;
	}
	public void setChil(String chil) {
		this.chil = chil;
	}

	
}
