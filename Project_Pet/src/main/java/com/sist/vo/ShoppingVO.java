package com.sist.vo;

import java.sql.Date;

public class ShoppingVO {
private int cbno,pno,buy_count,buy_intprice;
public int getBuy_intprice() {
	return buy_intprice;
}
public void setBuy_intprice(int buy_intprice) {
	this.buy_intprice = buy_intprice;
}
private String buy_ok,buy_price,userid,dbday,msg,p_state,reciepient,phone,buy_address,buy_post,request_content;
public String getP_state() {
	return p_state;
}
public String getReciepient() {
	return reciepient;
}
public void setReciepient(String reciepient) {
	this.reciepient = reciepient;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getBuy_address() {
	return buy_address;
}
public void setBuy_address(String buy_address) {
	this.buy_address = buy_address;
}
public String getBuy_post() {
	return buy_post;
}
public void setBuy_post(String buy_post) {
	this.buy_post = buy_post;
}
public String getRequest_content() {
	return request_content;
}
public void setRequest_content(String request_content) {
	this.request_content = request_content;
}
public void setP_state(String p_state) {
	this.p_state = p_state;
}
private Date buy_date;
public int getCbno() {
	return cbno;
}
public void setCbno(int cbno) {
	this.cbno = cbno;
}
public int getPno() {
	return pno;
}
public void setPno(int pno) {
	this.pno = pno;
}
public int getBuy_count() {
	return buy_count;
}
public void setBuy_count(int buy_count) {
	this.buy_count = buy_count;
}
public String getBuy_ok() {
	return buy_ok;
}
public void setBuy_ok(String buy_ok) {
	this.buy_ok = buy_ok;
}
public String getBuy_price() {
	return buy_price;
}
public void setBuy_price(String buy_price) {
	this.buy_price = buy_price;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getDbday() {
	return dbday;
}
public void setDbday(String dbday) {
	this.dbday = dbday;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
public Date getBuy_date() {
	return buy_date;
}
public void setBuy_date(Date buy_date) {
	this.buy_date = buy_date;
}

private ProductVO pvo =new ProductVO();
public ProductVO getPvo() {
	return pvo;
}
public void setPvo(ProductVO pvo) {
	this.pvo = pvo;
}


}
