package com.chan.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.chan.model.Member;
import com.chan.service.MemberService;

@Controller
public class MemberController {

	
	@Autowired
	MemberService service;
	
	// 회원가입
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String memberJoin() {
		
		
		
		return "/member/joinForm";
	}
	
	// 회원가입 요청
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String member_join(Member member, Model model) {
		
		service.join(member);
		
		model.addAttribute("member_id", member.getMember_id());
		
		
		return "/member/joinSuccessForm";
	}

	
	// 로그인
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String memberLogin() {
		
		return "/member/loginForm";
	}
	
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	@ResponseBody
	public Object memberLogin_post(@RequestParam Map<String, Object> map,HttpServletRequest request) {
		
		String id = (String)map.get("id");
		String pw = (String)map.get("pw");
		System.out.println("로그인 정보");
		System.out.printf("(ID: %s , PW: %s)%n",id,pw);
		Member member = new Member();
		
		member.setMember_id(id);
		member.setMember_pw(pw);
		
		Member loginMember = new Member();
		
		loginMember = service.login(member);
		
		Map<String, Object> data = new HashMap<>();
		
		if (loginMember == null) {
			
			data.put("msg", "회원 정보가 일치하지 않습니다.");
			data.put("code", 1);
			return  data;
		
		} else {
			
			request.getSession().setAttribute("loginMember", loginMember);
			data.put("msg", loginMember.getMember_id()+"님, 접속을 환영합니다.");
			data.put("code", 0);
			System.out.println("성공");
			return data;
		}
		
		
	}
	
	
	// logout
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String memberLogout(HttpSession session) {
		
		
		session.invalidate();
		
		return "redirect:/";
	}
	

	
	// 아이디 중복 체크
	@RequestMapping(value="checkid", method=RequestMethod.POST)
	@ResponseBody
	public Object checkId(@RequestParam Map<String, Object> map,HttpServletRequest req) {
		
		Member member = new Member();
		
		String member_id = (((String) map.get("id")).trim());
		Map<String, Object> data = new HashMap<>();
		
		
		if (member_id.equals("")) {
			data.put("msg", "ID를 입력하세요!");
			data.put("error", 1);
			
		} else if (member_id.length() > 20) {
			data.put("msg", "ID는 20자 미만으로 입력하세요!");
			data.put("error", 1);
			
		} else {
			
			member.setMember_id(member_id);
			
			member = service.check_id(member);
			
			
			if(member == null) {
				data.put("msg", "사용 가능한 ID입니다.");
				data.put("error", 0);
			} else {
				data.put("msg", "중복된 ID입니다!");
				data.put("error", 1);
				
			}
			
		}
		return data;
	}
	
	
}
