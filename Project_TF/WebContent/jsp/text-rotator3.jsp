<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value = "${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${contextPath }/js/text-rotator3.js"></script>
<link rel="stylesheet" href="${contextPath }/css/text-rotator3.css">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$(".typewriter-effect").typer({
	startDelay: 1000,
	repeatDelay: 1000,
	backspaceDelay: 1000,
	strings: [
	"Welcome to TechSini",
	"This is How Typewriter Effect Looks"
	] });
	});
</script>
</head>
<body>
	Typer.js
  <h1 class="typewriter-effect"></h1>






</body>
</html>