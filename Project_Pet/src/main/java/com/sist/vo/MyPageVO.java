package com.sist.vo;

public class MyPageVO {
	private int petno, pet_filesize;
	private String pet_image, pet_name, pet_bday, pet_gender, pet_weight, pet_filename, user_id
	,pet_check;
	private String pwd;
	
	private MemberVO mv;
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPet_check() {
		return pet_check;
	}
	public void setPet_check(String pet_check) {
		this.pet_check = pet_check;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPetno() {
		return petno;
	}
	public void setPetno(int petno) {
		this.petno = petno;
	}
	public int getPet_filesize() {
		return pet_filesize;
	}
	public void setPet_filesize(int pet_filesize) {
		this.pet_filesize = pet_filesize;
	}
	public String getPet_image() {
		return pet_image;
	}
	public void setPet_image(String pet_image) {
		this.pet_image = pet_image;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_bday() {
		return pet_bday;
	}
	public void setPet_bday(String pet_bday) {
		this.pet_bday = pet_bday;
	}
	public String getPet_gender() {
		return pet_gender;
	}
	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}
	public String getPet_weight() {
		return pet_weight;
	}
	public void setPet_weight(String pet_weight) {
		this.pet_weight = pet_weight;
	}
	public String getPet_filename() {
		return pet_filename;
	}
	public void setPet_filename(String pet_filename) {
		this.pet_filename = pet_filename;
	}
	
	
}
