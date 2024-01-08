package com.sist.vo;
import java.util.Date;

public class ReserveStayInfoVO {
	private int no,stayno,ok;
	private String id,checkin,checkout,inwon;
	private Date regdate;
	private StayVO svo=new StayVO();
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getStayno() {
		return stayno;
	}
	public void setStayno(int stayno) {
		this.stayno = stayno;
	}
	public int getOk() {
		return ok;
	}
	public void setOk(int ok) {
		this.ok = ok;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getInwon() {
		return inwon;
	}
	public void setInwon(String inwon) {
		this.inwon = inwon;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public StayVO getSvo() {
		return svo;
	}
	public void setSvo(StayVO svo) {
		this.svo = svo;
	}
	
	
}
