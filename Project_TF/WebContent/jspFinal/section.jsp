<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value = "${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${contextPath}/js/scroll.js"></script>
<script type="text/javascript" src="${contextPath }/js/imageZoom.js"></script>
<script type="text/javascript" src="${contextPath }/js/aos.js"></script>
<link rel="stylesheet" href="${contextPath }/css/section.css">
<link rel="stylesheet" href="${contextPath }/css/aos.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Bangers|Nanum+Gothic|Nanum+Myeongjo|Parisienne|Permanent+Marker|Poiret+One" rel="stylesheet">
<title>Travel is Fate</title>
</head>
<body>
	<div class="wrapper">
		<nav>
			<div class="logo">TF</div>
			<ul>
				<li><a href="#">Travel Schedule</a></li>
				<li><a href="#">I'm back</a></li>
				<li><a href="#">With Us</a></li>
				<li><a href="#">Join</a></li>
				<li><a class="active" href="#">Log in</a></li>
			</ul>
		</nav>
		
		<!-- 메인 부분 -->
		<section class="sec1"><!-- zoom -->
			<img src="${contextPath }/img/bicycle-2402188_1920.jpg">
			<div class="box">
				<h1>&nbsp;Travel&emsp;is&emsp;Fate</h1>				
			</div>
		</section>
		
		<section class="secText">
			<div class="fade-up" data-aos="fade-up">
				<div class="row-1">
					<h1>Research Your choice of the City</h1>
					<p>Research Your Dream!!</p>
				</div>
				<div class="box">				
					<form action="">
						<input type="text" name="" placeholder="찾고싶은 지역명을 적어주세요">
						<input type="submit" name="" value="검색">
					</form>	
				</div>	
			</div>
		</section>
		
		
		<!-- 광고 배너 -->
		<section class="sec2" data-aos="fade-left">
			<div class="leftBox">
				<div class="content">
					<h1>Event Page</h1>
					<p>Event of the City</p>
				</div>
			</div>
			<div class="events">
				<ul>
					<li>
						<div class="time">
							<h2>24<span>June</span></h2>
						</div>
						<div class="details">
							<h3>Where?</h3>
							<p>Kangnam is very hot like Aldus PageMaker including versions of Lorem Ipsum.</p>
							<a href="#" target="_blank">View Detail</a>	
						</div>
						<div style="clear: both;"></div>
					</li>
					<li>
						<div class="time">
							<h2>4<span>July</span></h2>
						</div>
						<div class="details">
							<h3>Where?</h3>
							<p>Seocho is very hot ishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
							<a href="#" target="_blank">View Detail</a>	
						</div>
						<div style="clear: both;"></div>
					</li>
					<li>
						<div class="time">
							<h2>10<span>August</span></h2>
						</div>
						<div class="details">
							<h3>Where?</h3>
							<p>Tee moo is very hot re like Aldus PageMaker including versions of Lorem Ipsum.</p>
							<a href="#" target="_blank">View Detail</a>	
						</div>
						<div style="clear: both;"></div>
					</li>
				</ul>
			</div>
		</section>
		
		<!-- 잠시 쉬는 글 더 알아보기 -->
		<section class="secText" data-aos="flip-left">
			<div class="row">
				<h1>Project Member</h1>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>
		</section>
		
		<!-- 사진 모음 배너 -->
		<section class="sec4" data-aos="flip-up">
			<div class="container-photo">
				<div class="box">
					<div class="imgBox">
						<img src="${contextPath }/img/photographer-865295_1280.jpg">
					</div>
					<div class="content">
						<h2>Cheese</h2>
						<p>I'm very awesome!!</p>
						<a class="btn" href="#">Detail View >></a>
					</div>
				</div>
				<div class="box">
					<div class="imgBox">
						<img src="${contextPath }/img/street-238458_1280.jpg">
					</div>
					<div class="content">
						<h2>Moonshin</h2>
						<p>Travel is good</p>
						<a class="btn" href="#">Detail View >></a>
					</div>
				</div>
				<div class="box">
					<div class="imgBox">
						<img src="${contextPath }/img/train-2593687_1280.jpg">
					</div>
					<div class="content">
						<h2>Train Travel</h2>
						<p>Train is very cold</p>
						<a class="btn" href="#">Detail View >></a>
					</div>
				</div>
				<div class="box">
					<div class="imgBox">
						<img src="${contextPath }/img/traveler-1611614_1280.jpg">
					</div>
					<div class="content">
						<h2>Tatoo</h2>
						<p>Tatoo very hate..</p>
						<a class="btn" href="#">Detail View >></a>
					</div>
				</div>
				<div class="box">
					<div class="imgBox">
						<img src="${contextPath }/img/hamburg-2976711_1280.jpg">
					</div>
					<div class="content">
						<h2>City of the afternoon</h2>
						<p>very good view</p>
						<a class="btn" href="#">Detail View >></a>
					</div>
				</div>
				<div class="box">
					<div class="imgBox">
						<img src="${contextPath }/img/20171114112207_821582.png">
					</div>
					<div class="content">
						<h2>Teeemo</h2>
						<p>one two three four</p>
						<a class="btn" href="#">Detail View >></a>
					</div>
				</div>	
			</div>
		</section>
		
		<!-- 제작진 소개 -->
		<section class="sec5" data-aos="zoom-in">
			<section class="team">
			<div class="container">
				<div class="row">
					<h1>Project Member</h1>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
				</div>
					<div class="row-2">
						<div class="card">
							<div class="box">
								<div class="img">
									<img src="${contextPath }/img/20171114112207_821582.png">
								</div>
								<h2>BBongs<br><span>UX/UI Designer</span></h2>
								<p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type</p>
								<ul>
									<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card">
							<div class="box">
								<div class="img">
									<img src="${contextPath }/img/20171114112207_821582.png">
								</div>
								<h2>BBongs<br><span>UX/UI Designer</span></h2>
								<p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type</p>
								<ul>
									<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card">
							<div class="box">
								<div class="img">
									<img src="${contextPath }/img/20171114112207_821582.png">
								</div>
								<h2>BBongs<br><span>UX/UI Designer</span></h2>
								<p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type</p>
								<ul>
									<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</div>
					<div style="clear: both;"></div>
				</div>
			</div>
		</section>
	</section>
	
	
	
		<!-- footer 부분 -->
		<section class="secText-footer" data-aos="fade-up" data-aos-anchor-placement="top-bottom">
			Copyright © 2018 Travel is Fate. All Rights Reserved
		</section>
	</div>
	
</body>
<script type="text/javascript">
	AOS.init({
		offset: 100,
		duration: 1000
	});
	</script>
</html>