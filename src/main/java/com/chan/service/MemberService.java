package com.chan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chan.dao.MemberDAO;
import com.chan.model.Member;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO dao;
	
	public Member check_id(Member member) {
		return dao.check_id(member);
	}
	
	public void join(Member member) {
		dao.join(member);
	}
	
	public Member login(Member member) {
		return dao.login(member);
	}
	

}
