package com.chan.model;

public class Cmt {
	
	private int cmt_no;
	private int article_no;
	private String member_id;
	private String cmt_content;
	private String cmt_c_date;
	private String cmt_u_date;
	private int depth;
	private int seq;
	private int parent_cmt_no;
	private String cmt_del;
	
	
	public String getCmt_del() {
		return cmt_del;
	}
	public void setCmt_del(String cmt_del) {
		this.cmt_del = cmt_del;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getParent_cmt_no() {
		return parent_cmt_no;
	}
	public void setParent_cmt_no(int parent_cmt_no) {
		this.parent_cmt_no = parent_cmt_no;
	}
	public int getCmt_no() {
		return cmt_no;
	}
	public void setCmt_no(int cmt_no) {
		this.cmt_no = cmt_no;
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
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCmt_c_date() {
		return cmt_c_date;
	}
	public void setCmt_c_date(String cmt_c_date) {
		this.cmt_c_date = cmt_c_date;
	}
	public String getCmt_u_date() {
		return cmt_u_date;
	}
	public void setCmt_u_date(String cmt_u_date) {
		this.cmt_u_date = cmt_u_date;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	

}
