<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog mymodal-size">
		<div class="modal-content mymodal-content">
			<div class="modal-body mymodal-body">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h2 class="modal-title loginmodal-title" id="myModalLabel">로그인</h2>
				<form action="${pageContext.request.contextPath}/login" id="loginForm" method="POST">
					<div class="input-container">
						<input type="text" class="form-control input-info" id="email" name="userId" placeholder="이메일" />
					</div>
					<div class="input-container">
						<input onkeypress="if( event.keyCode == 13 ){searchData();}" type="password" class="form-control input-info" id="password" name="userPw" placeholder="패스워드" />
					</div>
					<div class="forgot-pw">
						<input type="checkbox" /> &nbsp;자동 로그인  <span> 
							<a href="Pw_change.do" style="text-decoration: none">비밀번호 찾기</a>
						</span>
					</div>
					<div class="input-container">
						<input type="button" class="btn btn-primary loginbtn" data-dismiss="modal" value="이메일 로그인" onclick="form.submit()"/>
					</div>
				</form>
				<span class="adduser">아직 세모의 회원이 아니신가요?<a href="Joinus_select.do">회원가입</a></span>
			</div>
		</div>
	</div>
</div>