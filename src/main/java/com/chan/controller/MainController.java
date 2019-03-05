package com.chan.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chan.model.Article;
import com.chan.model.ArticlePage;
import com.chan.model.Cmt;
import com.chan.service.ArticleService;

@Controller
public class MainController {

	@Autowired
	ArticleService service;
	
	
	@RequestMapping(value ="/",method = RequestMethod.GET)
	public void mainView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pageNoVal = request.getParameter("pageNo");
		int pageNo = 1;
		int size = 5;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		int total_count = service.article_count();
		
		HashMap<String, Integer> map = new HashMap<>();
		int start = (pageNo - 1) * size;
		map.put("start", start);
		map.put("size", size);
		
		ArrayList<Article> list = (ArrayList<Article>) service.list(map);
		
		request.setAttribute("article_list", list);
		
		ArticlePage page = new ArticlePage(total_count, pageNo, size);
		
		 request.setAttribute("page", page );
		 
		 StringBuffer lastURL = request.getRequestURL();
		
		 request.getSession().setAttribute("lastURL", lastURL);
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/mainForm.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write_page() {
		
		return "board/writeForm";
	}
	
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write_request(Article article) {
		
		
		service.write(article);
		
		return "board/writeSuccessForm";
	}
	
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String content(@RequestParam("article_no") int article_no, Model model, HttpServletRequest request) {
		
		String pageNoVal = request.getParameter("pageNo");
		int pageNo = 1;
		
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		Article article = new Article();
		
		article.setArticle_no(article_no);
		
		// 조회수 증가
		service.count_up(article);
		
		article = service.content(article);
		
		ArrayList<Cmt> cmt = (ArrayList<Cmt>) service.commentList(article);
		
		
		
		model.addAttribute("content", article);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("commentList",cmt);
		model.addAttribute("cmtlist_size", cmt.size());
		request.getSession().setAttribute("pageNo", pageNo);
		return "board/contentForm";
	}
	
	
	// 게시글 수정
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String article_modify (Article article, Model model, HttpServletRequest request) {
		
	
		System.out.println(article.getPageNo());
		model.addAttribute("article",service.content(article));
		model.addAttribute("pageNo",article.getPageNo());
		return "board/modifyForm";
	}
	

