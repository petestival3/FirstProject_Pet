package com.sist.vo;
/*
 *  TNO                                       NOT NULL NUMBER
 TIME                                      NOT NULL VARCHAR2(10)
 */

/*
 * SQL> desc res_f_time
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 RT_NO                                     NOT NULL NUMBER
 RT_TIME                                   NOT NULL VARCHAR2(10)
 */
public class FuneralReserveTimeVO {
	private int rt_no;
	private String rt_time;
	
	public int getRt_no() {
		return rt_no;
	}
	public void setRt_no(int rt_no) {
		this.rt_no = rt_no;
	}
	public String getRt_time() {
		return rt_time;
	}
	public void setRt_time(String rt_time) {
		this.rt_time = rt_time;
	}
	
	
}
