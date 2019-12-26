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

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/Login.css" />

</head>

<body>
	<!--------------------------- 복사하여 사용 하세요 ---------------------------->
	<!-- 상단 메뉴 바 -->
	<%@ include file="assets/include/header.jsp" %>
	<!--  로그인 Modal -->
	<%@ include file="assets/include/loginmodal.jsp" %>	
	<!-- 컨텐츠 -->
	<div class="content">

		<div class="container content-container">
			<div class="content-top">
				<h2>로그인</h2>
				<p>세모에 오신것을 환영합니다.</p>
			</div>
			<div class="content-body">
				<div class="loginDiv">
					<div class="emailLogin">이메일 로그인</div>
					<form action="${pageContext.request.contextPath}/login" id="loginForm" method="POST">
						<div class="input-login1">
							<input type="text" class="form-control input-info email" id="email"
								name="userId" placeholder="이메일" required/>
						</div>
						<div class="input-login2">
							<input type="password" class="form-control input-info password"
								id="password" name="userPw" placeholder="패스워드" required/>
						</div>
						<div class="forgot-pw1">
							<input type="checkbox" /> &nbsp;자동 로그인 <span> <a href="Pw_change.do"
								style="text-decoration: none">비밀번호 찾기</a>
							</span>
						</div>
						<div class="input-container1">
							<input type="submit" class="btn btn-primary loginbutton" id="loginbutton"
								data-dismiss="modal" value="이메일 로그인" />
						</div>
					</form>
					<div class="adduserBtn">
						<button type="button" id="btn1" class="btn btn-default btn1">일반 회원가입</button>
						<button type="button" id="btn2" class="btn btn-default btn2">중개사 회원가입</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- 컨텐츠  END -->

	<!-- Footer -->
	<div class="footer"></div>
	<!-- Footer END -->

	<!--------------------------- 복사하여 사용 하세요  END---------------------------->


	<script
		src="${pageContext.request.contextPath}/assets/js/regex/regex.js"></script>
	<!--   한글 입력 유효성 체크를 위한 regex2 추가 -->
	<script
		src="${pageContext.request.contextPath}/assets/js/regex/regex2.js"></script>
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script type="text/javascript">
		$(function(){
			
			$('#btn1').click(function(){
				location.href = 'Joinus_general.do';
			});
			$('#btn2').click(function(){
				location.href = 'Joinus_company.do';
			});
			//이메일 형식 유효성 검사
			$('.email').blur(function(){
				
				var email = $('.email').val();
				var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if(exptext.test(email)==false){
							
					alert('이메일 형식을 확인해 주세요.');
					return false;
				}	
				
			});
		
		});
		
		
	

	
	</script>
	

</body>
</html>