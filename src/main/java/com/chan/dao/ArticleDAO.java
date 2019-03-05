package com.chan.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chan.model.Article;
import com.chan.model.ArticlePage;
import com.chan.model.Cmt;

@Repository
public class ArticleDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "com.chan.ArticleMapper";
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	// 게시글 작성
	public void write(Article article) {
		sqlSession.insert(strNameSpace + ".write", article);
	}
	
	// 메인에 목록 가져오기
	public Object list(HashMap<String, Integer> map) {
		return sqlSession.selectList(strNameSpace + ".list", map);
	}
	
	// 게시글 내용 보기(조회수 증가)
	public Article content(Article article) {
			  
		return sqlSession.selectOne(strNameSpace + ".content", article);

	}
	
	// 댓글 가져오기
	public Object commentList(Article article) {
		return sqlSession.selectList(strNameSpace + ".commentList", article);
	}
	
	public void count_up(Article article) {
		sqlSession.update(strNameSpace + ".count_up",article);
	}
	
	// 게시글 카운트 
	public int article_count() {
		return sqlSession.selectOne(strNameSpace + ".article_count");
	}
	
	// 게시글 수정
	public void modify(Article article) {
		sqlSession.update(strNameSpace + ".modify",article);
	}
	
	// 댓글 작성
	public void comment_write(Cmt cmt) {
		sqlSession.insert(strNameSpace + ".comment_write", cmt);
	}
	
	// 댓글 내용 불러오기
	public Cmt comment_content(Cmt cmt) {
		return sqlSession.selectOne(strNameSpace + ".comment_content", cmt);
	}
	
	// 대댓글 작성
	public void cmt_comment_write(Cmt cmt) {
		sqlSession.insert(strNameSpace + ".cmt_comment_write", cmt);
	}
	
	// 댓글에 댓글이 올라올때 업데이트
	public void cmt_seq_update_01(Cmt cmt) {
		sqlSession.update(strNameSpace + ".cmt_seq_update_01", cmt);
	}
	
	// 검색
	public Object search(HashMap<String,Object> map){
		return sqlSession.selectList(strNameSpace + ".search", map);
	}
	
	// 검색결과 게시물 갯수
	public int search_count(HashMap<String,Object> map) {
		return sqlSession.selectOne(strNameSpace + ".search_count", map);
	}
	
	// 댓글 수정 (댓글 불러오기)
	public Cmt select_cmt(Cmt cmt) {
		return sqlSession.selectOne(strNameSpace + ".select_cmt", cmt);
	}
	// 댓글 수정 요청
	public void update_cmt(Cmt cmt) {
		sqlSession.update(strNameSpace + ".update_cmt", cmt);
	}
	
	// 댓글 삭제 요청
	public void delete_cmt(Cmt cmt) {
		sqlSession.update(strNameSpace + ".delete_cmt", cmt);
	}
	
	// 게시글 삭제하기
	public void delete_article(Article article) {
		sqlSession.update(strNameSpace + ".delete_article", article);
	}
}
