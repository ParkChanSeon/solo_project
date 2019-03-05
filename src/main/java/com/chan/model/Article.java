package com.chan.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Article {

	private int article_no;
	private String member_id;
	private String article_title;
	private String article_content;
	private String article_c_date;
	private String article_u_date;
	private int article_count;
	private int pageNo;
	private String article_del;
	
	
	
	public String getArticle_del() {
		return article_del;
	}
	public void setArticle_del(String article_del) {
		this.article_del = article_del;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_content() {
		return article_content;
	}
	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}
	public String getArticle_c_date() {
		return article_c_date;
	}
	public void setArticle_c_date(String article_c_date) {
		this.article_c_date = article_c_date;
	}
	public String getArticle_u_date() {
		
		
		return article_u_date;
	}
	public void setArticle_u_date(String article_u_date) {
		this.article_u_date = article_u_date;
	}
	public int getArticle_count() {
		return article_count;
	}
	public void setArticle_count(int article_count) {
		this.article_count = article_count;
	}
	
}
