<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>댓글 작성</title>
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
	
	

	$("#cmt_textarea").keyup(function(){
		var i = $("#cmt_textarea").val().length
		
		
		$("#count_label").text("(" + i + "/150자)") 
			
			
		})
	
	
	
	$("#cmt_textarea").focusout(function(){
	var i = $("#cmt_textarea").val().length
	
	
	$("#count_label").text("(" + i + "/150자)") 
		
	})
	
	
})

function comment_write(){
	
	var i = document.getElementById('cmt_textarea').value.length
	
	document.getElementById('count_label').innerHTML = "(" + i + "/150자)";
	
	if ( i > 150){
		alert("댓글을 150자 이하로 작성해 주세요!")
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
<h2>댓글 작성하기</h2>
</div>
<div class="table_div">
<form  action="${pageContext.request.contextPath}/cmt_comment_req" method="post" id="myForm">
<input type="hidden" name="cmt_no" value="${cmt.cmt_no}">
<input type ="hidden" name="parent_cmt_no" value="${cmt.parent_cmt_no}">
<input type ="hidden" name="member_id" value="${loginMember.member_id}">
<input type = "hidden" name="article_no" value="${cmt.article_no}">
<input type = "hidden" name="depth" value="${cmt.depth}">
<input type = "hidden" name="seq" value="${cmt.seq}">

<table class="cmt_comment_table">
<tr>
<td style="width:15%; height:100%"></td>
<td style="width:70%; height:100%">
<textarea rows="5" cols="30" style="margin: 0px;
    width: 540px;
    height: 120px;
    resize: none;"
    name="cmt_content" id ="cmt_textarea"></textarea>
</td>
<td style="width:15%; height:100%"><input type="submit" value="작성완료" id="submit_btn"/><label id = "count_label">(0/150자)</label></td>
</tr>

</table>



</form>
</div>
</section>

<%@ include file="/WEB-INF/resources/right_footer.jsp" %>

</body>
</html>