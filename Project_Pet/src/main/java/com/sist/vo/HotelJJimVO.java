package com.sist.vo;
/*
--<찜하기 테이블(호텔)>
CREATE TABLE HOTEL_JJIM(
 hjno NUMBER,
 id VARCHAR2(20) ,
 no NUMBER ,
 CONSTRAINT hj_hjno_pk PRIMARY KEY (hjno),
 CONSTRAINT hj_id_fk FOREIGN KEY(id) REFERENCES MEMBER(id),
 CONSTRAINT hj_no_fk FOREIGN KEY(no) REFERENCES SEOUL_HOTEL(no)
);

--<찜하기 시퀀스(호텔)>
CREATE SEQUENCE hj_hjno_seq 
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
 */
public class HotelJJimVO {
	private int hjno,no;
	private String id;
	private String title, poster, address;
	public int getHjno() {
		return hjno;
	}
	public void setHjno(int hjno) {
		this.hjno = hjno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
