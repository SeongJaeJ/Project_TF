<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value = "${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jquery -->
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script> 

<!-- bootstrap cdn -->  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- google font -->
<link href="https://fonts.googleapis.com/css?family=Cormorant+SC" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Bangers|Nanum+Gothic|Nanum+Myeongjo|Parisienne|Permanent+Marker|Poiret+One" rel="stylesheet">


<!-- ajax cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- font rotator -->
<script type="text/javascript" src="${contextPath }/js/text-rotator3.js"></script>
<link rel="stylesheet" href="${contextPath }/css/text-rotator3.css">

<!-- 기타 css,js -->
<link rel="stylesheet" href="${contextPath }/css/boardList.css">

<script type="text/javascript">
	$(document).ready(function() {
		$(".typewriter-effect").typer({
		startDelay: 1000,
		repeatDelay: 1000,
		backspaceDelay: 1000,
		strings: [
		"",
		""
		] });
		});
</script>

<title>BoardList</title>
</head>
<body>
	
	<div id="container">
	<header>
	    <h1>This is my header</h1>
	</header>
	<div id="banner">
	    <h2>This is the banner</h2>
	</div>
	<div id="content">
	    <p>This is the content</p>
	</div>
</div>
		
		
		
<!-- 	<h1 class="typewriter-effect"></h1> -->
</body>
</html>