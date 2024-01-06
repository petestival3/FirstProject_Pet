package com.sist.vo;
/*
--<공감해요 테이블(실종고양이)>
CREATE TABLE CAT_LIKE(
 catno NUMBER,
 id VARCHAR2(20) ,
 lcno NUMBER ,
 CONSTRAINT cat_catno_pk PRIMARY KEY (catno),
 CONSTRAINT cat_id_fk FOREIGN KEY(id) REFERENCES MEMBER(id),
 CONSTRAINT cat_ldno_fk FOREIGN KEY(lcno) REFERENCES LOSECAT(lcno)
);

--<공감해요 시퀀스(실종고양이)>
CREATE SEQUENCE cat_catno_seq 
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
 */
public class LikeCatVO {
	private int catno,lcno;
	private String id;
	
	
	public int getCatno() {
		return catno;
	}
	public void setCatno(int catno) {
		this.catno = catno;
	}
	public int getLcno() {
		return lcno;
	}
	public void setLcno(int lcno) {
		this.lcno = lcno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
