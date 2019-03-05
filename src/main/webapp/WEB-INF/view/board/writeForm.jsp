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

function cancle(){
	
	if(confirm("작성을 취소 하시겠습니까?")){
		history.back();
		
	}
	
}


</script>




</head>
<body>

<%@ include file="/WEB-INF/resources/header_left.jsp" %>


<section id = "main">
<div class = "title_header">
<h2>Write Page</h2>
</div>

<div class="table_div">

<form action = "${pageContext.request.contextPath}/write" method="POST" class="write_form">
<input type="hidden" name="member_id" value="${loginMember.member_id}">
  <div class="form-group">
<label>TITLE</label>
<input type="text" class="form-control" style="display:inline-block; width:80%;" name="article_title">
</div>
<div class="form-group">
<textarea rows="20" cols="60" class="form-control" name="article_content" 
style="resize:none; display:inline-block; width:700px;" required="required" ></textarea>
</div>

<div class="form-group">
<button type="button" class="btn btn-default" onclick="cancle();">취소</button>
<input type="submit" class="btn btn-default" value="작성완료" >
</div>




</form>
</div>


</section>

<%@ include file="/WEB-INF/resources/right_footer.jsp" %>

</body>
</html>