package com.sist.vo;
/*
 *    RNO                                       NOT NULL NUMBER
 RTIME                                     NOT NULL VARCHAR2(150)
 */

/*
 * SQL> desc res_f_day
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 RD_NO                                     NOT NULL NUMBER
 RD_TIME                                   NOT NULL VARCHAR2(150)
 */
public class FuneralReserveDayVO {
	private int rd_no;
	private String rd_time;
	
	public int getRd_no() {
		return rd_no;
	}
	public void setRd_no(int rd_no) {
		this.rd_no = rd_no;
	}
	public String getRd_time() {
		return rd_time;
	}
	public void setRd_time(String rd_time) {
		this.rd_time = rd_time;
	}
	
	
}
