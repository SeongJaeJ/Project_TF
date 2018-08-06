<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value = "${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="${contextPath }/css/boardList.css">
<title>Insert title here</title>
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
</body>
</html>