package com.sist.vo;
import java.util.*;
/*
 rf_no                                        NOT NULL NUMBER
 ID                                                 VARCHAR2(20)
 cr_com_no                                                NUMBER
 rf_day                                       NOT NULL VARCHAR2(100)
 rf_time                                      NOT NULL VARCHAR2(100)
 rf_inwon                                     NOT NULL VARCHAR2(50)
 rf_regdate                                            DATE
 rf_ok                                                 NUMBER
 */

public class FuneralReserveInfoVO {
	private int rf_no,cr_com_no,rf_ok;
	private String id,rf_day,rf_time,rf_inwon;
	private Date rf_regdate;
	private FuneralListVO fvo=new FuneralListVO();
	public int getRf_no() {
		return rf_no;
	}
	public void setRf_no(int rf_no) {
		this.rf_no = rf_no;
	}
	public int getCr_com_no() {
		return cr_com_no;
	}
	public void setCr_com_no(int cr_com_no) {
		this.cr_com_no = cr_com_no;
	}
	public int getRf_ok() {
		return rf_ok;
	}
	public void setRf_ok(int rf_ok) {
		this.rf_ok = rf_ok;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRf_day() {
		return rf_day;
	}
	public void setRf_day(String rf_day) {
		this.rf_day = rf_day;
	}
	public String getRf_time() {
		return rf_time;
	}
	public void setRf_time(String rf_time) {
		this.rf_time = rf_time;
	}
	public String getRf_inwon() {
		return rf_inwon;
	}
	public void setRf_inwon(String rf_inwon) {
		this.rf_inwon = rf_inwon;
	}
	public Date getRf_regdate() {
		return rf_regdate;
	}
	public void setRf_regdate(Date rf_regdate) {
		this.rf_regdate = rf_regdate;
	}
	public FuneralListVO getFvo() {
		return fvo;
	}
	public void setFvo(FuneralListVO fvo) {
		this.fvo = fvo;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
		//return fno+" "+day+" "+time+" "+inwon+" "+id;
	}
	
	
}