	// 게시글 수정 요청
	@RequestMapping(value="/modifyRequest", method=RequestMethod.POST)
	public String article_modifyRequest (Article article, Model model, HttpServletRequest request) {
		
		service.modify(article);
		model.addAttribute("pageNo",article.getPageNo());
		model.addAttribute("article_no", article.getArticle_no());
		
		return "/board/modifySuccessForm";
	}
	
	
	
	
	// 게시글 삭제
		@RequestMapping(value="/article_delete", method=RequestMethod.POST)
		public String article_delete (Article article, Model model)  {
			
			service.delete_article(article);
	
			return "/board/articleDeleteSuccessForm";
		}
		
	
		// 댓글 작성
		@RequestMapping(value="/comment_write", method=RequestMethod.POST)
		public String reviewWrite(Cmt cmt, HttpServletRequest request) {
			
			String pageNoVal = request.getParameter("pageNo");
			int pageNo = 1;
			
			if(pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
		
			
			service.comment_write(cmt);
			
			
			request.setAttribute("pageNo", pageNo);
			
			return "redirect:/content/?article_no=" + cmt.getArticle_no() +"&pageNo=" + pageNo;
		}
			
		// 댓글에 댓글
		
				@RequestMapping(value="/cmt_comment", method=RequestMethod.POST)
				public String cmt_reviewWrite(
						Cmt cmt, Model model) {
										System.out.println("대댓글 작성");
					model.addAttribute("cmt", cmt);
					
					return "/board/cmt_commentForm";
				}
		
		// 댓글에 댓글 작성요청		
				
				@RequestMapping(value="/cmt_comment_req", method=RequestMethod.POST)
				public Object cmt_reviewWrite_request(Cmt cmt, Model model, HttpSession session) {
					
					System.out.println("cmt_no : " + cmt.getCmt_no());
					
					// 댓글의 첫번째 댓글일 경우
					
					System.out.println("parent_cmt_no :" +cmt.getParent_cmt_no());
					System.out.println("seq : " + cmt.getSeq());
				
						
					// 대댓글의 경우 부모 댓글 번호를 폼값에서 가져온 cmt_no 으로설정
					if (cmt.getParent_cmt_no() == 0) {
					cmt.setParent_cmt_no(cmt.getCmt_no());
					}
					
						service.cmt_seq_update_01(cmt);
						
						cmt.setSeq(cmt.getSeq()+1);
						cmt.setDepth(cmt.getDepth()+1);
						
						service.cmt_comment_write(cmt);
						
					
					
					String pageNo = Integer.toString((int) session.getAttribute("pageNo"));
				
					String article_no = Integer.toString(cmt.getArticle_no());
					
					
					return "redirect:/content/?article_no=" + article_no +"&pageNo=" + pageNo;
				}
		
				
		// 검색
				@RequestMapping(value="/search", method=RequestMethod.GET)
				public String search(HttpServletRequest request) {
					
					
					String condition = (String) request.getParameter("search");
					String value = (String) request.getParameter("search_value");
					
					
					
					  if (condition.equals("article_title")) {
						  condition = "article_title";
					  } else if (condition.equals("article_content")) {
						  condition = "article_content";
					  } else {
						  condition = "member_id";
					  }

					
					  					  
					  
					  String pageNoVal = request.getParameter("pageNo");
						int pageNo = 1;
						int size = 5;
						if(pageNoVal != null) {
							pageNo = Integer.parseInt(pageNoVal);
						}
						int start = (pageNo - 1) * size;
						  
					  
					HashMap<String, Object> map = new HashMap<>();
					System.out.println(condition);
					System.out.println(value);
					map.put("condition", condition);
					map.put("value", value);
					
					request.setAttribute("map", map);
					
					
					int total_count = service.search_count(map);
					System.out.println(total_count);
					
			
					map.put("start", start);
					map.put("size", size);
					
					ArrayList<Article> article_list = (ArrayList<Article>) service.search((HashMap<String, Object>) map);
					
					System.out.println(article_list.size());
					request.setAttribute("article_list", article_list);
					
					ArticlePage page = new ArticlePage(total_count, pageNo, size);
					
					 request.setAttribute("page", page );
					 
					 StringBuffer lastURL = request.getRequestURL();
					 System.out.println("검색 후");
					 
						
					 lastURL.append("?search=");
					 lastURL.append(condition);
					 lastURL.append("&search_value=");
					 lastURL.append(value);
					 
					 if(pageNo > 1) {
						 lastURL.append("&pageNo=");
						 lastURL.append(pageNo);
					 }
					
					 request.getSession().setAttribute("lastURL", lastURL.toString());
					
					
					return "/board/searchResultForm";
				}
	
				
				// 댓글 수정
				@RequestMapping(value="/cmt_update", method=RequestMethod.POST)
				public String cmt_update(Cmt cmt, Model model) {
					
					cmt = service.select_cmt(cmt);
					
					model.addAttribute("cmt", cmt);
					
					return "/board/cmtUpdateForm";
				}
				
				// 댓글 수정 요청
				@RequestMapping(value="/cmt_update_req", method=RequestMethod.POST)
				public String update_cmt_req(Cmt cmt, Model model, HttpSession session) {
					
					service.update_cmt(cmt);

					String pageNo = Integer.toString((int) session.getAttribute("pageNo"));
					
					String article_no = Integer.toString(cmt.getArticle_no());
					
					
					return "redirect:/content/?article_no=" + article_no +"&pageNo=" + pageNo;
				}
				
				// 댓글 삭제 요청
				@RequestMapping(value="/cmt_delete", method=RequestMethod.POST)
				public String delete_cmt(Cmt cmt, HttpSession session){
					
					service.delete_cmt(cmt);

					String pageNo = Integer.toString((int) session.getAttribute("pageNo"));
					
					String article_no = Integer.toString(cmt.getArticle_no());
					
					
					return "redirect:/content/?article_no=" + article_no +"&pageNo=" + pageNo;
				}
	
	
}
