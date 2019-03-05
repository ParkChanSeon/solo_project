package com.chan.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chan.dao.ArticleDAO;
import com.chan.model.Article;
import com.chan.model.ArticlePage;
import com.chan.model.Cmt;

@Service
@Transactional
public class ArticleService {
	
	@Autowired
	ArticleDAO dao;
	
	// 게시글 쓰기
	public void write(Article article) {
		dao.write(article);
	}
	
	
	// 게시글 불러오기
	public Object list(HashMap<String, Integer> map) {
		return dao.list(map);
	}
	
		
	// 게시글 내용 보기
	public Article content(Article article) {
		return dao.content(article);
	}
	
	// 댓글 가져오기
	public Object commentList(Article article) {
		return dao.commentList(article);
	}
	
	// 조회수 증가
	
	public void count_up(Article article) {
		dao.count_up(article);
	}
	
	
	// 게시글 카운트
	
	public int article_count() {
		return dao.article_count();
	}
	
	// 게시글 수정
	public void modify(Article article) {
		dao.modify(article);
	}
	
	// 댓글 작성
	
	public void comment_write(Cmt cmt) {
		dao.comment_write(cmt);
	}
	
	// 댓글 내용 불러오기
	public Cmt comment_content(Cmt cmt) {
		return dao.comment_content(cmt);
	}
	
	// 대댓글 작성
	
	public void cmt_comment_write(Cmt cmt) {
		dao.cmt_comment_write(cmt);
	}
	
	// 첫번째 글에 댓글이 올라올때

	public void cmt_seq_update_01(Cmt cmt) {
		dao.cmt_seq_update_01(cmt);
		
	}
	
	// 검색
		public Object search(HashMap<String,Object> map){
			return dao.search(map);
		}
	
	// 검색 결과 카운트
		public int search_count(HashMap<String,Object> map) {
			return dao.search_count(map);
		}
		
	// 댓글 수정(댓글 불러오기)
		public Cmt select_cmt(Cmt cmt) {
			return dao.select_cmt(cmt);
		}
		
	// 댓글 수정 요청
		public void update_cmt (Cmt cmt) {
			dao.update_cmt(cmt);
		}
		
	// 댓글 삭제 요청
		public void delete_cmt(Cmt cmt) {
			dao.delete_cmt(cmt);
		}
	
		// 게시글 삭제
		public void delete_article(Article article) {
			dao.delete_article(article);
		}

}
