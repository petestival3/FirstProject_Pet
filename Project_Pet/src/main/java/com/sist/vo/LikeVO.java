package com.sist.vo;
/*
--<좋아요 테이블>
CREATE TABLE GOODS_LIKE(
 glno NUMBER,
 id VARCHAR2(20) ,
 pno NUMBER ,
 CONSTRAINT gl_glno_pk PRIMARY KEY (glno),
 CONSTRAINT gl_id_fk FOREIGN KEY(id) REFERENCES MEMBER(id),
 CONSTRAINT gl_pno_fk FOREIGN KEY(pno) REFERENCES PRODUCT_DETAIL(pno)
);

--<좋아요 시퀀스>
CREATE SEQUENCE gl_glno_seq 
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
 */
public class LikeVO {
	private int glno,pno;
	private String id;
	
	public int getGlno() {
		return glno;
	}
	public void setGlno(int glno) {
		this.glno = glno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
