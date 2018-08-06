<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value = "${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  
<!-- bootstrap cdn -->  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${contextPath }/js/text-rotator2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

            <!-- main start -->
            <!-- ================ -->
            <div class="main col-lg-8">

              <!-- page-title start -->
              <!-- ================ -->
              <h1 class="page-title">Text Rotators</h1>
              <div class="separator-2"></div>
              <!-- page-title end -->

              <!-- Text Rotators start -->
              <!-- ============================================================================== -->
              <div id="text-rotator-text" class="mt-4 text-rotator-text d-none">
                <p>The Project is Powerful Template</p>
                <p>The Project is Bootstrap Based</p>
                <p>The Project is Multipurpose</p>
                <p>The Project has Clean Design</p>
              </div>
              <h2 id="text-rotator" class="d-inline-block text-rotator" style="min-height: 40px;"></h2>
            </div>
       
</body>
</html>