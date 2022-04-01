<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBUtil.DBUtil"%>
<%@ page import="java.sql.*" %>
<%@ page import="board.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<jsp:useBean id="dao" class="board.DAO"/>
<%	
request.setCharacterEncoding("utf-8");
	int total = dao.count();
	ArrayList<VO> alist = dao.getMemberList();
	int size = alist.size();
	int size2 = size;
	
	final int ROWSIZE = 24;  
	final int BLOCK = 5;
	int indent = 0;

	int pg = 1;
	
	if(request.getParameter("pg")!=null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	int end = (pg*ROWSIZE);
	
	int allPage = 0;

	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;
	
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	
	if(endPage > allPage) {
		endPage = allPage;
	}
	
	size2 -=end;
	if(size2 < 0) {
		end = size;
	}
	
%>

<!DOCTYPE html>
<!-- 게시판 글쓰기 파트 -->
<script language = "javascript"> // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.name.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.name.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();		// form 에 있는 비밀번호 위치로 이동
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
    
 </script>
 <!-- 게시판 글쓰기 파트 -->
 
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
		<script type="text/javascript" src="js/cufon-replace.js"></script>
  		<script type="text/javascript" src="js/Ubuntu_400.font.js"></script>
  		<script type="text/javascript" src="js/Ubuntu_700.font.js"></script>
		<script type="text/javascript" src="js/bgSlider.js" ></script>
		<script type="text/javascript" src="js/script.js" ></script>
		<script type="text/javascript" src="js/pages.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="js/bg.js" ></script>
		<script type="text/javascript" src="js/tabs.js"></script>
		<script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>
	</head>
	
<style type="text/css">
#apple {
font-size:150% ;
color:#fffffe;
	
}
#liver {
	color:#fffffe;
}
.Timeone{
	
	border-width : 10ox;
   	border-color : white;
}
.items {
    border-top: 1px solid #2f323a;
    background: black;
    padding: 0 3%;
    margin-bottom: 7px;
    position: relative;
}
.items .itemTitle {
    padding: 6px 0 1px;
    border-bottom: 1px solid #eee;
    z-index: 2;
}
.items .itemTitle .dateNum {
    font-size: 20px;
    color: white;
    letter-spacing: -1px;
}
.items .itemTitle .dateTxt {
    font-size: 14px;
    color: white;
    letter-spacing: -1px;
}
.items .itemTitle .location {
    float: right;
    font-size: 12px;
    text-align: right;
    color: #999;
}
.items .itemInfo {
    width: 100%;
    display: table;
    border-bottom: 1px solid #eee;
    padding: 12px 0 11px;
    z-index: 1;
}
.items .itemInfo > div:first-child {
    width: 41%;
    font-size: 0;
    line-height: 0;
}
.items .itemInfo > div:first-child img {
    width: auto;
    height: 50px;
    font-size: 0;
    line-height: 0;
}
.items .itemInfo > div {
    display: table-cell;
    vertical-align: middle;
    height: 50px;
    color: #111;
    font-size: 14px;
    line-height: 16px;
}
.items .itemBtn {
    padding: 12px 0;
    text-align: center;
}
.items .itemBtn a.BtnColor_Y {
    background: #8181F7;
    border-color: #0404B4;
}
.items .itemBtn a {
    box-sizing: border-box;
    display: block;
    width: 78%;
    margin: 0 auto;
    padding: 12px 0 8px;
    border-right: 1px solid #2f323a;
    border-bottom: 1px solid #2f323a;
    background: #2f323a;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    text-align: center;
    
}
.items .itemInfo .rr{
	float: right;
	margin-right: 100px;
}

