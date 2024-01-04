package com.sist.vo;
import com.sist.dao.*;
/*
 * ㅠㅠ테이블 만들엇는데 아닌거같음..당연함...데이터가없음..
 * 
 CREATE TABLE goods_jjim(
	   gno NUMBER,
	   id VARCHAR2(20),
	   pno NUMBER,
	   CONSTRAINT gj_no_pk PRIMARY KEY(gno),
	   CONSTRAINT MEMBER_ID_fk FOREIGN KEY(id)
	   REFERENCES MEMBER(id),
	   CONSTRAINT gj_gno_fk FOREIGN KEY(pno)
	   REFERENCES PRODUCT_DETAIL(pno)
);

SQL> desc Product_detail;
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 PNO                                       NOT NULL NUMBER
 P_NAME                                    NOT NULL VARCHAR2(1000)
 P_GRADE                                            NUMBER(2,1)
 P_PRICE                                   NOT NULL VARCHAR2(100)
 P_IMAGE                                            VARCHAR2(1000)
 P_PERCENT                                          VARCHAR2(500)
 P_LOWER_PRICE                                      VARCHAR2(500)
 P_SHIPMENT                                         VARCHAR2(500)
 P_STACK                                            NUMBER
 P_CATEGORY                                NOT NULL VARCHAR2(500)
 P_EXPIRE_DATE                                      VARCHAR2(500)
 P_DETAIL_IMAGE                                     VARCHAR2(4000)
 P_LIKE                                             NUMBER
 P_PREVHIT                                          NUMBER
 P_HIT                                              NUMBER
 P_REVIEW_NUM                                       NUMBER
 P_INTPRICE                                NOT NULL NUMBER
 P_INTPERCENT                                       NUMBER
 P_INTLOWERPRICE                           NOT NULL NUMBER
 P_BUYAMOUNT                                        NUMBER
 P_PREVBUYAMOUNT                                    NUMBER
 P_REGDATE                                          DATE
*/

public class JJimVO {
    
    private int no;
    private String ID;
    private int pno;
    private String p_name,p_image,p_price,p_lower_price;
    private ProductVO pvo=new ProductVO();
    private MemberVO mvo=new MemberVO();
    
    
}
