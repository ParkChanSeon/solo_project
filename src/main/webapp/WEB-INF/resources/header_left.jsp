

<header class = "main_header">
<h1><img src = "${pageContext.request.contextPath}/resources/images/sh.gif" style="width:50px;height:50px;">
<a href="${pageContext.request.contextPath}/">Test Board</a>
</h1>

</header>

<nav>
	<ul>
	<li><a href="${pageContext.request.contextPath}/">Board</a></li>
	
	<c:if test ="${empty loginMember}" var = "login">
	<li><a href="${pageContext.request.contextPath}/login">Login</a></li>
	</c:if>
	<c:if test ="${not login}">
	<li><a onclick="logout();" style="cursor: pointer;">Logout</a></li>
	</c:if>
	
	</ul>


</nav>

<aside id ="left">

</aside>