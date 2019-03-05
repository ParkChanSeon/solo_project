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



</head>
<body>


<%@ include file="/WEB-INF/resources/header_left.jsp" %>


<section id = "main">
<div class = "title_header">
<h2>Join Success</h2>
</div>

<div id = "loginForm">

<h3>게시글 작성이 완료되었습니다..<br/></h3>

  
 <button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}'">메인으로</button>

  

</div>
</section>

<%@ include file="/WEB-INF/resources/right_footer.jsp" %>

</body>
</html>