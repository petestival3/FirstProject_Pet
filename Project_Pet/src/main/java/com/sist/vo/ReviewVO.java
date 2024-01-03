package com.sist.vo;

import java.sql.Date;

public class ReviewVO {
private int revno,objno,typeno,imgsize;
private double score;
private String writer,content,imgname,dbday;
private Date revdate;
public int getImgsize() {
	return imgsize;
}
public void setImgsize(int imgsize) {
	this.imgsize = imgsize;
}
public int getRevno() {
	return revno;
}
public void setRevno(int revno) {
	this.revno = revno;
}
public int getObjno() {
	return objno;
}
public void setObjno(int objno) {
	this.objno = objno;
}
public int getTypeno() {
	return typeno;
}
public void setTypeno(int typeno) {
	this.typeno = typeno;
}
public double getScore() {
	return score;
}
public void setScore(double score) {
	this.score = score;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getImgname() {
	return imgname;
}
public void setImgname(String imgname) {
	this.imgname = imgname;
}

public String getDbday() {
	return dbday;
}
public void setDbday(String dbday) {
	this.dbday = dbday;
}
public Date getRevdate() {
	return revdate;
}
public void setRevdate(Date revdate) {
	this.revdate = revdate;
}


}
