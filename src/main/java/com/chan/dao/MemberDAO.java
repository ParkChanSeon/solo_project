package com.chan.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chan.model.Member;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "com.chan.MemberMapper";
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	// check_id
	public Member check_id (Member member) {
		return sqlSession.selectOne(strNameSpace + ".check_id", member);
	}
	
	// 회원가입
	public void join(Member member) {
		sqlSession.insert(strNameSpace + ".join", member);
	}
	
	// login
		public Member login (Member member) {
			return sqlSession.selectOne(strNameSpace + ".login", member);
		}
	
}
