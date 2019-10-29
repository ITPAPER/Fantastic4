<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>세모 - 상가 매물 중개 사이트</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/Admin.css" />


</head>
<body>
	<!--------------------------- 복사하여 사용 하세요 ---------------------------->
	<!-- 상단 메뉴 바 -->
	<nav class="navbar menu_navbar bg-white">
		<!--<div class="navbar-header menu_header">-->
		<a class="navbar-brand logo" href="Main.jsp"> <img alt="Brand"
			src="img/main_logo.jpg" width="65px" height="40px">
		</a>
		<p class="navbar-text navbar-left">
			<a href="Main.jsp" class="navbar-link" style="text-decoration: none">상가</a>
		</p>
		<p class="navbar-text navbar-left">
			<a href="Bigdata.jsp" class="navbar-link"
				style="text-decoration: none">상권분석</a>
		</p>
		<p class="navbar-text navbar-right">
			<a href="Joinus_select.jsp" class="navbar-link"
				style="text-decoration: none">회원가입</a>
		</p>
		<p class="navbar-text navbar-right">
			<a href="#myModal" data-toggle="modal" class="navbar-link"
				style="text-decoration: none">로그인</a>
		</p>
	</nav>

	<!-- 상단 메뉴 바  -->


	<!--  로그인 Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog mymodal-size">
			<div class="modal-content mymodal-content">
				<div class="modal-body mymodal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 class="modal-title loginmodal-title" id="myModalLabel">로그인</h2>
					<form action="#" method="post">
						<div class="input-container">
							<input type="text" class="form-control input-info" id="email"
								name="email" placeholder="이메일" />
						</div>
						<div class="input-container">
							<input type="password" class="form-control input-info"
								id="password" name="password" placeholder="패스워드" />
						</div>
						<div class="forgot-pw">
							<input type="checkbox" />&nbsp;자동 로그인 <span> <a href="#"
								style="text-decoration: none">비밀번호 찾기</a>
							</span>
						</div>
						<div class="input-container">
							<input type="submit" class="btn btn-primary loginbtn"
								data-dismiss="modal" value="이메일 로그인" />
						</div>
					</form>
					<span class="adduser">아직 세모의 회원이 아니신가요?<a
						href="Joinus_select">회원가입</a></span>
				</div>
			</div>
		</div>
	</div>



	<!-- 컨텐츠 -->
	<div class="content">
		<div class="container content-container">
			<div class="content-top">
				<h2>관리자 페이지</h2>
				<p>관리자 페이지 입니다.</p>
			</div>
			<div class="content-body">
				<ul class="nav nav-tabs nav-justified" role="tablist">
					<li role="presentation" class="active"><a href="#first" role="tab" data-toggle="tab" aria-controls="general">일반
							회원 정보</a></li>
					<li role="presentation"><a href="#second" role="tab" data-toggle="tab" aria-controls="company">중개사 회원 정보</a></li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade active in" id="first">
						<table class="table" id="table1">
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>가입일</th>
								<th>최근로그인</th>
							</tr>
							<tr>
								<th>0001</th>
								<td>이재민</td>
								<td>010-5233-8467</td>
								<td>inbeast@naver.com</td>
								<td>2019-10-22</td>
								<td>2019-10-22</td>
							</tr>
						</table>
					
					<div class="input-group searchBox">
						<form method="post" action="#">
							<div class="input-group">
							  <input type="text" class="form-control search" placeholder="검색 키워드를 입력하세요!" name="search">
							  <span class="input-group-btn">
							    <button class="btn btn-primary" type="submit">찾기</button>
							  </span>
							</div>
						</form>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="second">
					<table class="table" id="table2">
							<tr>
								<th>번호</th>
								<th>중개사무소명</th>
								<th>대표자</th>
								<th>연락처</th>
								<th>가입일</th>
								<th>최근로그인</th>
							</tr>
							<tr>
								<th>0001</th>
								<td><a href="Admin_infochange.jsp" style="text-decoration:none">이젠부동산</a></td>
								<td>장상윤</td>
								<td>010-4685-7666</td>
								<td>2019-10-22</td>
								<td>2019-10-22</td>
							</tr>
						</table>
						<div class="input-group searchBox">
						<form method="post" action="#">
							<div class="input-group">
							  <input type="text" class="form-control search2" placeholder="검색 키워드를 입력하세요!" name="search">
							  <span class="input-group-btn">
							    <button class="btn btn-primary" type="submit">찾기</button>
							  </span>
							</div>
						</form>
					</div>   
					</div>
				</div>
				
				<div class="paginavi">
					<nav>
						<ul class="pagination adminPagi">
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>	
			</div>
		</div>
	</div>
	
	
	




	<!-- 컨텐츠  END -->
	<!-- Footer -->
	<div class="footer"></div>
	<!-- Footer END -->

	<!--------------------------- 복사하여 사용 하세요  END---------------------------->


	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		
	</script>


</body>
</html>