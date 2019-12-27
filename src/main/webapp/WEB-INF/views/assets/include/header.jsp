<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <nav class="navbar menu_navbar bg-white">
			<!--<div class="navbar-header menu_header">-->
			<a class="navbar-brand logo" href="index.do"> <img alt="Brand"
				src="${pageContext.request.contextPath}/assets/img/main_logo.jpg"
				width="65px" height="40px">
			</a>
			<p class="navbar-text navbar-left">
				<a href="index.do" class="navbar-link" style="text-decoration: none">상가</a>
			</p>
			<p class="navbar-text navbar-left">
				<a href="bigdata.do" class="navbar-link"
					style="text-decoration: none">상권분석</a>
			</p>

			<c:choose>
				<c:when test="${userType == 0}">
					<p class="navbar-text navbar-right">
						<a href="logout.do" class="navbar-link" style="text-decoration: none; font-size: 12px;">로그아웃</a>
					</p>
					<p class="navbar-text navbar-right">
						<a href="#" class="navbar-link" style="text-decoration: none">관리자 님</a>
					</p>
					<p class="navbar-text navbar-right">
						<a href="Admin.do" class="navbar-link"
							style="text-decoration: none">관리자페이지</a>
					</p>
				</c:when>
				<c:when test="${userType == 1}">
					<p class="navbar-text navbar-right">
						<a href="logout.do" class="navbar-link" style="text-decoration: none; font-size: 12px;">로그아웃</a>
					</p>
					<p class="navbar-text navbar-right">
						<a href="ge_infochange.do" class="navbar-link" style="text-decoration: none; font-size: 12px;">정보수정</a>
					</p>
					<p class="navbar-text navbar-right">
						<a href="#" class="navbar-link" style="text-decoration: none">${userName} 님</a>
					</p>
					<p class="navbar-text navbar-right">
						<a href="geMaemulInterest" class="navbar-link"
							style="text-decoration: none">관심매물</a>
					</p>
				</c:when>
				<c:when test="${userType == 2}">
					<p class="navbar-text navbar-right">
						<a href="logout.do" class="navbar-link" style="text-decoration: none; font-size: 12px;">로그아웃</a>
					</p>
					<p class="navbar-text navbar-right">
						<a href="ge_infochange.do" class="navbar-link" style="text-decoration: none; font-size: 12px;">정보수정</a>
					</p>
					<p class="navbar-text navbar-right">
						<a href="#" class="navbar-link" style="text-decoration: none">${userName}</a>
					</p>
					<p class="navbar-text navbar-right">
						<a href="maemul_manage_do" class="navbar-link"
							style="tex1t-decoration: none">매물관리</a>
					</p>
					<p class="navbar-text navbar-right">
						<a href="coApproval" class="navbar-link"
							style="text-decoration: none">매물등록</a>
					</p>
				</c:when>
				<c:otherwise>
					<p class="navbar-text navbar-right">
						<a href="Joinus_select.do" class="navbar-link"
							style="text-decoration: none">회원가입</a>
					</p>
					<p class="navbar-text navbar-right">
						<a href="#myModal" data-toggle="modal" class="navbar-link"
							style="text-decoration: none">로그인</a>
					</p>
		</c:otherwise>
	</c:choose>
	<!-- JSTL : 사용자 타입별 메뉴 변환 구현 191203 : 이재민 : END-->
</nav>