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
	
		
	$("#cmt_textarea").keydown(function(){
		var i = $("#cmt_textarea").val().length
		
		
		$("#write_count").text("(" + i + "/200자)") 
			
			
		})
	
	
	
	$("#cmt_textarea").focusout(function(){
	var i = $("#cmt_textarea").val().length
	
	
	$("#write_count").text("(" + i + "/200자)") 
		
	})
	

	
})


function logout(){
	
	if(confirm("로그아웃 하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/logout"
		
	}
	
}

function comment_write(){
	
	var i = document.getElementById('cmt_textarea').value.length
	
	document.getElementById('write_count').innerHTML = "(" + i + "/200자)";
	
	if ( i > 200){
		alert("댓글을 200자 이하로 작성해 주세요!")
	}
	
}


</script>




</head>
<body>

<%@ include file="/WEB-INF/resources/header_left.jsp" %>


<section id = "main">
<div class = "title_header">
<h2>Content Page</h2>
</div>

<div class="table_div">

<div class="write_form">
<input type="hidden" name="member_id" value="${loginMember.member_id}">

  <div class="form-group">
<label>No.${content.article_no}</label>
<span  style="display: inline-block;
    width: 50%;
    text-align: left;
    font-size: large;"><b>Title : </b>${content.article_title}</span>

<span  style="    display: inline-block;
    width:10%;
    text-align: center;"><b>Count : </b>${content.article_count}</span>


<span  style="    display: inline-block;
    width: 25%;
    text-align: center; "><b>Date : </b>${content.article_u_date}</span>




</div>
<div class="form-group">
<span  class="form-control" name="article_content" 
style="display:inline-block; width:700px; height:auto; overflow:visible; white-space:pre-line; text-align: left;" >${content.article_content}</span>
</div>

<div class="form-group" style="text-align: right;">
<c:if test="${loginMember.member_id == content.member_id}">
<form  action = "${pageContext.request.contextPath}/modify" method="POST" >
<input type="hidden" name ="member_id" value="${sessionScope.loginMember.member_id}">
<input type="hidden" name ="article_no" value="${content.article_no}">
<input type="hidden" name ="pageNo" value ="${pageNo}">
<input type="submit" class="btn btn-default" value="수정하기" style="display:inline-block; float:right;">
</form>
<form  action = "${pageContext.request.contextPath}/article_delete" method="POST" onsubmit="return confirm('게시글을 삭제 하시겠습니까?');">
<input type="hidden" name ="article_no" value="${content.article_no}">
<input type="submit" class="btn btn-default" value="삭제하기" style="display:inline-block; float:right;" >
</form>
 </c:if>

<button type="button" class="btn btn-default" onclick="location.href='${sessionScope.lastURL}'" style="display:inline-block; float:right;">목록</button>

</div>




</div>

<div class="comment_div">
<c:if test ="${not empty sessionScope.loginMember}">
<span class="comment_count" style="display:inline-block; width:650px; text-align: left;"><b>댓글작성</b></span>

<div class="comment_write_div">
<form action = "${pageContext.request.contextPath}/comment_write" method="POST">
<input type="hidden" name="member_id" value="${sessionScope.loginMember.member_id}">
<input type="hidden" name="article_no" value="${content.article_no}">
<input type="hidden" name="pageNo" value="${pageNo}">
<textarea style="width:490px;height:120px; margin-top: 30px; display:inline-block; resize:none;" class = "form-control"  id ="cmt_textarea" name="cmt_content"></textarea>
<div class="cmt_btn_div">
<input type="submit" value="댓글작성" class="btn btn-default">
<label id ="write_count">(0/200자)</label>
</div>
</form>
</div>
</c:if>
</div>

<div class="cmt_list_div">
<div class="cmt_count_div">
<span class="cmt_count_span">댓글(${cmtlist_size})개</span>
</div>
<c:forEach items="${commentList}" var="list" varStatus="i" >
<!-- 삭제되지 않은 댓글일 경우 -->
<c:if test="${list.cmt_del != 'y'}" var ="noDel">
<table class ="cmt_list_table" id="${i.index}}" style="margin-left: <c:out value="${20*list.depth}"/>px;">

<tr>

	<td class="id_td">${list.member_id}</td><td class="content_td"><span class="cmt_content_span">${list.cmt_content}</span></td><td class="date_td">${list.cmt_u_date}</td><td class="btn_td">
	
	<c:if test="${not empty sessionScope.loginMember}">
	<form action = "${pageContext.request.contextPath}/cmt_comment" method="POST" >
	
	<input type="hidden" name="article_no" value="${list.article_no}">
	<input type="hidden" name="cmt_no" value="${list.cmt_no}">
	<input type="hidden" name="depth" value="${list.depth}">
	<input type="hidden" name="parent_cmt_no" value="${list.parent_cmt_no}">
	<input type="hidden" name="seq" value="${list.seq}">
	
		
	<input type="submit" value="댓글달기">
	</form>
	</c:if>
	
	<c:if test="${sessionScope.loginMember.member_id == list.member_id}">
	<form action = "${pageContext.request.contextPath}/cmt_update" method="POST">
	<input type="hidden" name="article_no" value="${list.article_no}">
	<input type="hidden" name="cmt_no" value="${list.cmt_no}">
	<input type="submit" value="댓글수정">
	</form>

	<form action = "${pageContext.request.contextPath}/cmt_delete" method="POST" onsubmit="return confirm('댓글을 정말 삭제 하시겠습니까?');">
	<input type="hidden" name="article_no" value="${list.article_no}">
	<input type="hidden" name="cmt_no" value="${list.cmt_no}">
	<input type="submit" value="댓글삭제">
	</form>
	

	
	</c:if>
	
	</td>
	
</tr>


</table></c:if>
<!-- 삭제되었을 경우 -->
<c:if test="${not noDel}">

<table class ="cmt_list_table" id="${i.index}}" style="margin-left: <c:out value="${20*list.depth}"/>px;">

<tr>

	<td class="id_td" style="width:120px"></td><td class="content_td"><span class="cmt_content_span" style="color:red;">삭제된 댓글입니다.</span></td><td class="date_td"></td><td class="btn_td">
	

		
	</td>
	
</tr>


</table>


</c:if>
</c:forEach>

</div>

</div>


</section>

<%@ include file="/WEB-INF/resources/right_footer.jsp" %>

</body>
</html>