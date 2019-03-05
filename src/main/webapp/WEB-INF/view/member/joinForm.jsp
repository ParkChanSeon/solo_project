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
	var btn = document.getElementById('submit_btn')
	btn.disabled = true;
	
	
	
	$("#id").focusout(function(){
		
		  var map =  new Map;
			 map = {
				 "id" : $("#id").val()
					 
			 }
			  
			    $.ajax({
			        url : "${pageContext.request.contextPath}/checkid",
			        type : "POST",
			        cache : false,
			        dataType: 'json',
			        data : map,
			        success : function(data){
			            	  var value = data.msg;
			            	  var error = data.error;
			            	  
			            	   $("#id_error").text(value);
			            	   
			            	   if(error == 0){
			            		   $("#id_error").css("color","blue");
			            		   
			            		   if ( $("#pw1").val() == $("#pw2").val() &&
			          			    		$("#join_name").val() != ""){
			          			    	$("#submit_btn").attr('disabled', false);
			          			    } else {
			          			     $("#submit_btn").attr('disabled', true);
			          			    }
			            		  
			            		  
			            	   } else
			            	   $("#id_error").css("color","red");
			            	  
			            		  
			        }	
			        })
	            
			    });
	
	// 비밀번호 검사
	$("#pw2").focusout(function(){
		
		  var pw1 = $("#pw1").val();
		  var pw2 = $("#pw2").val();
		
		
		if ( pw1 != pw2 ){
			var value = "비밀번호가 일치하지 않습니다!"
			$("#pw_error").text(value);
			$("#pw_error").css("color", "red");
			$("#submit_btn").attr('disabled', true);
			
			
		} else {
			$("#pw_error").text("");
			  
			 if ($("#id_error").text() == "사용 가능한 ID입니다." && $("#join_name").val() !=""){
				 $("#submit_btn").attr('disabled', false);
			    } else {
			    	 $("#submit_btn").attr('disabled', true);
			    }
			
		}
		
	     
		 
			    });
	
	
	$("#join_name").focusout(function(){
		
		var join_name = $("#join_name").val();
		var value = "이름을 입력하세요!"
		if (join_name.length == 0){
			
			$("#name_error").text(value);
			$("#name_error").css("color", "red");
			$("#submit_btn").attr('disabled', true);
		} else {
			value = "";
			console.log("??");
			$("#name_error").text(value);
			
			var id_error = $("#id_error").text();
			console.log(id_error);
			
			if(id_error == "사용 가능한 ID입니다." && $("#pw1").val() == $("#pw2").val()){
		
			$("#submit_btn").attr('disabled', false);
			
			} else {			
			 $("#submit_btn").attr('disabled', true);
			}
			
		}
		
		 
		 
		    });
		})
		
		
		function check(){
		
		if (document.getElementById('id').value == ""){
			alert("사용할 ID를 입력해 주세요!");
			document.getElementById('id').focus();
			return false;
		} else if (document.getElementById('pw1').value == ""){
			alert("사용할 비밀번호를 입력해 주세요!");
			document.getElementById('pw1').focus();
			return false;
		} else if (document.getElementById('pw2').value == ""){
			alert("비밀번호 확인을 입력해 주세요!");
			document.getElementById('pw2').focus();
			return false;
		} else if (document.getElementById('join_name').value == ""){
			document.getElementById('join_name').focus();
			alert("이름을 입력해 주세요!");
			return false;
		} else if (document.getElementById('pw1').value != document.getElementById('pw2').value){
			alert("비밀번호가 일치하지 않습니다!");
			document.getElementById('pw2').focus();
			return false;
		} else {
			return true;
		}
	
		
	
	}
	

	
	

</script>

</head>
<body>

<%@ include file="/WEB-INF/resources/header_left.jsp" %>


<section id = "main">
<div class = "title_header">
<h2>Join Membership</h2>
</div>

<div id = "loginForm">


<form action="${pageContext.request.contextPath}/join" method = "POST" style="display:inline-block; width: 350px;"
onsubmit="return check();">
  <div class="form-group">
    <label for="exampleInputEmail1">ID</label>
    <input type="text" class="form-control" placeholder="사용할 아이디를 입력하세요"
    name="member_id" id = "id">
  	<label class = "errorLabel" id = "id_error"></label>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">PASSWORD</label>
    <input type="password" class="form-control" id="pw1" placeholder="사용할 비밀번호를 입력하세요"
    name ="member_pw">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">PASSWORD CONFIRM</label>
    <input type="password" class="form-control" id="pw2" placeholder="비밀번호 확인"
    name ="member_pw2">
    <label class = "errorLabel" id = "pw_error"></label>
  </div>
   <div class="form-group">
    <label for="name">NAME</label>
    <input type="text" class="form-control" id="join_name" placeholder="이름을 입력하세요"
    name="member_name">
  	<label class = "errorLabel" id = "name_error"></label>
  </div>
  
  <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
  <input type="submit" class="btn btn-default" id = "submit_btn" value="가입하기">
  
</form>



</div>
</section>

<%@ include file="/WEB-INF/resources/right_footer.jsp" %>

</body>
</html>