.itemBtn input.BtnColor_Y {
    background: #8181F7;
    border-color: #0404B4;
}
.itemBtn input {
    box-sizing: border-box;
    display: block;
    width: 78%;
    margin: 0 auto;
    padding: 12px 0 8px;
    border-right: 1px solid #2f323a;
    border-bottom: 1px solid #2f323a;
    background: #2f323a;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    text-align: center;
    
}
</style>

	<body id="page1">

	<!-- 세션 파트  -->
	<%
		if (session.getAttribute("name") == null) {
			response.sendRedirect("Home1.jsp");
		}
	%>
	<hr>
	<p>
		<br>
	
	<center>
		<h1 id="apple" ><%=session.getAttribute("name")%>님 반갑습니다.</h1>
	</center>

	<!-- 세션 파트  -->

	<!-- 게시판 파트   -->
	<div class="spinner"></div>
	<div id="bgSlider"></div>
	<div class="extra">
		<div class="main">
			<div class="box">

				<header>
					<h1>
						<!-- 로고 -->
						<a href="Home1.jsp"> <img src="images/logo.PNG" width="280"
							height="150" alt="I LOVE SOCCER">
						</a>
					</h1>
					<nav>
						<ul id="menu">
							<!-- 왼쪽 메뉴 -->
							<li><a href="Home.jsp"><span></span><strong>Logout</strong></a></li>
							<li><a href="#!/page_About"><span></span><strong>News</strong></a></li>
							<li><a href="#!/page_Portfolio"><span></span><strong>Team</strong></a></li>
							<li><a href="#!/page_Services"><span></span><strong>Ticket</strong></a></li>
							<li><a href="#!/page_Contact"><span></span><strong>My Services</strong></a></li>
						</ul>
					</nav>
				</header>

				<article id="content">
					<div class="ic"></div>
					<ul>
						<!--  News 클릭페이지 -->
						<li id="page_Home">
						<li id="page_About">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"><span></span></a>
									<h2>News</h2>
									<div class="wrapper">
										<img src="images/ch.jpg" width="280" height="150" alt="...">
										<p>
										<br>
									</div>
									<h6>UEFA 챔피언스리그(UEFA Champions League)는 유럽 축구 연맹이 주관하는,
										유럽에서 가장 우수한 축구 클럽들을 대상으로 매년 열리는 클럽 축구 대회이다. 1955년에 시작되었다.
										유러피언컵(European Cup)으로 불리다가 1992년 UEFA 챔피언스리그로 개칭되었다. 보다 비중이 약한
										대회인 UEFA 유로파리그와 이미 폐지된 UEFA 컵위너스컵과 비교된다. 해마다 7월쯤 시작되는 토너먼트 형식의
										예선전을 통과한 10개 팀들과 조별 리그에 자동 진출한 22개 팀을 합친 총 32개 팀들이 8개 조로 나뉘어 각
										조별로 4개 팀씩 홈 앤드 어웨이 방식으로 본선 경기를 치른다. 매년 12월에 모든 조별 리그전이 종료되면, 각
										조의 1, 2위 팀은 그 다음 해 2월부터 5월까지 계속되는 16강 결선 토너먼트에 진출한다. 또 각 조의 3위
										팀은 UEFA 유로파리그의 32강 토너먼트에 진출한다. 가장 최근 우승 팀은 2018년 우크라이나 키예프의
										올림피스키 경기장에서 리버풀을 꺾고 우승한 레알 마드리드이다. 이 대회는, 유럽 프로 축구 세계에서 최고의
										권위를 가진 대회이다. 대회 결승전은 보통 유럽 프로 축구의 모든 시즌 일정 가운데 가장 마지막 경기로
										치러진다. 또한 유럽 대륙의 축구 선수들이 이적을 고려할 시에 챔피언스리그 32강 본선 경기 출전이 가능한
										팀인가를 우선 순위로 고려할 정도이다. 줄여서 '챔스', 'UCL'이라고 부르기도 한다. UEFA 챔피언스리그의
										대표곡은 리그 데 샹피옹 (Ligue des Champions)이다.</h6>
									<!-- 관련 기사 -->
									<h2>Issue</h2>
									
									<ul class="list2 pad_bot1">
										<li><a href="#!/page_More1">10일 토트넘-맨시티 UEFA챔스 8강 1차전 1-0 승리 결승골</a></li>
										<li><a href="#!/page_More2">손흥민 챔스 결승 선발출전…우승컵은 리버풀에게로</a></li>
										<li><a href="#!/page_More3">챔스 결승 앞둔 손흥민, 박지성 이후 8년만…축구 새역사 장식할까</a></li>
										<li><a href="#!/page_More4">손흥민 “챔스 결승, 출전이 아니라 우승이 목표였다”</a></li>
										<li><a href="#!/page_More5">발롱도르 주관하는 프랑스 풋볼, 챔스 베스트 11에 손흥민 선정</a></li>
										<li><a href="#!/page_More6">챔스 마친 손흥민, 호주 평가전도 선발 출격…황희찬과 투톱</a></li>
									</ul>
								</div>
							</div>
						</li>

						<!-- Team 클릭 페이지 -->
						<li id="page_Portfolio">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"><span></span></a>
									<div class="wrapper tabs">
										<div class="col1">
											<h2>CHAMPIONS LEAGUE</h2>
											<!-- Team 왼쪽 메뉴 -->
											<ul class="nav">
												<li class="selected"><a href="#Barcelona"><span></span><strong>Barcelona</strong></a></li>
												<li><a href="#RealMadrid"><span></span><strong>RealMadrid</strong></a></li>
												<li><a href="#Liverpool"><span></span><strong>Liverpool</strong></a></li>
												<li><a href="#Juventus"><span></span><strong>Juventus</strong></a></li>
												<li><a href="#BayernMünchen"><span></span><strong>BayernMünchen</strong></a></li>
												<li><a href="#AtléticodeMadrid"><span></span><strong>AtléticodeMadrid</strong></a></li>
												<li><a href="#ParisSaintGermain"><span></span><strong>Paris Saint-Germain</strong></a></li>
												<li><a href="#TottenhamHotspur"><span></span><strong>Tottenham Hotspur</strong></a></li>
												<li><a href="#ManchesterUnited"><span></span><strong>Manchester United</strong></a></li>
												<li><a href="#Valencia"><span></span><strong>Valencia</strong></a></li>
											</ul>
										</div>

										<!-- 여기서부터 각각의 왼쪽메뉴 클릭시 뜨는창 나열 -->
										<div class="col2 pad_left1">
											<div class="tab-content" id="Barcelona">
												<h2>Barcelona</h2>
												<img src="images/bal.jpg" width="280" height="150" alt="...">
												<p>
												<br>
												<h6>풋볼 클럽 바르셀로나 (카탈루냐어: Football Club Barcelona, 축구단
													바르셀로나)는 스페인 카탈루냐 지방의 바르셀로나를 연고지로 하는 세계 최초이자 세계 최대 규모로 협동조합
													형태로 운영되는 축구 클럽이다. 홈 경기장은 캄 프누이며, 1899년 11월 29일에 창단되었다. 리저브
													팀으로 FC 바르셀로나 B를 두고 있다. 유스 팀으로는 FC 바르셀로나 후베닐 A, FC 바르셀로나 후베닐
													B, FC 바르셀로나 카다테, FC 바르셀로나 인판틸, FC 바르셀로나 알레빈, FC 바르셀로나 벤하민,
													순으로 나뉘어 있다. 바르사의 유스 시스템인 라 마시아는 펩 과르디올라, 리오넬 메시, 안드레스
													이니에스타, 세르히오 부스케츠, 제라르 피케, 조르디 알바, 카를레스 푸욜, 사비 에르난데스, 빅토르
													발데스, 페페 레이나, 세스크 파브레가스, 페드로 로드리게스, 티아고 알칸타라, 세르지 로베르토 등등 많은
													축구 선수들을 배출하였다. 프리메라리가에서 레알 마드리드 CF 와 숙명의 라이벌이며 두 클럽 사이의 대결은
													엘 클라시코라고 부른다. 또한 같은 지역을 연고로 하는 RCD 에스파뇰과의 바르셀로나 더비도 유명하다. 팀
													명을 줄여서 바르사(바르샤)(Barça)라고도 부르는데 발음할 때에 주의해야 한다. 'ç' 표기가 없는
													언어에서는 모양이 유사한 알파벳 'c'로 'ç'를 대체하는 경우가 많아 'Barca'라고 표기되는 경우도
													흔한데, 이것은 단순히 표기상의 난점으로 인해 일어나는 현상일 뿐 발음은 '바르카'가 아닌
													'바르사(바르샤)' 로 한다</h6>
											</div>

											<div class="tab-content" id="RealMadrid">
												<h2>RealMadrid</h2>
												<div class="wrapper">
													<img src="images/real.jpg" width="280" height="150"
														alt="...">
													<p>
														<br>
													<h6>레알 마드리드 클루브 데 푸트볼 (스페인어: Real Madrid Club de
														Fútbol reˈal maˈðɾið ˈkluβ ðe ˈfuðβol[*], 왕립 마드리드 축구단) 은
														흔히 레알 마드리드 (스페인어: Real Madrid) 혹은 스페인 밖에서 줄여서 레알 (스페인어:
														Real) 로 알려진 프로 축구 구단으로 스페인의 마드리드 지방 마드리드를 연고로 한다. 1902년
														마드리드 축구단 (Madrid Football Club) 으로 창단한 이 구단은 전통적으로 백색 주
														유니폼을 입었다. '레알'이라는 단어는 스페인어로 '왕립'이라는 뜻을 지니며, 1920년에 알폰소
														13세로부터 명칭을 하사 받으면서 엠블럼에 왕관이 추가되었다. 레알 마드리드는 1947년부터 안방 경기를
														85,454명의 관중을 수용 가능한 마드리드 도심의 산티아고 베르나베우에서 치렀다. 구단은 2015년에
														€3.24B의 매출액을 올렸고, 2014-15 시즌에는 최고 매출액을 기록한 축구단으로 기록되었는데,
														연간 €577M의 매출액을 올린 것으로 조사되었다. 레알 마드리드는 세계에서 가장 널리 응원받는
														구단이기도 하다. 레알 마드리드는 프리메라 디비시온 출범의 원년 참가 구단들 중 1부 리그에서 강등된
														적이 없는 3개의 구단들 중 하나로, 나머지 두 구단들은 바르셀로나와 아틀레틱 빌바오이다. 구단은 다수의
														타 구단들과 오랜 기간의 숙적 관계를 맺고 있는데, 가장 알려진 숙적으로는 엘 클라시코 (El
														Clásico) 에서 맞대결을 펼치는 바르셀로나이고, 다른 하나는 마드리드 더비 (El Derbi
														madrileño) 의 맞수 아틀레티코 마드리드이다. 레알 마드리드는 1950년대에 스페인과 유럽
														축구계의 주요 강자로 자리매김했는데, 유러피언컵을 5번 연속 우승하고 7번 결승에 올랐다. 이러한 성공을
														자국 리그에서도 거두었는데, 구단은 7년의 기간동안 5번의 리그 우승을 거두었다.</h6>
												</div>
											</div>

											<div class="tab-content" id="Liverpool">
												<h2>Liverpool</h2>
												<div class="wrapper">
													<img src="images/liver.jpg" width="280" height="150"
														alt="...">
													<p>
														<br>
													<h6>리버풀 축구 클럽(영어: Liverpool Football Club, 리버풀 축구단)은
														잉글랜드 머지사이드주 리버풀을 연고로 하는 프리미어리그 축구 클럽이다. 리버풀은 현재 총 18회의 리그
														우승을 한 바 있으며, 8번의 리그 컵 우승, 7번의 FA컵우승, 그리고 6번의 UEFA 챔피언스리그
														우승을 차지한 바 있는데 챔피언스리그 우승은 잉글랜드 내에서는 역대 최다 우승 기록으로 기록되어 있다.
														리버풀은 1892년에 창단되었으며, 그 후 비약적인 상승세를 보여 1900 ~ 1947년도까지 5번의
														리그 우승을 거두기도 했었다. 하지만 1950년대에는 주로 2부리그에 머물러 있었고 1959년 빌
														샹클리가 감독을 맡기 전까지 리버풀은 1부리그 승격을 하지 못했다. 샹클리가 감독을 맡은 지 두 시즌
														만에 리버풀은 다시 1부리그로 승격하게 되었고 또다시 리버풀은 세 번의 리그 우승과 두 번의 FA컵
														우승과 한 번의 UEFA컵 우승을 일궈내게 된다. 과거 30년전의 리버풀은 잉글랜드뿐만 아니라
														유럽축구에서 최강의 클럽 중 하나로 군림하였으며 1977 ~ 1984년까지 8시즌 동안 무려 4번의
														챔피언스리그 우승 이라는 결과를 만들어 내었다. 1990년대에 약간의 침체기가 있었지만 2001년
														UEFA컵 우승을 하였으며, 2005년도에는 다섯 번째 챔피언스리그 우승을 차지해 잉글랜드 축구팀으로는
														최초이자 유일한 빅이어 영구소장 팀이 되었다. 특히 1984년과 2001년도에는 세 개의 트로피를 차지한
														팀에게 주어지는 트레블의 자격도 있었지만 우승한 대회의 기준에 부합하지 못하여 미니 트레블로 불린다.
														리버풀의 홈 유니폼 색깔은 원래 레드 앤 화이트였으나 1960년대에는 올 레드로 바뀌었다. 리버풀의
														엠블럼은 창단후 변화가 거의 없었지만 1989년 힐즈브러 참사를 기리기 위해 엠블럼의 좌우에 불꽃을
														집어넣어 현재에 이르고 있다. 리버풀은 현재 54,074명을 수용하는 안필드를 홈 경기장으로 사용하고
														있으며, 59,000석까지 증축 예정이다. 리버풀은 광대하고 다양한 팬층을 보유하고 있으며 오랜 전통을
														가지고 있다.</h6>
												</div>
											</div>

											<div class="tab-content" id="Juventus">
												<h2>Juventus</h2>
												<div class="wrapper">
													<img src="images/ju.jpg" width="280" height="150" alt="...">
													<p>
														<br>
													<h6>유벤투스 풋볼 클럽(이탈리아어: Juventus Football Club S.p.A.)은
														이탈리아 피에몬테주 토리노가 연고지인 축구 클럽이다. 유벤투스(Juventus)는 라틴어로 젊음이라는
														의미이며, 줄여서 유베(Juve)라고 한다. 별명은 엠블럼과 유니폼의 색상인 흰(Bianco)과
														검정(Nero)을 뜻하는 비안코네로(Bianconero, 복수형 비안코네리 (Bianconeri)), 라
														베키아 시뇨라(La Vecchia Signora, 나이든 귀부인), 제브레(Zebre, 얼룩말) 등이
														있다. 이탈리아에서 3번째로 오래된 축구 클럽이며, 2006–07 시즌을 제외하고 줄곧 1부 리그인
														세리에 A에 있었다. 엠블럼 한 가운데에 있는 것은 소로, 이는 연고지 토리노 시의 어원인
														타우리니(Taurini, 소의 사람들)에서 유래하였다. 토리노 시의 문양 그리고 연고지 라이벌인 토리노
														FC의 문양에도 있다. 연고지인 토리노에서는 토리노 FC와 경쟁관계에 있다. 그리고 이 두 클럽 간의
														경기를 토리노 더비라 부른다. 1990년대 후반 3연속 챔피언스리그 결승 진출(1995-96 우승,
														1996-97, 1997-98 준우승)을 비롯하여 꾸준하게 유럽 클럽 대항전에서 활약하여,
														IFFHS(International Federation of Football History &
														Statistics, FIFA 산하 통계 전문 기관)에서 선정한 20세기 축구 클럽 순위에서 1위인 레알
														마드리드에 뒤이어 2위에 위치하면서 다시 한 번 세계 최정상의 클럽들 중 하나임을 공인받았다. 이탈리아
														클럽랭킹 1위, 세리에 A 최다 우승(32회) 등의 기록을 보유하고 있다.</h6>
												</div>
											</div>

											<div class="tab-content" id="BayernMünchen">
												<h2>BayernMünchen</h2>
												<div class="wrapper">
													<img src="images/m.jpg" width="280" height="150" alt="...">
													<p>
														<br>
													<h6>FC 바이에른 뮌헨 e. V.(독일어: Fußball-Club Bayern München
														e. V.)은 바이에른주의 주도인 뮌헨을 연고로 하는 독일의 축구 클럽이다. 이 클럽의 프로축구부는 현재
														독일의 1부 리그인 푸스발-분데스리가에 속한 축구 팀이다. 바이에른 뮌헨은 독일 축구 리그 최다
														우승(28회), DFB-포칼 최다 우승(18회), 리가포칼 최다 우승(6회), 그리고 DFL-슈퍼컵 공동
														최다 우승(5회)을 성취한 독일의 분데스리가 클럽들 중 가장 성공적인 구단이다. 그리고 분데스리가
														1963년도 이후의 통산 집계인 올 타임 분데스리가 테이블에서 1위를 유지하고 있다.[1] 2012-13
														시즌에는 챔피언스 리그, 독일 리그, 그리고 DFB-포칼을 우승함으로써 독일의 축구단으로서 처음으로
														트레블을 성취했다. 클럽의 모토는 "우리는 우리다"(Mia San Mia)이다. 이 클럽은 프란츠 욘을
														비롯한 11명의 축구 선수들에 의해서 1900년에 창단되었다. 바이에른은 1932년에 첫 우승을
														거두었다. 이 클럽은 1970년대에 프란츠 베켄바워의 리더쉽 하에 유러피언 컵 3연패를 거두며
														(1974-1976) 전성기를 보냈다. 최근, 바이에른 뮌헨은 독일 축구계에서 최근 10년간 6번의 리그
														우승을 거두며 가장 성공적인 클럽이 되었다. 클럽이 최근에 획득한 국제대회 우승컵은 2001년에 획득한
														인터콘티넨털컵으로, 같은 해 4번째 UEFA 챔피언스리그 우승을 거두었다. 2005-06 시즌을
														기점으로, 바이에른은 33년간 홈구장으로 사용하던 뮌헨 올림픽 스타디움에서 알리안츠 아레나로 홈 구장을
														옮겼다. 바이에른 뮌헨의 고유색은 빨간색과 흰색이며, 팀의 엠블럼은 바이에른주를 상징한다. 바이에른은
														소시오 제도를 시행하고 있으며, 현재 162,187명의 회원을 보유하고 있다. 또한 2,764개의 공식
														등록된 팬 클럽을 가지고 있고 여기에 192,160명이 등록되어 있다.</h6>
												</div>
											</div>

											<div class="tab-content" id="AtléticodeMadrid">
												<h2>AtléticodeMadrid</h2>

												<div class="wrapper">
													<img src="images/a.jpg" width="280" height="150" alt="...">
													<p>
													<br>
													<h6>클루브 아틀레티코 데 마드리드(Club Atlético de Madrid), 혹은
														아틀레티코(Atlético) 로 알려진 아틀레티코 마드리드(Atlético Madrid)는 스페인
														마드리드를 연고로 하는 축구 클럽으로, 라리가에 소속되어 있다.[3] 아틀레티코는 1996년의 라 리가와
														코파 델 레이 더블을 비롯하여 10차례 라 리가를 우승하였고; 코파 델 레이를 10회; 수페르코파 데
														에스파냐를 1번, 그리고 코파 에바 두아르테를 3번 우승하였다; 유럽대회에서, 아틀레티코는 1962년에
														UEFA 컵 위너스컵을 우승하였고, 1974년에는 유러피언컵 준우승을 거두었으며,[4] 2010년과
														2012년에는 UEFA 유로파리그를 두 차례 우승하였고, 같은 해에 모두 UEFA 슈퍼컵을 우승하였으며,
														인터콘티넨털컵도 1974년에 한 번 우승하였다. 2017-18 시즌부터 73,000명을 수용할 수 있는
														완다 메트로폴라타노를 홈구장으로 사용하고 있으며 그 전에는 54,960명을 수용할 수 있는 에스타디오
														비센테 칼데론에서 홈경기를 치치렀다.[5] 아틀레티코의 홈 유니폼은 적색과 백색의 세로 줄무늬로 된
														셔츠와 청색 바지로 이루어져 있으며, 양말은 청색과 적색으로 되어 있다. 이 조합은 1911년부터
														사용되고 있다. 현재 아틀레티코 마드리드의 유니폼은 나이키에 의해 제조되며, 주 스폰서는 plus500
														이다 클럽은 스페인 내에서 레알 마드리드와 바르셀로나에 이어 3번째로 많은 서포터 수를 지니고 있다.
														또한 65,000명 이상의 시즌 티켓 소지자가 존재하며, 소시오 (유료 회원) 수 기준으로도 세계에서
														가장 큰 클럽들 중 하나로 손꼽힌다. 클럽의 역사로 인해, 클럽은 여러 가지 별칭이 붙었는데, 그 중
														하나인 매트리스 제작자들 (Los Colchoneros) 은 홈 유니폼의 색상과 줄무늬가 구형 매트리스의
														색상과 동일해서 붙었다.</h6>
												</div>
											</div>

											<div class="tab-content" id="ParisSaintGermain">
												<h2>Paris Saint-Germain</h2>
												<img src="images/par.jpg" width="280" height="150" alt="...">
												<p>
												<br>
												<div class="wrapper">
													<h6>파리 생제르맹 풋볼 클뢰브(Paris Saint-Germain Football Club),
														약칭으로 파리 생제르맹(Paris Saint-Germain) 이나 더 줄여서 파리 SG (Paris
														SG) 혹은 PSG (프랑스어: PSG 뻬에스제[*]) 는 프랑스의 수도 파리를 연고로 하는 프로 축구
														클럽이다. 이 구단은 1970년 8월 12일, 파리 FC와 스타드 생제르맹의 통합으로 창단되었다.
														PSG는 1974년을 기점으로 리그 1에 소속되어 있다.[1] 빨강과 파랑 (Les
														Rouge-et-Bleu) 은 리그 1을 6회 우승하였고, 리그 2를 1회 우승하였으며, 쿠프 드
														프랑스를 11회, 쿠프 드 라 리그를 7회, 트로페 데 샹피옹을 7회, 그리고 유럽대륙클럽대항전인
														UEFA 컵위너스컵과 UEFA 인터토토컵을 각각 1회씩 우승하였다.[2] 20개의 우승 타이틀을 보유한
														파리 생제르맹은 프랑스에서 4번째로 성공적인 클럽이며 올랭피크 드 마르세유와 더불어 주요 유럽대항전에서
														우승 타이틀을 획득한 유일한 프랑스 클럽이다.[3] 파르크 데 프랭스는 1974년을 기점으로 파리
														생제르맹의 홈구장이었다.[4] 캉 데 로그는 1970년을 기점으로 파리 생제르맹의 훈련 시설로
														사용되었다.[5] 투르누아 드 파리는 1975년을 기점으로 파르크 드 프랭스에서 수도 연고의 이 클럽에
														의해 주최되고 있다.[6] 파리지앵 (Les Parisiens) 의 로고와 셔츠는 주로 다니엘 에쉬테르에
														의해 디자인된다.[7] 로고에는 에펠 탑의 기둥 사이에 훈련장이 위치한 생-제르맹-앙-레의 엠블럼과
														플뢰르-드-리스가 새겨져 있다.[8] 전통적인 유니폼은 짙은 청색으로 백색 테두리의 적색 세로줄로 되어
														있다.[9] 펫 숍 보이스의 "고 웨스트"를 개사한 알레 파리 생제르맹 (Allez Paris
														Saint-Germain) 이 PSG의 공식 응원가이다. 팬의 의견에 의해 "고 웨스트"의 가사로부터
														개사되었다. 살쾡이 제르맹이 클럽의 공식 마스코트이다.[10] PSG는 올랭피크 드 마르세유와 격렬한
														라이벌 관계에 있으며, 둘 간의 경기는 르 클라시크라고 불리는데 이 경기는 프랑스에서 가장 유명한
														경기이다.[11] PSG는 라이벌 구단 마르세유에 이어 프랑스에서 두번째로 인기있는 구단이다.</h6>
												</div>
											</div>


											<div class="tab-content" id="TottenhamHotspur">
												<h2>Tottenham Hotspur</h2>
												<img src="images/Tot.jpg" width="280" height="150" alt="...">
												<p>
												<br>
												<div class="wrapper">
													<h6>파리 생제르맹 풋볼 클뢰브(Paris Saint-Germain Football Club),
														약칭으로 파리 생제르맹(Paris Saint-Germain) 이나 더 줄여서 파리 SG (Paris
														SG) 혹은 PSG (프랑스어: PSG 뻬에스제[*]) 는 프랑스의 수도 파리를 연고로 하는 프로 축구
														클럽이다. 이 구단은 1970년 8월 12일, 파리 FC와 스타드 생제르맹의 통합으로 창단되었다.
														PSG는 1974년을 기점으로 리그 1에 소속되어 있다.[1] 빨강과 파랑 (Les
														Rouge-et-Bleu) 은 리그 1을 6회 우승하였고, 리그 2를 1회 우승하였으며, 쿠프 드
														프랑스를 11회, 쿠프 드 라 리그를 7회, 트로페 데 샹피옹을 7회, 그리고 유럽대륙클럽대항전인
														UEFA 컵위너스컵과 UEFA 인터토토컵을 각각 1회씩 우승하였다.[2] 20개의 우승 타이틀을 보유한
														파리 생제르맹은 프랑스에서 4번째로 성공적인 클럽이며 올랭피크 드 마르세유와 더불어 주요 유럽대항전에서
														우승 타이틀을 획득한 유일한 프랑스 클럽이다.[3] 파르크 데 프랭스는 1974년을 기점으로 파리
														생제르맹의 홈구장이었다.[4] 캉 데 로그는 1970년을 기점으로 파리 생제르맹의 훈련 시설로
														사용되었다.[5] 투르누아 드 파리는 1975년을 기점으로 파르크 드 프랭스에서 수도 연고의 이 클럽에
														의해 주최되고 있다.[6] 파리지앵 (Les Parisiens) 의 로고와 셔츠는 주로 다니엘 에쉬테르에
														의해 디자인된다.[7] 로고에는 에펠 탑의 기둥 사이에 훈련장이 위치한 생-제르맹-앙-레의 엠블럼과
														플뢰르-드-리스가 새겨져 있다.[8] 전통적인 유니폼은 짙은 청색으로 백색 테두리의 적색 세로줄로 되어
														있다.[9] 펫 숍 보이스의 "고 웨스트"를 개사한 알레 파리 생제르맹 (Allez Paris
														Saint-Germain) 이 PSG의 공식 응원가이다. 팬의 의견에 의해 "고 웨스트"의 가사로부터
														개사되었다. 살쾡이 제르맹이 클럽의 공식 마스코트이다.[10] PSG는 올랭피크 드 마르세유와 격렬한
														라이벌 관계에 있으며, 둘 간의 경기는 르 클라시크라고 불리는데 이 경기는 프랑스에서 가장 유명한
														경기이다.[11] PSG는 라이벌 구단 마르세유에 이어 프랑스에서 두번째로 인기있는 구단이다.</h6>
												</div>
											</div>

											<div class="tab-content" id="ManchesterUnited">
												<h2>Manchester United</h2>
												<img src="images/man.jpg" width="280" height="150" alt="...">
												<p>
												<br>
												<div class="wrapper">
													<h6>맨체스터 유나이티드 풋볼 클럽(영어: Manchesthair United Football
														Club, 맨체스터 유나이티드 축구단)은 잉글랜드 맨체스터에 있는 잉글랜드 프로 축구 구단이다.
														1964-65 시즌 이래 단 1번의 시즌을 제외하고는 잉글랜드에서 최다 평균 관중 기록을 차지해왔다.
														프리미어리그 개편 당시 원년 구단이었으며 현재까지 계속 소속해 있다. 구단은 1878년 랭커셔 요크셔
														철도의 뉴턴 히스 지부 실업팀인 뉴턴 히스 LYR FC(Newton Heath LYR F.C.)로
														설립되었고, 1902년 4월 26일 맨체스터 유나이티드 FC로 개명했다. 맨체스터 유나이티드 FC는
														2010-11 시즌 프리미어리그 우승으로 잉글랜드 프로축구 역사상 19번째 1부 프로축구리그 우승을
														기록해, 기존에 리버풀 FC가 갖고 있던 기록과 같은 기록을 경신했다. 구단은 1991-92 시즌부터
														2012-13 시즌까지 단 한 차례도 3위 아래의 순위로 시즌을 마친 적이 없을 정도로 프리미어리그 출범
														이래 꾸준한 성적을 거두어왔다. 또한 구단은 잉글랜드 FA컵에서 총 12회 우승하여 아스널 FC 다음으로
														많은 우승기록을 보유하고 있다. 1968년에는 에우제비오의 벤피카를 꺾고 잉글랜드 축구단으로는 최초로
														유러피언컵을 들어올렸다.[1] 1999년에는 바이에른 뮌헨과의 결승전에서 나온 극적인 역전승으로 두 번째
														UEFA 챔피언스리그 우승을 차지했다. 이 해 UEFA 챔피언스리그, 프리미어리그, 잉글랜드 FA컵
														3개의 주요 타이틀을 석권하여 이른바 트레블을 달성하였다. 1990년대 후반 이래로 맨체스터 유나이티드
														FC는 가장 부유한 구단 가운데 하나로 자리매김하고 있으며, 근래에는 전 세계 축구단 가운데 최고의 수입
														기록을 지속적으로 기록해 왔다. 유럽의 저명한 프로축구단들의 모임인 G-14의 회원이기도 하며,[2]
														2007년 포브스의 세계 스포츠 구단 평가에서는 14억 5300만 달러의 평가를 받아 전 세계 축구단
														중에서 1위를 기록했다.</h6>
												</div>
											</div>

											<div class="tab-content" id="Valencia">
												<h2>Valencia</h2>
												<img src="images/val.jpg" width="280" height="150" alt="...">
												<p>
													<br>
												<div class="wrapper">
													<h6>발렌시아 클루브 데 푸트볼(스페인어: Valencia Club de Fútbol,
														카탈루냐어: València Club de Futbol),[1] 혹은 발렌시아 C.F., 발렌시아, 로스
														체 (Los Che) 는 스페인의 발렌시아를 연고지로 하는 축구 클럽이다. 이 클럽은 라 리가에 속해
														있으며, 스페인과 유럽 내에서 가장 성공적인 클럽들 중 하나로 손꼽힌다. 발렌시아는 6번의 라 리가,
														7번의 코파 델 레이, 2번의 인터시티스 페어스컵 (UEFA 유로파리그, UEFA 컵 전신), 1번의
														UEFA 컵 위너스 컵, 그리고 UEFA 슈퍼컵 우승을 거두었다. 이 클럽은 UEFA 챔피언스리그
														결승전에 2번 연속 진출하였으나, 2000년에 라 리가의 라이벌 레알 마드리드 CF에 패하였고, 이듬
														해에는 독일 분데스리가의 FC 바이에른 뮌헨에 1-1로 비긴 뒤 승부차기에서 패하였다. 위 결승전을
														포함하여 발렌시아는 7번의 유럽대항전 결승에 진출하여, 4번 우승을 거두었다. 또한 발렌시아는 2002년
														G-14의 회원으로 가입하였다. 현재까지 라 리가에서, 발렌시아는 레알 마드리드 CF와 FC 바르셀로나,
														아틀레티코 마드리드에 이어 4위를 기록하고 있다. 대륙 타이틀 수는 3위이며, 이는 레알 마드리드 CF와
														FC 바르셀로나 다음으로 많은 수이다. 또한 이 두 클럽과 발렌시아만이 유럽대항전 타이틀을 5개 이상
														보유하고 있다.[2] 발렌시아는 1919년에 창단되었으며, 1923년부터 현재까지 메스타야 경기장을
														연고로 하였다. 이 클럽은 2016년에 도시 북서부에 위치한 75,000석의 누에보 메스타야(Nuevo
														Mestalla)으로 이전할 계획이다. 발렌시아는 같은 연고지의 레반테 UD와 오랫동안 라이벌이었으며,
														발렌시아 지방의 다른 클럽들인 에르쿨레스 CF와 비야레알 CF와도 라이벌 관계에 있다.</h6>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>

						<!-- 예매할 티켓 선택 페이지 -->
						<li id="page_Services">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"><span></span></a>
									<div class="wrapper pad_bot3">
										<h2>Ticket</h2>

										<!-- 4개의 경기를 TimeScheduleList로 설정 -->
										<div class="TimeScheduleList">
											<div class="items">
												<div class="itemTitle">
													<!-- 경기 시간과 날짜 -->
													<span class="dateNum">06.15</span> <span class="dateTxt">(토)</span>
													<span class="dateNum">19:00</span>
													<!-- 경기장 이름 -->
													<div class="location">
														" 홈 "&nbsp; <span>토트넘 홋스터 스타디움</span>
													</div>
												</div>
												<div class="itemInfo">
													<div class="rr">
														<img src="images/토트넘.png"> <img src="images/vs.gif">
														<img src="images/에버턴.png">
													</div>
													<!-- 경기 이름 -->
													<div style="width: 235px; color: white;">토트넘 VS 에버턴</div>
												</div>
												<div class="itemBtn">
													<!-- 예매하기 버튼 누를시 TicketOK로 3개(name,stadium,date)값을 넘김 -->
													<a href="Home1.jsp#!/page_MoreC"
														onclick="location.href = 'TicketOK.jsp?name=토트넘 vs 에버턴&stadium=토트넘 홋스터 스타디움&date=6월15일(토)'"
														class="btn1 BtnColor_Y">예매하기</a>
												</div>
											</div>
										</div>
										<div class="TimeScheduleList">
											<div class="items">
												<div class="itemTitle">
													<!-- 경기 시간과 날짜 -->
													<span class="dateNum">07.06</span> <span class="dateTxt">(토)</span>
													<span class="dateNum">19:00</span>
													<div class="location">
														<!-- 경기장 이름 -->
														" 홈 "&nbsp; <span>페덱스필드</span>
													</div>
												</div>
												<div class="itemInfo">
													<div class="rr">
														<img src="images/아스널.png"> <img src="images/vs.gif">
														<img src="images/레알마드리드.png">
													</div>
													<!-- 경기 이름 -->
													<div style="width: 235px; color: white;">아스널 VS 레알 마드리드</div>
												</div>
												<div class="itemBtn">
													<!-- 예매하기 버튼 누를시 TicketOK로 3개(name,stadium,date)값을 넘김 -->
													<a href="Home1.jsp#!/page_MoreC"
														onclick="location.href = 'TicketOK.jsp?name=아스널 vs 레알 마드리드&stadium=페덱스필드&date=7월6일(토)'"
														class="btn1 BtnColor_Y">예매하기</a>
												</div>
											</div>
										</div>
										<div class="TimeScheduleList">
											<div class="items">
												<div class="itemTitle">
													<!-- 경기 시간과 날짜 -->
													<span class="dateNum">07.10</span> <span class="dateTxt">(수)</span>
													<span class="dateNum">19:30</span>
													<div class="location">
														<!-- 경기장 이름 -->
														" 홈 "&nbsp; <span>올드 트래퍼드</span>
													</div>
												</div>
												<div class="itemInfo">
													<div class="rr">
														<img src="images/맨유.png"> <img src="images/vs.gif">
														<img src="images/첼시.png">
													</div>
													<!-- 경기 이름 -->
													<div style="width: 235px; color: white;">맨채스터 유나이티드 VS 첼시</div>
												</div>
												<div class="itemBtn">
													<!-- 예매하기 버튼 누를시 TicketOK로 3개(name,stadium,date)값을 넘김 -->
													<a href="Home1.jsp#!/page_MoreC"
														onclick="location.href = 'TicketOK.jsp?name=맨채스터 유나이티드 vs 첼시&stadium=올드 트래퍼드&date=7월10일(수)'"
														class="btn1 BtnColor_Y">예매하기</a>
												</div>
											</div>
										</div>
										<div class="TimeScheduleList"
											style="border-bottom: 1px solid #2f323a;">
											<div class="items">
												<div class="itemTitle">
													<!-- 경기 시간과 날짜 -->
													<span class="dateNum">08.17</span> <span class="dateTxt">(수)</span>
													<span class="dateNum">19:30</span>
													<div class="location">
														<!-- 경기장 이름 -->
														" 홈 "&nbsp; <span>캄 노우</span>
													</div>
												</div>
												<div class="itemInfo">
													<div class="rr">
														<img src="images/바르셀로나.png"> <img src="images/vs.gif">
														<img src="images/리버풀.png">
													</div>
													<!-- 경기 이름 -->
													<div style="width: 235px; color: white;">바르셀로나 VS 리버풀</div>
												</div>
												<div class="itemBtn">
													<!-- 예매하기 버튼 누를시 TicketOK로 3개(name,stadium,date)값을 넘김 -->
													<a href="Home1.jsp#!/page_MoreC"
														onclick="location.href = 'TicketOK.jsp?name=바르셀로나 vs 리버풀&stadium=캄 노우&date=8월17일(수)'"
														class="btn1 BtnColor_Y">예매하기</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>

						<!-- 테이블???? -->
						<li id="page_Contact">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"><span></span></a>
									<h2>Community</h2>
									<center>
										<table style ="width:100%; cellpadding:0; cellspacing: 0; border: 0px">
											<tr height="5">
												<td width="5"></td>
											</tr>
											<tr style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
												<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
												<td width="73">번호</td>
												<td width="379">제목</td>
												<td width="73">작성자</td>
												<td width="164">작성일</td>
												<td width="58">조회수</td>
												<td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
											</tr>
											
											<%
												if(total==0) {
											%>
											
											<tr align="center" bgcolor="#FFFFFF" height="30">
												<td colspan="6">등록된 글이 없습니다.</td>
											</tr>
											
											<%
	 											} else {
	 												for(int i=ROWSIZE*(pg-1); i<end;i++){
														VO vo = alist.get(i);
														indent = vo.getIndent();
														int idx = vo.getNum();
											%>
											
											<tr height="25" align="center">
												<td align="center">&nbsp;</td>
												<td align="center"><%=idx%></td>
												<td align="center">
												
											<% 
											for(int j=0;j<indent;j++){
											%> &nbsp;&nbsp;&nbsp;<%
											}
											if(indent!=0){
												%><img src='images/화살표.png' style="width: 20px; height: 15px;" /> <%
											}
											%> <a href="view.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=vo.getTitle() %></a>
												</td>
												<td align="center"><%=vo.getName()%></td>
												<td align="center"><%=vo.getTime() %></td>
												<td align="center"><%=vo.getHit() %></td>
												<td align="center">&nbsp;</td>
											<tr height="1" bgcolor="#D2D2D2">
												<td colspan="6"></td>
											</tr>
											<% }} %>
											<tr height="1" bgcolor="#82B5DF">
												<td colspan="6" width="752"></td>
											</tr>
										</table>
										<table width="100%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td colspan="4" height="5"></td>
											</tr>
											<tr>
												<td align="center"></td>
											</tr>
											<tr align="center">
												<!-- <td><input type=button value="글쓰기" OnClick="window.location='write.jsp'"></td> -->
											</tr>
										</table>
										<!-- 글쓰기 버튼 -->
										<a href="#!/page_MoreA" class="button1"><span></span><strong>Write</strong></a>
										<!-- 파일 업로드 버튼 -->
										<a href="#!/page_MoreB" class="button1"><span></span><strong>FileUpload</strong></a>
								</div>
							</div>
						</li>

						<!-- 관련기사 링크들 -->
						<li id="page_More1">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"></a>

									<h2>Read More</h2>
									<div class="wrapper pad_bot3">
										<span id="liver"> ▷ '손흥민 2골' 토트넘 챔스 8강 2차전 '올 최고 경기'</span>
										<center>
											<img src="images/azaz.jpg" width="400" height="250" alt="">
											<p>
										</center>
										<h6>손흥민(토트넘 홋스퍼)이 2골을 넣은 토트넘-맨체스터시티전이 영국 언론으로부터 올 시즌 잉글랜드
											프로축구 최고의 경기로 꼽혔다. 17일 오전(한국시간) 영국 매체 스카이스포츠는 올 시즌 최고의 경기, 득점,
											패스, 세리머니 등 ‘베스트 오브 시즌’을 선정했다. 토트넘은 지난달 18일 영국 맨체스터의 에티하드
											스타디움에서 맨체스터시티와 유럽축구연맹(UEFA) 챔피언스리그 8강 2차전을 치렀으며 당시 손흥민은 2득점을
											올리며 승리를 이끌었다. 스카이스포츠는 “멋진 경기로 올 시즌이 가득 찼다”며 “하지만 토트넘이 맨체스터시티를
											꺾은 경기를 1위에서 내리는 건 불가능하다”고 밝혔다. 당시 토트넘은 전반 4분 맨체스터시티에 선제골을
											허용했지만, 손흥민이 전반 7분과 전반 10분 연속 득점을 올려 흐름을 뒤집었다.</h6>
									</div>
									<h6>맨체스터시티는 전반 11분과 전반 21분 골을 추가하는 등 21분 만에 무려 5득점이 터졌다.
										스카이스포츠는 “킥오프 후 20여 분 동안 정신이 없었다”며 “경기 종료 직전 역시 극적이었고, 맨체스터시티가
										득점을 올리며 4강에 오르는 듯했지만 비디오판독으로 골이 인정되지 않았다”고 설명했다. 토트넘은 2차전 원정
										경기에서 3-4로 패했지만 4월 10일 열린 1차전 홈경기에서 1-0으로 이겼기에 원정 다득점에서 3-0으로
										앞서며 4강에 올랐고 준결승마저 통과하고 다음 달 2일 리버풀과 결승전을 치른다.</h6>
									</div>
							</div>
						</li>

						<li id="page_More2">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"></a>

									<h2>Read More</h2>
									<div class="wrapper pad_bot3">
										<span id="liver"> ▷ 손흥민 챔스 결승 선발출전…우승컵은 리버풀에게로</span>
										<center>
											<img src="images/ss.jpg" width="400" height="200" alt="">
											<p>
										</center>
										<h6>손흥민(27·토트넘 홋스퍼)이 박지성 이후 한국 선수로는 두번째로 유럽 챔피언스리그 결승 무대를
											밟았다. 그러나 후반 중반까지는 좀처럼 슈팅 기회를 잡지 못한 채 공격포인트를 올리지 못했고, 토트넘은
											리버풀한테 져 첫 우승 문턱에서 좌절했다. 손흥민으로선 후반 35분께 처음으로 폭발시킨 강력한 오른발슛이
											골키퍼의 선방에 걸린 게 가장 아쉬웠다. 2일 오전(한국시각) 스페인 마드리드의 에스타디오 메트로폴리타노에서
											열린 2018~2019 유럽축구연맹(UEFA) 챔피언스리그 결승전. 잉글랜드 프리미어리그 팀들끼리 우승트로피인
											빅이어(Big Ear)를 놓고 격돌했고, 리버풀이 전반 2분 만에 터진 무함마드 살라흐의 페널티골과 후반
											42분 디보크 오리기의 쐐기골에 힘입어 2-0 승리를 거두며 환호했다. 2004~2005 시즌 우승 이후
											14년 만의 정상 등극이다.</h6>
									</div>
									<h6>
										지난 시즌 레알 마드리드와의 결승전에서 1-3으로 져 빅이어를 놓쳤던 리버풀은 통산 6회 우승 고지에 올랐다.
										이번 시즌 잉글랜드 프리미어리그에서 단 1번만 패하고도 맨체스터 시티에 승점 1점이 뒤져 우승을 놓쳤던 리버풀은
										유럽 클럽축구 정상 등극으로 이번 시즌을 화려하게 마무리하게 됐다. 토트넘은 사상 처음으로 챔피언스리그 결승에
										올랐지만 이번 시즌 잉글랜드 프리미어리그에서 두차례 맞붙어 모두 1-2 패배를 안겨준 리버풀의 벽을 넘지 못하고
										눈물을 흘려야 했다.
										<p>
									</h6>
									<div class="wrapper pad_bot3">
										<center>
											<img src="images/lp.jpg" width="400" height="200" alt=""><br>
											<span id="liver"> [리버풀 선수들이 우승트로피인 ‘빅이어’를 들고 환호하고 있다.]</span>
										</center>
									</div>
								</div>
							</div>
						</li>


						<li id="page_More3">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"></a>

									<h2>Read More</h2>
									<div class="wrapper pad_bot3">
										<span id="liver">▷ 챔스 결승 앞둔 손흥민, 박지성 이후 8년만…축구 새역사 장식할까</span>
										<center>
											<img src="images/qaa.PNG" width="400" height="200" alt="">
											<p>
										</center>
										<h6>손흥민(26·토트넘)이 '축구 천재' 박지성(38)의 뒤를 이어 8년 만에
											유럽축구연맹(UEFA) 챔피언스리그 결승 무대에 진출한다. 토트넘은 9일 오전 4시(한국시간) 네덜란드
											암스테르담 요한크루이프 아레나에서 펼쳐진 2018~19시즌 유럽축구연맹(UEFA) 챔피언스리그 4강 2차전에서
											역전극에 성공해 아약스를 3-2로 이겼다. 전반에만 두 골을 내준 토트넘은 후반 들어 세 골을 연달아 두드리며
											합산 득점 3-3을 만들었고, 원정 다득점 원칙에 따라 챔피언스리그 결승전에 오르게 됐다.</h6>
									</div>
									<h6>
										이로써 토트넘은 구단 창단 이후 최초로 챔피언스리그 결승 무대에 올랐다. 손흥민 역시 생애 최초로 유럽 대항전
										결승 무대를 밟게 됐다. 박지성은 맨체스터 유나이티드 소속으로 2008-09, 2010-11시즌 챔피언스리그
										결승 무대를 밟은 바 있다. 당시 두 번 모두 리오넬 메시(31·바르셀로나)의 FC 바르셀로나를 만난 맨체스터
										유나이티드는 우승컵을 들어올리는데 실패했다. 2007-08 시즌에는 맨체스터 유나이티드가 우승을 거뒀지만
										박지성은 출전하지 않았다.
										<p>
									</h6>
									<div class="wrapper pad_bot3">
										<center>
											<img src="images/손흥민.jpg" width="400" height="200" alt=""><br>

											<span id="liver"> [챔피언스리그 결승 무대에 진출한 손흥민] </span>
										</center>
									</div>
								</div>
							</div>
						</li>


						<li id="page_More4">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"></a>

									<h2>Read More</h2>
									<div class="wrapper pad_bot3">
										<span id="liver">▷ 손흥민 “챔스 결승, 출전이 아니라 우승이 목표였다”</span>
										<center>
											<img src="images/좌절.jpg" width="400" height="200" alt="">
											<p>
										</center>
										<h6>축구대표팀 에이스 손흥민(27ㆍ토트넘)이 간발의 차로 놓인 유럽 챔피언스리그 우승트로피에 대해
											진한 아쉬움을 드러냈다. 실망스런 결과지만, 여기서 멈추지 않고 계속 도전하겠다는 각오도 함께 밝혔다.
											손흥민은 5일 파주 축구대표팀트레이닝센터(이하 파주 NFC)에서 열린 인터뷰에서 챔피언스리그 결승전 출전
											소감을 묻는 취재진의 질문에 “뛰는 게 아니라 이기는 게 꿈이었다”면서 “기대가 컸던 만큼 원하는 결과를 얻지
											못한 실망도 컸다. 트로피가 눈 앞에 있는데 가져오지 못해 안타까웠다”고 말했다. 손흥민은 지난 2일 새벽
											스페인 마드리드에서 열린 올 시즌 유럽축구연맹(UEFA) 챔피언스리그 결승전에 선발 출장해 풀타임을 소화했지만
											상대팀 리버풀에 0-2로 패하며 우승 트로피를 품에 안지 못했다. “지난 1년 간의 모든 순간들이 기억에
											남는다”고 한 시즌을 되돌아 본 그는 “잘한 경기와 못한 경기가 있었고, 좋았던 기간과 그렇지 못한 기간도
											있었다. 응원해주고 지원해준 많은 분들 덕분에 잘 헤쳐나올 수 있었다. 골도 중요하지만 한 시즌을 큰 부상
											없이 잘 치른 것도 중요하고 감사하다”고 말했다. 올 시즌 소속팀과 대표팀을 통틀어 50경기 가까이 출전하며
											혹사 논란의 중심에 선 것과 관련해 손흥민은 “지난 시즌에도 혹사라는 이야기가 나왔다”면서 “그렇게 꾸준히 뛸
											수 있는 선수가 많지 않아 오히려 행복하다. 현재 몸 상태도 나쁘지 않다”고 했다.</h6>
									</div>
									<h6>
										새벽에 열린 20세 이하 축구대표팀 경기를 중간부터 시청했다는 그는 “너무 잘해줘서 고맙다. 선수들이 많이
										고생하고 서로에게 희생한 것 같다”면서 “월드컵이라는 무대에서 8강에 오르는 게 매우 힘들다. 우리 선수들을 더
										자랑스럽게 생각해도 될 것 같다”고 칭찬했다. 이어 “더 잘해서 기왕이면 4강까지, 우승까지 가는 모습을
										보여주면 좋겠다”고 덧붙였다. 최근 스페인 프로축구 명가 레알 마드리드 이적 가능성이 유럽 현지에서 보도된 것에
										대해 손흥민은 “할 말이 없다”고 짧게 답변했다. 이적설에 대해 인정한 것은 아니지만, 강한 부정 또한 피하며
										일말의 여운을 남겨두는 듯한 뉘앙스였다. 6월 두 차례 열리는 A매치와 관련해 “내 역할과 포지션을 정하는 건
										오롯이 감독의 영역이다. 감독이 중앙수비를 보라하면 그대로 따라야 한다”고 언급한 손흥민은 “감독님께서 내
										능력을 활용할 수 있는 자리를 찾아주시는 게 우선이다. 여기에 더해서 나 또한 동료선수들이 잘 할 수 있게
										도와줄 것”이라며 의욕을 보여줬다.
										<p>
									</h6>
									</div>
							</div>
						</li>
						


						<li id="page_More5">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"></a>

									<h2>Read More</h2>
									<div class="wrapper pad_bot3">
										<span id="liver">▷ 발롱도르 주관하는 프랑스 풋볼, 챔스 베스트 11에 손흥민 선정.</span>
										<p>
										<center>
											<img src="images/발롱도르손.jpg" width="200" height="250" alt="">
											<p>
										</center>
										<h6>[베프리포트=정일원 기자] 발롱도르를 주관하는 프랑스 풋볼이 선정한 올 시즌 챔피언스리그 베스트
											11에 토트넘 손흥민이 이름을 올렸다. 3일(현지시간) 프랑스 풋볼은 2018-19 시즌
											유럽축구연맹(UEFA) 챔피언스리그서 맹활약한 11명의 선수들을 선정해 발표했다. 4-3-3 포메이션을
											기반으로 골키퍼 알리송을 비롯해 알렉산더-아놀드, 반 다이크(이상 리버풀), 데 리흐트(아약스),
											알바(바르셀로나)가 백4 수비진으로 이름을 올렸다. 중원에는 파비뉴(리버풀), 반 데 비크, 데 용(이상
											아약스)이 자리했다. 손흥민(토트넘)은 메시(바르셀로나), 마네(리버풀)와 함께 최전방 스리톱으로 선정됐다.
											프랑스 풋볼 측은 “손흥민은 수비적인 기여는 물론, 왼쪽과 오른쪽을 가리지 않고 토트넘의 최전방 공격을
											이끌었다. 맨체스터 시티와의 8강 1, 2차전서 3골을 넣으며 해리 케인의 장기 공백을 무색하게 만들었다”며
											찬사를 아끼지 않았다.</h6>
									</div>

									<div class="wrapper pad_bot3">
										<center>
											<img src="images/best.png" width="400" height="200" alt=""><br>
											<span id="liver"> [프랑스 풋볼이 선정한 2018-19 시즌 챔피언스리그 베스트 11] </span>
										</center>
									</div>
								</div>
							</div>
						</li>


						<li id="page_More6">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"></a>

									<h2>Read More</h2>
									<div class="wrapper pad_bot3">
										<span id="liver">▷ 챔스 마친 손흥민, 호주 평가전도 선발 출격…황희찬과 투톱</span>
										<p>
										<center>
											<img src="images/손황.jpg" width="500" height="350" alt="">
											<p>
										</center>
										<h6>[아시아경제 김흥순 기자] 유럽축구연맹(UEFA) 챔피언스리그 준우승 이후 곧바로 축구대표팀에
											합류한 손흥민(토트넘)이 호주와의 친선경기에서도 공격의 선봉에 나선다. 파울루 벤투 축구대표팀 감독은 7일
											부산아시아드 주경기장에서 열리는 호주와의 평가전에 손흥민과 황희찬(잘츠부르크)을 투톱으로 구성한 3-5-2
											전술을 꺼내들었다. 손흥민은 소속팀에서 지난 2일 리버풀과의 2018~2019 UEFA 챔피언스리그 결승전을
											마치고 4일 대표팀에 합류하는 빡빡한 일정에도 변함 없이 선발로 그라운드를 누빈다. 3월 A매치 2연전에 이어
											다시 대표팀의 스트라이커 임무를 받았다. 이날 우리 대표팀 중원에서는 황인범(밴쿠버)과 이재성(홀슈타인 킬)이
											호흡을 맞춘다. 주세종(아산)은 수비형 미드필더로 뒤를 받친다. 좌우 윙백은 김진수(전북)와 김문환(부산)이
											자리하고, 수비는 권경원(톈진)-김영권(감바 오사카)-김민재(베이징 궈안)가 맡는다. 골문은 김승규(빗셀
											고베)가 지킨다.</h6>
									</div>
								</div>
							</div>
						</li>
						<!-- 관련기사 링크 끝 -->


						<!-- 파일 업로드 파트 -->
						<li id="page_MoreB">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"></a>
									<h2>Upload File</h2>
									<div class="wrapper pad_bot3">
										<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
											파일 : <input type="file" name="file"><br> 
											<input type="submit" value="업로드"><br>
										</form>
										<br> <a href="fileDownload.jsp">파일 업로드 페이지</a>
									</div>
								</div>	
							</div>
						</li>
						<!-- 파일 업로드 파트 끝 -->

						<!-- 좌석 예약 페이지  -->
						<li id="page_MoreC">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"></a>


									<h2>좌석 선택</h2>
									<div class="TimeScheduleList">
										<div class="items">
											<div class="itemTitle">
												<span class="dateNum">06.07</span> <span class="dateTxt">(금)</span>
												<span class="dateNum">10:00</span>
												<div class="location">
													" 홈 &nbsp;" <span>부산아시아드주경기장</span>
												</div>
											</div>
											<div class="itemInfo">
												<div class="rr">
													<img src="images/아스널.png"> <img src="images/vs.gif">
													<img src="images/레알마드리드.png">
												</div>
												<div style="width: 235px; color: white;">아스널 VS 레알 마드리드
												</div>
											</div>
										</div>
									</div>

									<div class="panel panel-primary"
										style="width: 91%; margin: 0px auto;">
										<div class="panel-heading">
											<h3 class="panel-title">
												<span class="glyphicon glyphicon-ok"></span> &nbsp;&nbsp;좌석
												선택
											</h3>
										</div>

										<div class="panel-body">
											<div class="media" style="height: 600px;">

												<!-- 체크박스 배치 (좌석) -->
												<!-- ABCD 4구역으로 나눠서 for문 사용 -->
												<% 
				//A구역
				out.print("<table style='margin-left: 46px;'>");
				for(int i=1;i<=40;i++){
					if(i%10==1)
						out.print("<tr><label><td><input type='checkbox' name='chckbxColors' value='A"+ i +"'></td><td>A"+ i +"</td></label>");
					else
						out.print("<label><td><input type='checkbox' name='chckbxColors' value='A"+ i +"'></td><td>A"+ i +"</td></label>");
				}
				out.print("</table>");
				%>
												<br>
												<% 
				//B구역
				out.print("<table style='position: absolute; margin-left: -70px; margin-top: -28px;'>");
				for(int i=1;i<=36;i++){
					if(i%3==1)
						out.print("<tr><label><td><input type='checkbox' name='chckbxColors' value='B"+ i +"'></td><td>B"+ i +"</td></label>");
					else
						out.print("<label><td><input type='checkbox' name='chckbxColors' value='B"+ i +"'></td><td>B"+ i +"</td></label>");
				}
				out.print("</table>");
				%>
												<br>
												<div>
													<!-- 운동장 이미지 -->
													<img alt="ground" src="images/Filed.jpg" 
													style="height: 250px; width: auto; margin-top: -28px; margin-left: 85px;">
												</div>
												<br>
												<% 
				//C구역
				out.print("<table style='position: absolute; margin-left: 490px; margin-top: -270px; '>");
				for(int i=1;i<=36;i++){
					if(i%3==1)
						out.print("<tr><label><td><input type='checkbox' name='chckbxColors' value='D"+ i +"'></td><td>D"+ i +"</td></label>");
					else
						out.print("<label><td><input type='checkbox' name='chckbxColors' value='D"+ i +"'></td><td>D"+ i +"</td></label>");
				}
				out.print("</table>");
				%>
												<% 
				//D구역
				out.print("<table style='margin-left: 46px;'>");
				for(int i=1;i<=40;i++){
					if(i%10==1)
						out.print("<tr><label><td><input type='checkbox' name='chckbxColors' value='C"+ i +"'></td><td>C"+ i +"</td></label>");
					else
						out.print("<label><td><input type='checkbox' name='chckbxColors' value='C"+ i +"'></td><td>C"+ i +"</td></label>");
				}
				out.print("</table>");
				%>
												<!-- form문으로 값을 보냄 -->
												<div class="itemBtn">
													<form action="TicketingOK.jsp" name="myForm" method="post">
														<input type="hidden" id="output" name="output" /> <input
															type="hidden" id="input" name="input" />
														<!-- 버튼에 jquery를 사용 (아래)-->
														<input type="submit" value="좌석 선택 완료"
															id="btnCheckedNumber" class="btn1 BtnColor_Y" />
													</form>
												</div>
											</div>
										</div>
									</div>

									<!-- jquery  -->
									<script type="text/javascript">
										$(document).ready(function() {
											//id가 btnCheckdNumber인 태그 클릭시 id가 output,input의 텍스트를 삭제
											$('#btnCheckedNumber').click(function() {
												$('#output').text('');
												$('#input').text('');
											});
									
											//id가 btnCheckdNumber인 태그 클릭시 id가 output인 값에 전체 체크박스 중 체크 된 숫자를 value값으로 삽입
											$('#btnCheckedNumber').click(function() {
												var num = $('input[name="chckbxColors"]:checked').length;
												$('#output').val(num);
											});
										
											//id가 btnCheckdNumber인 태그 클릭시 체크 되있는 value 값을 input value값에 삽입
											$('#btnCheckedNumber').click(function() {
												var str = "";
												$('input[name="chckbxColors"]:checked').each(function() {
													var value = $(this).val();
													str += value + ", ";
												});
												$('#input').val(str);
												//메세지 띄우기
												alert('예매가 완료되었습니다!');
											});
										});
									</script>
								</div>
							</div>
						</li>

						<!-- ???? -->
						<li id="page_MoreA">
							<div class="box1">
								<div class="inner">
									<a href="#" class="close" data-type="close"><span></span></a>
									<div class="wrapper">
										<div class="col1">
											<h2>Contact Info</h2>
											<p>I love Soccer</p>
											부산광역시 부산진구 양정동 양지로 54<br>
											<p class="cols">
												Telephone:<br> Email:
											</p>
											<p>
												+82 010 6318 9098<br> <a href="mailto:" class="link1">qkrtjswo03@naver.com</a>
											</p>

											부산광역시 부산진구 양정동 양지로 54<br>
											<p class="cols">
												Telephone:<br> Email:
											</p>
											<p>
												+82 010 4952 9883<br> <a href="mailto:" class="link1">rusb0315@naver.com</a>
											</p>
											부산광역시 부산진구 양정동 양지로 54<br>
											<p class="cols">
												Telephone:<br> Email:
											</p>
											<p>
												+82 010 5541 0671<br> <a href="mailto:" class="link1">dhdh0671@naver.com</a>
											</p>
										</div>
										<div class="col1 pad_left1">
											<h2>Our Location</h2>
											<figure>
												<img src="images/학교.PNG" width="380" height="230" alt="...">
												<!-- <iframe width="280" height="210" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Brooklyn,+New+York,+NY,+United+States&amp;aq=0&amp;sll=37.0625,-95.677068&amp;sspn=61.282355,146.513672&amp;ie=UTF8&amp;hq=&amp;hnear=Brooklyn,+Kings,+New+York&amp;ll=40.649974,-73.950005&amp;spn=35.166208,129.072461&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe> -->
											</figure>
										</div>
									</div>
									<h2>Board Form</h2>

									<table>
										<center>
											<form name=writeform method=post action="write_ok.jsp">
												<tr>
													<td>
														<table width="100%" cellpadding="0" cellspacing="0"
															border="0">
															<tr
																style="background: url('img/중1.gif') repeat-x; text-align: center;">
																<td width="5"><img src="img/왼1.gif" width="5"
																	height="30" /></td>
																<td>글쓰기</td>
																<td width="5"><img src="img/오1.gif" width="5"
																	height="30" /></td>
															</tr>
														</table>
														<table>
															<tr>
																<td>&nbsp;</td>
																<td align="center">제목</td>
																<td><input name="title" size="50" maxlength="100"></td>
																<td>&nbsp;</td>
															</tr>
															<tr height="3" bgcolor="#dddddd">
																<td colspan="4"></td>
															</tr>
															<tr>
																<td>&nbsp;</td>
																<td align="center">이름</td>
																<td><input name="name" size="50" maxlength="50"></td>
																<td>&nbsp;</td>
															</tr>
															<p>
															<tr height="3" bgcolor="#dddddd">
																<td colspan="4"></td>
															</tr>
															<tr>
																<td>&nbsp;</td>
																<td align="center">비밀번호</td>
																<td><input name="password" size="50" maxlength="50"></td>
																<td>&nbsp;</td>
															</tr>
															<tr height="3" bgcolor="#dddddd">
																<td colspan="4"></td>
															</tr>
															<tr>
																<td>&nbsp;</td>
																<td align="center">내용</td>
																<td><textarea name="memo" cols="52" rows="13"></textarea></td>
																<td>&nbsp;</td>
															</tr>
															<tr height="4" bgcolor="#dddddd">
																<td colspan="5"></td>
															</tr>
															<tr height="4" bgcolor="#82B5DF">
																<td colspan="5"></td>
															</tr>
														</table>
													</td>
												</tr>
											</form>
									</table>
									</center>

									<div class="wrapper">
										<span>&nbsp;</span>
										<center>
											<a href="#" class="button1"
												OnClick="javascript:writeCheck();"><span></span><strong>Send</strong></a>
											<a href="#!/page_More" class="button1"
												OnClick="javascript:history.back(-1)"><span></span><strong>Cancel</strong></a>
										</center>
									</div>

								</div>
							</div>
						</li>



					</ul>
				</article>
				<!-- / content -->
			</div>
		</div>
		<P>
			
			
			
			<div class="block"></div>
		</div>
		<div class="bg1">
			<div class="main">
<!-- footer -->

				<footer>
					<div class="bg_spinner"></div>
					<ul class="pagination">
						<li class="current"><a href="images/호날두.jpg">1</a></li>
						<li><a href="images/손흥민.jpg">2</a></li>
						<li><a href="images/메시.jpg">3</a></li>
					</ul>
					<div class="col_1">
						<a href="Home1.jsp" id="Exordium" >EXORDIUM</a> Copyright 2019
					</div>
					
				</footer>

				
				
<!-- / footer-->
			</div>
		</div>
		<script type="text/javascript"> Cufon.now(); </script>
		
		<script>
		$(window).load(function() {
			$('.spinner').fadeOut();
			$('body').css({overflow:'inherit'})
		})
		</script>
	</body>
</html>