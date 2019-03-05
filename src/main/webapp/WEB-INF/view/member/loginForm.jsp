<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>로그인</title>

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
	
	
	
	
	$("#id").focusout(function(){
		
		if ($("#id").val() != "" && $("#pw").val() != ""){
			$("#login_btn").attr('disabled', false);
		} else {
			$("#login_btn").attr('disabled', true);
		}
		
		  		    });
	
	$("#pw").keypress(function(){
		
		if ($("#id").val() != "" && $("#pw").val() != ""){
			$("#login_btn").attr('disabled', false);
		}  else {
			$("#login_btn").attr('disabled', true);
		}
		
		  		    });
	
	
	$("#login_btn").click(function(){
		
		  var map =  new Map;
			 map = {
				 "id" : $("#id").val(),
				 "pw" : $("#pw").val()
					 
			 }
			  
			    $.ajax({
			        url : "${pageContext.request.contextPath}/login",
			        type : "POST",
			        cache : false,
			        dataType: 'json',
			        data : map,
			        success : function(data){
			            	  var value = data.msg;
			            	  var code = data.code;
			            	  
			            	            	   
			            	   if(error == 1){

			            		alert(value);
			            		location.href="${pageContext.request.contextPath}/login";
			            		   
			            	   } else {
			            	   alert(value);
			            	   location.href="${pageContext.request.contextPath}/";
			            	   }
			            		  
			        }	
			        })
	            
			    });
	
	
	
	
		})
		
		
	

</script>


</head>
<body>

<%@ include file="/WEB-INF/resources/header_left.jsp" %>


<section id = "main">
<div class = "title_header">
<h2>Login Page</h2>
</div>

<div id = "loginForm">



  <div class="form-group">
    <label for="exampleInputEmail1">ID</label>
    <input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요" name = "member_id">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">PASSWORD</label>
    <input type="password" class="form-control" id="pw" placeholder="비밀번호를 입력하세요" name = "member_pw" >
  	<label id="error" style="color: red">${msg}</label>
  </div>
  
  <button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/join'">회원가입</button>
  <button type="button" class="btn btn-default" disabled="disabled" id = "login_btn">로그인</button>




</div>
</section>

<%@ include file="/WEB-INF/resources/right_footer.jsp" %>

</body>
</html>