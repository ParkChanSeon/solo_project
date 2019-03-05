package com.chan.model;

import java.util.Date;

import org.springframework.stereotype.Repository;

public class Member {

	private String member_id;
	private String member_pw;
	private String member_name;
	private Date member_regDate;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Date getMember_regDate() {
		return member_regDate;
	}
	public void setMember_regDate(Date member_regDate) {
		this.member_regDate = member_regDate;
	}
	
	
	
}
