<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>I LOVE SOCCER</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
		<script type="text/javascript" src="js/jquery-1.6.js" ></script>
		<script type="text/javascript" src="js/cufon-yui.js"></script>
		<script type="text/javascript" src="js/bgSlider.js" ></script>
		<script type="text/javascript" src="js/script.js" ></script>  <!--  배경 -->
		<script type="text/javascript" src="js/pages.js"></script>   <!-- 버튼 --> 
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="js/bg.js" ></script> 
		<script type="text/javascript" src="js/tabs.js"></script> <!-- 탭은 한 번에 하나씩 각 창을 볼 수있는 여러 창으로 내용을 분리하는 데 사용 -->
		<script type="text/javascript" src="js/jquery.prettyPhoto.js"></script> <!-- 이미지를 지원할뿐만 아니라 비디오, 플래시, YouTube, iframe 및 아약스도 지원 -->
	</head>
	<body id="page1">
	<div class="spinner"></div>
	<div id="bgSlider"></div>
	<div class="extra">
		<div class="main">
			<div class="box">
				<header>
					<h1> 
						<!-- 로고 -->
						<a href="Home.jsp">
							<img src="images/logo.PNG" width="280" height="150" alt="I LOVE SOCCER">
						</a>
					</h1>
					<nav>
						<!-- 왼쪽 메뉴 -->
						<ul id="menu">
							<li><a href="LoginPage.jsp"><span></span><strong>Login</strong></a></li>
							<li><a href="#!/page_About"><span></span><strong>News</strong></a></li>
							<li><a href="#!/page_Portfolio"><span></span><strong>Team</strong></a></li>
							<li><a href="#!/page_Services"><span></span><strong>Ticket</strong></a></li>
							<li><a href="#!/page_Contact"><span></span><strong>MyServices</strong></a></li>
						</ul>
					</nav>
				</header>
			</div>
		</div>

		<div class="block"></div>
	</div>
	<!--  -->
	<!-- 이미지를 바꿀수있는 아래 3개 버튼 -->
	<div class="bg1">
		<div class="main">
			<footer>
				<div class="bg_spinner"></div>
				<ul class="pagination">
					<li class="current"><a href="images/메시.jpg">1</a></li>
					<li><a href="images/손흥민.jpg">2</a></li>
					<li><a href="images/호날두.jpg">3</a></li>
				</ul>
				<div class="col_1">
					<a href="Home1.jsp" id="Exordium">EXORDIUM</a> Copyright 2019
				</div>
			</footer>
			<p>
		</div>
	</div>
	
	<!-- ??? -->
	<script type="text/javascript"> Cufon.now(); </script>
		<script>
		$(window).load(function() {
			$('.spinner').fadeOut();
			$('body').css({overflow:'inherit'})
		})
		</script>
	</body>
</html>