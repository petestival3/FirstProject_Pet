package com.sist.vo;
/*
--<좋아요 테이블(실종강아지)>
CREATE TABLE DOG_LIKE(
 dogno NUMBER,
 id VARCHAR2(20) ,
 ldno NUMBER ,
 CONSTRAINT dog_dogno_pk PRIMARY KEY (dogno),
 CONSTRAINT dog_id_fk FOREIGN KEY(id) REFERENCES MEMBER(id),
 CONSTRAINT dog_ldno_fk FOREIGN KEY(ldno) REFERENCES LOSEANI(ldno)
);

--<좋아요 시퀀스(강아지)>
CREATE SEQUENCE dog_dogno_seq 
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
 */
public class LikeVO {
	private int dogno,ldno;
	private String id;
	
	public int getDogno() {
		return dogno;
	}
	public void setDogno(int dogno) {
		this.dogno = dogno;
	}
	public int getLdno() {
		return ldno;
	}
	public void setLdno(int ldno) {
		this.ldno = ldno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
