package com.sist.vo;
/*
--<입양희망 테이블(임시보호)>
CREATE TABLE CD_WISH(
 cdno NUMBER,
 id VARCHAR2(20) ,
 kano NUMBER ,
 CONSTRAINT cd_cdno_pk PRIMARY KEY (cdno),
 CONSTRAINT cd_id_fk FOREIGN KEY(id) REFERENCES MEMBER(id),
 CONSTRAINT cd_kano_fk FOREIGN KEY(kano) REFERENCES KEEPANIMAL2(kano)
);

--<입양희망 시퀀스(임시보호)>
CREATE SEQUENCE cd_cdno_seq 
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
*/
public class WishVO {
	private int cdno,kano;
	private String id;
	private String KEEPIMAGE,KEEPTITLE,KEEPWRITER,KEEPLOC;
	/* 
	 * KEEPIMAGE : 이미지
	 * KEEPTITLE : 글제목
	 * KEEPWRITER : 작성일
	 * KEEPLOC : 실종장소
	 */
	public int getCdno() {
		return cdno;
	}
	public void setCdno(int cdno) {
		this.cdno = cdno;
	}
	public int getKano() {
		return kano;
	}
	public void setKano(int kano) {
		this.kano = kano;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKEEPIMAGE() {
		return KEEPIMAGE;
	}
	public void setKEEPIMAGE(String kEEPIMAGE) {
		KEEPIMAGE = kEEPIMAGE;
	}
	public String getKEEPTITLE() {
		return KEEPTITLE;
	}
	public void setKEEPTITLE(String kEEPTITLE) {
		KEEPTITLE = kEEPTITLE;
	}
	public String getKEEPWRITER() {
		return KEEPWRITER;
	}
	public void setKEEPWRITER(String kEEPWRITER) {
		KEEPWRITER = kEEPWRITER;
	}
	public String getKEEPLOC() {
		return KEEPLOC;
	}
	public void setKEEPLOC(String kEEPLOC) {
		KEEPLOC = kEEPLOC;
	}
	
	
}
