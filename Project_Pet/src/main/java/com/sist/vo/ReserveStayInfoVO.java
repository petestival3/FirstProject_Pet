package com.sist.vo;
import java.util.Date;

public class ReserveStayInfoVO {
	private int no,stay_no,ok;
	private String id,checkin,checkout,inwon;
	private Date regdate;
	
	private String roomname,roomimage;
	
	
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public String getRoomimage() {
		return roomimage;
	}
	public void setRoomimage(String roomimage) {
		this.roomimage = roomimage;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getStay_no() {
		return stay_no;
	}
	public void setStay_no(int stay_no) {
		this.stay_no = stay_no;
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
	
	
}
