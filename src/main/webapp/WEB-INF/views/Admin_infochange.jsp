<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>중개사 회원정보 수정</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/Admin_infochange.css">



</head>

<style type="text/css">
.logo {
	margin-left: 30px;
}

.menu_navbar {
	width: 100%;
	padding-right: 40px;
	margin-bottom: 0;
	line-height: 45px;
}

.navbar-text {
	font-size: 20px;
	font-weight: bold;
}

.navbar-right {
	font-size: 15px;
}

.content {
	height: 100%;
	width: 100%;
	background: #eee;
}

.footer {
	width: 100%;
	height: 320px;
	background: #333;
}

.modal-dialog.mymodal-size {
	width: 400px;
	height: 360px;
}

.mymodal-content {
	width: 100%;
	height: 100%;
}

.loginmodal-title {
	text-align: center;
	margin-top: 20px;
}

.modal form {
	margin-top: 20px;
}

.modal .input-container {
	margin-bottom: 10px;
	text-align: center;
}

.modal .input-info {
	width: 270px;
	display: inline-block;
}

.modal .forgot-pw input {
	margin-left: 50px;
}

.modal .forgot-pw span {
	margin-left: 90px;
}

.loginbtn {
	margin-top: 30px;
	display: inline-block;
	width: 270px;
}
</style>
<body>
	<!-- 상단 메뉴 바 -->
	<%@ include file="assets/include/header.jsp" %>
	<!--  로그인 Modal -->
	<%@ include file="assets/include/loginmodal.jsp" %>

	<!-- 컨텐츠 -->
	<div class="content">
		<div class="body-content">
			<div class="main-space">
				<div class="container">
					<div class="page-title text-center">
						<h2 class="title">공인중개사 회원정보</h2>
					</div>
					<div class="main-content">
						<form id="changeform" name="changeform" class="form-inline"
							role="form" method="post" action="#">
							<div class="panel panel-default">
								<ul class="list-group">
									<li class="list-group-item first-list">
										<div class="first-title">
											<strong>공인중개사정보</strong>
										</div>
										<table class="table table-1">
											<tbody>
												<tr>
													<th class="active"><span class="left-name">중개사무소명</span></th>
													<td><input type="text" class="form-control" id="co_name" name="co_name"	style="width: 350px; height: 50px;"
													value="${co_UserInfo.co_name}"></td>
												</tr>
												<tr>
													<th class="active"><span class="left-name">중개사 등록번호</span></th>
													<td><input type="text" class="form-control sg-form-control-md" id="co_number"
														name="co_number" style="width: 350px; height: 50px;" value="${co_UserInfo.broker_num}">
														<a href="${pageContext.request.contextPath}/download.do?file=${ceoImgfilepath}" download="중개사등록증">
															<button type="button" class="download_Img btn btn-primary btn-lg" id="download_ceoImg"
															style="width: 300px; height: 50px">
															<!--<a href="${pageContext.request.contextPath}/download.do?file=15760390673420.jpg" download>-->중개사등록증 다운로드
															</button>
														</a>
													</td>
												</tr>
												<tr>
													<th class="active"><span class="left-name">사업자 등록번호</span></th>
													<td><input type="text"
														class="form-control sg-form-control-md" id="coe_number"
														name="coe_number" style="width: 350px; height: 50px;" value="${co_UserInfo.office_num}">
														<a href="${pageContext.request.contextPath}/download.do?file=${coImgfilepath}" download="사업자등록증">
															<button type="button" class="download_Img btn btn-primary btn-lg" id="download_coImg"
															style="width: 300px; height: 50px">사업자등록증 다운로드</button>
														<!--
														<button type="button" class="btn btn-primary btn-lg" id="coe_image"
														name="coe_image" style="display: none;" value ="사업자등록증 다운로드">ㄴㅁㅇㅁㅇㄴ</button>
														</td> -->
														</a>
												</tr>
												<tr>
													<th class="active"><span class="left-name">중개사무소
															주소</span></th>
													<td>
														<div id="kakaomap">
															<input type="text" id="sample2_postcode"
																placeholder="우편번호"> <input type="button"
																onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
															<input type="text" id="sample2_address" placeholder="주소" value="${co_UserInfo.office_addr}"><br>
															<input type="text" id="sample2_detailAddress"
																placeholder="상세주소"> <input type="text"
																id="sample2_extraAddress" placeholder="참고항목">
														</div> <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
														<div id="layer"
															style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
															<!--<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼"> -->
														</div> <script
															src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
														<script>
															// 우편번호 찾기 화면을 넣을 element
															var element_layer = document
																	.getElementById('layer');

															function closeDaumPostcode() {
																// iframe을 넣은 element를 안보이게 한다.
																element_layer.style.display = 'none';
															}

															function sample2_execDaumPostcode() {
																new daum.Postcode(
																		{
																			oncomplete : function(
																					data) {
																				// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

																				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
																				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
																				var addr = ''; // 주소 변수
																				var extraAddr = ''; // 참고항목 변수

																				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
																				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																					addr = data.roadAddress;
																				} else { // 사용자가 지번 주소를 선택했을 경우(J)
																					addr = data.jibunAddress;
																				}

																				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
																				if (data.userSelectedType === 'R') {
																					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
																					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
																					if (data.bname !== ''
																							&& /[동|로|가]$/g
																									.test(data.bname)) {
																						extraAddr += data.bname;
																					}
																					// 건물명이 있고, 공동주택일 경우 추가한다.
																					if (data.buildingName !== ''
																							&& data.apartment === 'Y') {
																						extraAddr += (extraAddr !== '' ? ', '
																								+ data.buildingName
																								: data.buildingName);
																					}
																					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
																					if (extraAddr !== '') {
																						extraAddr = ' ('
																								+ extraAddr
																								+ ')';
																					}
																					// 조합된 참고항목을 해당 필드에 넣는다.
																					document
																							.getElementById("sample2_extraAddress").value = extraAddr;

																				} else {
																					document
																							.getElementById("sample2_extraAddress").value = '';
																				}

																				// 우편번호와 주소 정보를 해당 필드에 넣는다.
																				document
																						.getElementById('sample2_postcode').value = data.zonecode;
																				document
																						.getElementById("sample2_address").value = addr;
																				// 커서를 상세주소 필드로 이동한다.
																				document
																						.getElementById(
																								"sample2_detailAddress")
																						.focus();

																				// iframe을 넣은 element를 안보이게 한다.
																				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
																				element_layer.style.display = 'none';
																			},
																			width : '100%',
																			height : '100%',
																			maxSuggestItems : 5
																		})
																		.embed(element_layer);

																// iframe을 넣은 element를 보이게 한다.
																element_layer.style.display = 'block';

																// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
																initLayerPosition();
															}

															// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
															// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
															// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
															function initLayerPosition() {
																var width = 300; //우편번호서비스가 들어갈 element의 width
																var height = 400; //우편번호서비스가 들어갈 element의 height
																var borderWidth = 5; //샘플에서 사용하는 border의 두께

																// 위에서 선언한 값들을 실제 element에 넣는다.
																element_layer.style.width = width
																		+ 'px';
																element_layer.style.height = height
																		+ 'px';
																element_layer.style.border = borderWidth
																		+ 'px solid';
																// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
																element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
																		+ 'px';
																element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
																		+ 'px';
															}
														</script>
													</td>
												</tr>
												<tr>
													<th class="active"><span class="left-name">중개사	대표명</span></th>
													<td><input type="text" class="form-control"
														id="coe_name" name="coe_name"
														style="width: 350px; height: 50px;" value="${co_UserInfo.boss_name}"></td>
												</tr>
												<tr>
													<th class="active"><span class="left-name">중개사
															대표번호</span></th>
													<td>
														<div class="coe_Telephone">
															<input class="form-control" id="coe_Telephone1"
																name="coe_Telephone1" style="width: 350px; height: 50px;" value="${co_UserInfo.tel}">
														</div> <!-- coe Telphone end -->
													</td>
												</tr>
												<tr>
													<th class="active"><span class="left-name">대표사진</span></th>
													<td><img src="${pageContext.request.contextPath}/download.do?file=${co_UserInfo.broker_img}" class="coe_image"></td>
												</tr>
											</tbody>
										</table>
									</li>
									<li class="list-group-item second-list">
										<div class="second-title">
											<strong>개인정보</strong>
										</div>
										<table class="table table-2">
											<tbody>
												<tr>
													<th class="active"><span class="left-name">이름</span></th>
													<td><input type="text" class="form-control"
														id="P_name" name="P_name"
														style="width: 350px; height: 50px;" value="${co_UserInfo.assi_name}"></td>
												</tr>
												<tr>
													<th class="active"><span class="left-name">직급/직책</span></th>
													<td><input class="form-control" id="position"
														name="position" style="width: 350px; height: 50px;">
													</td>
												</tr>
												<tr>
													<th class="active"><span class="left-name">이메일</span></th>
													<td>
														<div class="set_email">
															<input type="text" class="form-control" id="set_email01"
																name="set_email01" style="width: 350px; height: 50px;" value="${co_UserInfo.email_id}">
														</div> <!-- set_email -->
													</td>
												</tr>
												<tr>
													<th class="active"><span class="left-name">휴대폰
															번호</span></th>
													<td>
														<div class="PhoneNumber">
															<input class="form-control" id="phoneNumber1"
																name="phoneNumber1" style="width: 350px; height: 50px;">
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</li>
								</ul>
							</div>
							<!-- end panel -->
							<div class="Go text-center">
								<button type="button" class="btn btn-primary btn-lg accept"
									id="accept" style="width: 150px; height: 60px;">승인</button>
								<button type="button" class="btn btn-primary btn-lg"
									id="delete" style="width: 150px; height: 60px;">비승인</button>
							</div>
						</form>
					</div>
				</div>
				<!-- end container -->
			</div>
		</div>
		<!-- Footer -->
		<div class="footer"></div>
		<!-- Footer END -->


	</div>
	<!-- end content -->

	<!-- Google CDN 서버로부터 jquery 참조 -->
	<script	src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- jquery ajax setup -->
	<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<!-- 핸들바 템플릿 코드 -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>

	<script type="text/javascript">

		var id = ${co_UserInfo.id};
		console.log(id);
		/*
		//중개사 등록증 다운로드
		$("#download_ceoImg").click(function(){
			$.ajax({
				type : "POST",
				url : "ceoImgDownload",
				dataType : "text",
				data : {
					"id": id
				},
				success : function(data) {
					console.log(data);
				}
			});
		});

		//사업자 등록증 다운로드
		$("#download_coImg").click(function(){
			$.ajax({
				type : "POST",
				url : "coImgDownload",
				dataType : "text",
				data : {
					"id": id
				},
				success : function(data) {
					console.log(data);
				}
			});
		});
		*/
		$("#accept").click(function() {
			 $.ajax({
					type : "POST",
					url : "Admin_approval_ok",
					dataType : "text",
					data : {
						"id": id
					},
					success : function(data) {
						alert("승인 되었습니다.");
						location.href="Admin.do";
					}
				});
		});

		 $("#delete").click(function() {
			 $.ajax({
					type : "POST",
					url : "Admin_approval_no",
					dataType : "text",
					data : {
						"id": id
					},
					success : function(data) {
						alert("비승인 되었습니다.");
						location.href="Admin.do";
					}
				});
		});


		//핸드폰 번호 형식 변경 xxx-xxxx-xxxx
		var tel_num = "${co_UserInfo.tel_num}";

		var tel_num1 = tel_num.substring(0,3);
		var tel_num2 = tel_num.substring(3,7);
		var tel_num3 = tel_num.substring(7);
		var full_telnum = tel_num1 + "-" + tel_num2 + "-" + tel_num3;
		$("#phoneNumber1").val(full_telnum);

		//전화번호 형식 변경 xx-xxx-xxxx
		var tel = "${co_UserInfo.tel}";

		var tel1 = tel.substring(0,2);
		var tel2 = tel.substring(2,5);
		var tel3 = tel.substring(5);
		var full_tel = tel1 + "-" + tel2 + "-" + tel3;
		$("#coe_Telephone1").val(full_tel);

		//position 문자열 변환
		var position = "${co_UserInfo.position}"
		if (position == "A"){
			position = "대표공인중개사";
		} else if (position == "B") {
			position = "소속공인중개사";
		} else {
			position = "중개보조원";
		}
		$("#position").val(position);





	</script>

</body>
</html>
