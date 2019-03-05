<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>테스트 게시판</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- main css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">

<script language="javascript">

$(document).ready(function(){
	

	
	
})


function logout(){
	
	if(confirm("로그아웃 하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/logout"
		
	}
	
}


</script>




</head>
<body>

<%@ include file="/WEB-INF/resources/header_left.jsp" %>


<section id = "main">
<div class = "title_header">
<h2>Free Board</h2>
</div>

<div class="table_div">


<div class="search_div">
<form action="${pageContext.request.contextPath}/search">
<select name="search" style="height: 30px; text-align: center;">
  <c:if test="${map.condition == 'article_title'}" var="title">
  
  <option value="article_title" selected="selected">제목</option>
  </c:if> <c:if test="${not title}"><option value="article_title" >제목</option></c:if>
  <c:if test="${map.condition == 'article_content'}" var ="content">
  <option value="article_content" selected="selected" >내용</option>
  </c:if> <c:if test="${not content}"> <option value="article_content">내용</option></c:if>
  <c:if test="${map.condition == 'member_id'}" var ="memberId">
  <option value="member_id" selected="selected">작성자</option>
  </c:if>
  <c:if test="${not memberId}">
  <option value="member_id" >작성자</option>
  </c:if>
</select>



<input type="text" name="search_value" class="form-control" style="width:300px; display:inline-block;" value="${map.value}">
<input type="submit" class="btn btn-default" style="display:inline-block;" value="검색">
</form>
</div>

<table id = "board_table" class ="table-striped">
<tr style="background-color: gray;">
<th style="width:80px">NO</th><th style="width:360px">TITLE</th><th style="width:120px">WRITER</th><th style="width:120px">COUNT</th><th style="width:120px">DATE</th>
</tr>

<c:forEach items="${article_list}" var ="list">
<tr >
<td>${list.article_no}</td>
<td><a href="${pageContext.request.contextPath}/content/?article_no=${list.article_no}&pageNo=${page.currentPage}">${list.article_title}</a></td>
<td>${list.member_id}</td>
<td>${list.article_count}</td>
<td>${list.article_u_date}</td>
</tr>
</c:forEach>
</table>

<div class ="btn_div">

<button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/write'" <c:if test="${empty loginMember}">disabled="disabled"</c:if>>글쓰기</button>

</div>

<div class="page_number">
 <c:if test="${page.hasArticles()}">
  <ul class="pagination">
  
    
   <c:if test="${page.startPage > 5}">
   <li>
      <a href="${pageContext.request.contextPath}/search?search=${map.condition}&search_value=${map.value}&pageNo=${page.startPage - 5}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
    <c:forEach var = "pNo" begin = "${page.startPage}" end ="${page.endPage}">
    
    <li><a href="${pageContext.request.contextPath}/search?search=${map.condition}&search_value=${map.value}&pageNo=${pNo}">${pNo}</a>
    
    </c:forEach>
 
 	<c:if test="${page.endPage < page.totalPages}">
 	 <li>
      <a href="${pageContext.request.contextPath}/search?search=${map.condition}&search_value=${map.value}&pageNo=${page.startPage + 5}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
    
  </ul>
  </c:if>
  </div>
  
</div>


</section>

<%@ include file="/WEB-INF/resources/right_footer.jsp" %>

</body>
</html>