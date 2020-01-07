<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>세모- 상가 중개사이트</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/Co_infochange.css">

</head>

<style type="text/css">
	.logo {
	margin-left: 30px;
}

.menu_navbar {
	width: 100%;
	padding-right: 40px;
	margin-bottom: 0;
	line-height:45px;
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
<!-- 상단 메뉴바 end -->

<!-- 컨텐츠 -->
<div class="content">
		<div class="body-content">
		<div class="main-space">
			<div class="container">
				<div class="page-title text-center">
					<h2 class="title">공인중개사 회원정보 수정</h2>
				</div>
				<div class="main-content">
					<form id="changeform" class="form-inline" role="form" method="post"  enctype="multipart/form-data" >
						<div class="panel panel-default">
							<ul class="list-group">
								<li class="list-group-item first-list">
									<div class="first-title"><strong>공인중개사정보 입력</strong></div>
									<table class="table table-1">
										<tbody>
											<tr>
												<th class="active"><span class="left-name">중개사무소명</span></th>
												<td>

													<input type="text" class="form-control"	id="co_name" name="co_name" style="width: 350px; height: 50px;" value="${userinfo.co_name}">
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name">중개사 등록번호</span></th>
												<td>
													<input type="text" class="form-control sg-form-control-md"
													id="co_number" name="broker_num" style="width: 350px; height: 50px;" value="${userinfo.broker_num}">

													<input type="file" class="form-control" id="co_image" name="co_image" style="display: none;">
													<label for="co_image" class="public_image">
														<span class="btn btn-primary btn-lg">중개등록증 변경</span>
													</label>
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name">사업자 등록번호</span></th>
												<td>
													<input type="text" class="form-control sg-form-control-md" id="coe_number" name="office_num" style="width: 350px; height: 50px;" value="${userinfo.office_num}"/>
													<input type="file" class="form-control" id="coe_image" name="coe_image" style="display: none;">
													<label for="coe_image" class="public_image">
														<span class="btn btn-primary btn-lg" >사업자등록증 변경</span>
													</label>
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name" >중개사무소 주소</span>
												</th>
												<td>
													<div id="kakaomap">
														<input type="text" id="sample2_postcode"  placeholder="우편번호" disabled>
														<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
														<input type="text" id="sample2_address" name="office_addr" placeholder="주소" value="${userinfo.office_addr}" ><br>
														<input type="text" id="sample2_detailAddress"  placeholder="상세주소" >
														<input type="text" id="sample2_extraAddress"  placeholder="참고항목" >
													</div>
															<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
															<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
															<!--<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼"> -->
															</div>

															<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
															<script>
															    // 우편번호 찾기 화면을 넣을 element
															    var element_layer = document.getElementById('layer');

															    function closeDaumPostcode() {
															        // iframe을 넣은 element를 안보이게 한다.
															        element_layer.style.display = 'none';
															    }

															    function sample2_execDaumPostcode() {
															        new daum.Postcode({
															            oncomplete: function(data) {
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
															                if(data.userSelectedType === 'R'){
															                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
															                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
															                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
															                        extraAddr += data.bname;
															                    }
															                    // 건물명이 있고, 공동주택일 경우 추가한다.
															                    if(data.buildingName !== '' && data.apartment === 'Y'){
															                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
															                    }
															                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
															                    if(extraAddr !== ''){
															                        extraAddr = ' (' + extraAddr + ')';
															                    }
															                    // 조합된 참고항목을 해당 필드에 넣는다.
															                    document.getElementById("sample2_extraAddress").value = extraAddr;

															                } else {
															                    document.getElementById("sample2_extraAddress").value = '';
															                }

															                // 우편번호와 주소 정보를 해당 필드에 넣는다.
															                document.getElementById('sample2_postcode').value = data.zonecode;
															                document.getElementById("sample2_address").value = addr;
															                // 커서를 상세주소 필드로 이동한다.
															                document.getElementById("sample2_detailAddress").focus();

															                // iframe을 넣은 element를 안보이게 한다.
															                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
															                element_layer.style.display = 'none';
															            },
															            width : '100%',
															            height : '100%',
															            maxSuggestItems : 5
															        }).embed(element_layer);

															        // iframe을 넣은 element를 보이게 한다.
															        element_layer.style.display = 'block';

															        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
															        initLayerPosition();
															    }

															    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
															    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
															    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
															    function initLayerPosition(){
															        var width = 300; //우편번호서비스가 들어갈 element의 width
															        var height = 400; //우편번호서비스가 들어갈 element의 height
															        var borderWidth = 5; //샘플에서 사용하는 border의 두께

															        // 위에서 선언한 값들을 실제 element에 넣는다.
															        element_layer.style.width = width + 'px';
															        element_layer.style.height = height + 'px';
															        element_layer.style.border = borderWidth + 'px solid';
															        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
															        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
															        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
															    }
															</script>
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name">중개사 대표명</span></th>
												<td>
													<input type="text" class="form-control" id="coe_name" name="boss_name" style="width: 350px; height: 50px;" value="${userinfo.boss_name}">
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name">중개사 대표번호</span></th>
												<td>
													<div class="coe_Telephone">
														<input class="form-control" id="coe_Telephone1" name="tel" style="width: 80px; height: 50px;" value="${telCombi[0]}"/>
														-
														<input type="text" class="form-control" id="coe_Telephone2" name="tel" style="width: 80px; height: 50px;"  maxlength="4" value="${telCombi[1]}">
														-
														<input type="text" class="form-control" id="coe_Telephone3" name="tel" style="width: 80px; height: 50px;"  maxlength="4" value="${telCombi[2]}">
													</div> <!-- coe Telphone end -->
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name">대표 사진</span></th>
												<td>
													<img id="preview" src="${pageContext.request.contextPath}/download.do?file=${userinfo.broker_img}" class="coe_image" alt="이미지 로드후 미리보기 보여질 영역">
													<input type="file" class="form-control" id="best_image" name="best_image" accept="image/*" style="display: none;">
													<label for="best_image" class="label_best_image">
														<span class="btn btn-info btn-lg" style="position: relative; bottom: 175px;">사진 변경</span>
													</label>
												</td>
											</tr>
										</tbody>
									</table>
								</li>
								<li class="list-group-item second-list">
									<div class="second-title"><strong>개인정보 입력</strong></div>
									<table class="table table-2">
										<tbody>
											<tr>
												<th class="active"><span class="left-name">이름</span></th>
												<td>
													<input type="text" class="form-control" id="P_name" name="P_name" style="width: 350px; height: 50px;" value="${userinfo.assi_name}">
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name">직급/직책</span></th>
												<td>
													<select class="form-control" id="position" name="position">
														<option>${userinfo.position}</option>
														<option value="boss">대표공인중개사</option>
														<option value="include">소속공인중개사</option>
														<option value="intern">중개보조원</option>
													</select>
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name">이메일</span></th>
												<td>
													<div class="set_email">
														<input type="text" value="${userinfo.email_id}" class="form-control" id="set_email01" name="set_email01" style="width: 175px; height: 50px;" disabled>
													</div> <!-- set_email -->
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name">현재 비밀번호</span></th>
												<td>
													<input type="password" class="form-control" id="co_pw" name="nowco_pw" style="width: 350px; height: 50px;">
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name">새 비밀번호</span></th>
												<td>
													<input type="password" class="form-control" id="newco_pw" name="newco_pw" style="width: 350px; height: 50px;" placeholder="비밀변호 변경을 원하시면 입력해주세요.">
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name">새 비밀번호 확인</span></th>
												<td>
													<input type="password" class="form-control" id="co_pw_check" name="co_pw_check" style="width: 350px; height: 50px;" placeholder="비밀변호 변경을 원하시면 입력해주세요.">
												</td>
											</tr>
											<tr>
												<th class="active"><span class="left-name">휴대폰 번호</span></th>
												<td>
													<div class="PhoneNumber">
															<input class="form-control" id="phoneNumber1" name="phoneNum" style="width: 80px; height: 50px;" value="${numCombi[0]}">
															-
															<input type="text" class="form-control" id="phoneNumber2" name="phoneNum" style="width: 80px; height: 50px;" maxlength="4" value="${numCombi[1]}">
															-
															<input type="text" class="form-control" id="phoneNumber3" name="phoneNum" style="width: 80px; height: 50px;" maxlength="4" value="${numCombi[2]}">
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</li>
							</ul>
						</div> <!-- end panel -->
						<div class="exit  text-right"><a href="#" class="exit-item" data-toggle="modal" data-target="#myModal2" id="open_modal_btn">탈퇴하기</a></div>
						<div class="Go text-center">
							<button type="button" class="btn btn-primary btn-lg" id="complete" style="width: 200px; height: 80px;">수정완료</button>
						</div>
					</form>
				</div>
			</div> <!-- end container -->
		</div>
	</div>
	<!-- Footer -->
	<div class="footer">
	</div>
	<!-- Footer END -->


</div>  <!-- end content -->
<!--modal2 -->
<div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mysecondModalLabel">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3 class="modal-title" id="mysecondModalLabel" style="text-align: center;">세모 탈퇴하기</h3>
			</div>
			<div class="modal-body" style="text-align: center;">
				<p>탈퇴, 시 네모에 등록하신 매물과 개인정보 등이 모두 삭제되며 <br> 이후 복구가 불가능 합니다. 정말 탈퇴 하시겠습니까?</p>
				<img src="${pageContext.request.contextPath}/assets/img/cry.png" style="width: 160px; height: 160px">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger"  data-dismiss="modal" id="exit-right" style="width: 100%;">회원 탈퇴하기</button>
			</div>
		</div>

	</div>
</div> <!-- modal2 end -->

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/regex/regex.js"></script>
<script type="text/javascript">

//■■■■■■■■■■■■■■■■■■■■■ 회원 탈퇴 컨트롤러로 이동 ■■■■■■■■■■■■■■■■■■■■
	$("#exit-right").click(function() {
			alert("회원 탈퇴가 완료 되었습니다.\r\n \r\n그동안 세모 서비스를 아끼고 사랑해주셔서 감사합니다. \r\n더욱더 노력하고 발전하는 세모가 되겠습니다.");
			location.href = "co_delete";
	});

	$("#selectEmail").change(function() {
		$("#selectEmail option:selected").each(function() {
			if($(this).val() == '1') {
				$("#set_email02").val('')
				$("#set_email02").attr("disabled", false);
			} else {
				$("#set_email02").val($(this).text());
				$("#set_email02").attr("disabled", true);
			}
		});
	}); // change end

	// 사진 업로드 미리보기
	$(function() {
		var file = document.querySelector("#best_image");

		file.onchange = function () {
			var fileList = file.files;
			// 읽기
			var reader = new FileReader();
			reader.readAsDataURL(fileList [0]);

			// 로드 한 후
			reader.onload = function() {
				document.querySelector('#preview').src = reader.result;
			};
		};
	// 사진 미리보기 end

		$("#complete").click(function(e) {
			e.preventDefault();

			/** 중개사무소명 검사 */
            if (!regex.value('#co_name', '중개사무소명을 입력하세요.')) { return false; }
            if (!regex.min_length('#co_name', 2, '중개사무소명은 최소 2자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#co_name', 10, '중개사무소명은 최대 10자 까지만 입력 가능합니다.')) { return false; }

            // 중개사 번호 검사
            if (!regex.value('#co_number', '중개사 등록번호 입력하세요.')) { return false; }
           	var pattern2 = /^[0-9]*$/;
           	if (!pattern2.test($('#co_number').val())) {
	            alert('중개사 등록번호는 숫자만 입력 가능합니다.');
	            $('#co_number').val('');
	            $('#co_number').focus();
	             return false;
            }

           	/*
            // 중개사 번호 파일체크
            var subject = $("#co_image").val();
            if (!subject) {
                alert("중개 등록증을 첨부하세요.");
                $("#co_image").focus();
                return false;
            }
            */

            // 사업자 등록 번호 숫자 입력 검사
            if (!regex.value('#coe_number', '사업자 등록번호를 입력하세요.')) { return false; }
            if (!pattern2.test($('#coe_number').val())) {
                alert('사업자 등록번호는 숫자만 입력 가능합니다.');
                $('#coe_number').val('');
                $('#coe_number').focus();
                return false;
            }

            /*
            // 사업자 번호 파일체크
             var subject2 = $("#coe_image").val();
             if (!subject2) {
                 alert("사업자 등록증을 첨부하세요.");
                 $("#coe_image").focus();
                  return false;
            }
             */
			/*
            //주소검사 1
            if (!regex.value('#sample2_postcode', '주소를 입력하세요.')) { return false; }

            //주소검사 2
            if (!regex.value('#sample2_address', '상세주소를 입력하세요.')) { return false; }
            */

            // 중개사 대표명
            if (!regex.value('#coe_name', '중개사 대표명을 입력하세요.')) { return false; }
            if (!regex.kor('#coe_name', '중개사무소명은 한글만 입력 가능합니다.')) { return false; }
            if (!regex.min_length('#coe_name', 2, '중개사 대표명은 최소 2자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#coe_name', 4, '중개사 대표명은 최대 4자 까지만 입력 가능합니다.')) { return false; }

            // 중개사대표번호 입력 검사 -1
            if (!regex.value('#coe_Telephone2', '중개사 대표번호를 입력하세요.')) { return false; }
            if (!pattern2.test($('#coe_Telephone2').val())) {
                alert('중개사 대표번호는 숫자만 입력 가능합니다.');
                $('#coe_Telephone2').val('');
                $('#coe_Telephone2').focus();
                return false;
            }
            if (!regex.min_length('#coe_Telephone2', 3, '최소 3자 이상 입력 가능합니다.')) { return false; }


            // 중개사대표번호 입력 검사 -2
            if (!regex.value('#coe_Telephone3', '중개사 대표번호를 입력하세요.')) { return false; }
            if (!pattern2.test($('#coe_Telephone3').val())) {
                alert('중개사 대표번호는 숫자만 입력 가능합니다.');
                $('#coe_Telephone3').val('');
                $('#coe_Telephone3').focus();
                return false;
            }
            if (!regex.min_length('#coe_Telephone3', 4, '최소 4자 이상 입력 가능합니다.')) { return false; }

            /*
        	// 대표사진 검사
             var best = $("#best_image").val();
             if (!best) {
                 alert("대표자 사진을 첨부하세요.");
                 $("#best_image").focus();
                  return false;
            }
             */



            /** 이름 검사 */
            if (!regex.value('#P_name', '이름을 입력하세요.')) { return false; }
            if (!regex.kor('#P_name', '이름은 한글만 입력 가능합니다.')) { return false; }
            if (!regex.min_length('#P_name', 2, '이름은 최소 2자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#P_name', 10, '이름은 최대 10자 까지만 입력 가능합니다.')) { return false; }

            /** 직급/직책 검사 */
            if (!regex.value('#position', '직급/직책을 입력하세요.')) { return false; }

            /*
            // 이메일 검사
            if(!regex.value('#set_email01', '이메일 앞자리를 입력하세요.')) {return false;}
            if(!regex.eng('#set_email01','이메일은 영문만 입력가능합니다.')) {return false;}

            if(!regex.value('#set_email02', '이메일 뒷자리를 입력하세요.')) {return false;}
            */
            /*
            // 비밀번호 검사
        	if (!regex.value('#co_pw', '비밀번호를 입력하세요.')) {return false;}
        	if (!regex.min_length('#co_pw', 4, '비밀번호는 최소 4자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#co_pw', 20, '비밀번호는 최대 20자 까지만 입력 가능합니다.')) { return false; }
			if (!regex.value('#co_pw_check', '비밀번호를 입력하세요.')) {return false;}
        	if (!regex.min_length('#co_pw_check', 4, '비밀번호는 최소 4자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#co_pw_check', 20, '비밀번호는 최대 20자 까지만 입력 가능합니다.')) { return false; }
            if (!regex.compare_to('#co_pw', '#co_pw_check', '비밀번호 확인이 잘못되었습니다.')) { return false; }
			*/

			//새 비밀번호 검사
			if ($("#co_pw").val() != null && $("#co_pw").val() != "") {
				if (!regex.value('#newco_pw', '비밀번호를 입력하세요.')) {return false;}
	        	if (!regex.min_length('#newco_pw', 4, '비밀번호는 최소 4자 이상 입력 가능합니다.')) { return false; }
	            if (!regex.max_length('#newco_pw', 20, '비밀번호는 최대 20자 까지만 입력 가능합니다.')) { return false; }
				if (!regex.value('#co_pw_check', '비밀번호를 입력하세요.')) {return false;}
	        	if (!regex.min_length('#co_pw_check', 4, '비밀번호는 최소 4자 이상 입력 가능합니다.')) { return false; }
	            if (!regex.max_length('#co_pw_check', 20, '비밀번호는 최대 20자 까지만 입력 가능합니다.')) { return false; }
	            if (!regex.compare_to('#newco_pw', '#co_pw_check', '비밀번호 확인이 잘못되었습니다.')) { return false; }
			}

            /**핸드폰 검사1 */
            if (!regex.value('#phoneNumber2', '휴대폰 번호를 입력하세요.')) { return false; }
            if (!pattern2.test($('#phoneNumber2').val())) {
                alert('중개사 대표번호는 숫자만 입력 가능합니다.');
                $('#phoneNumber2').val('');
                $('#phoneNumber2').focus();
                return false;
            }
            if (!regex.min_length('#phoneNumber2', 4, '최소 3자 이상 입력 가능합니다.')) { return false; }

            // 휴대폰 검사1 end



            // 휴대폰 검사2
            if(!regex.value('#phoneNumber3', '휴대폰 번호를 입력하세요.')) {return false;}
     		if(!regex.min_length('#phoneNumber3',4, " 휴대폰 번호는 4자리를 입력하셔야합니다."))
            if(!pattern2.test($('#phoneNumber3').val())) {
            	alert('휴대폰 번호는 숫자만 입력가능 합니다.');
            	$('#phoneNumber3').val('');
            	$('#phoneNumber3').focus();
            	return false;
            }
            // 휴대폰 검사2 end

            var form = new FormData(document.getElementById('changeform'));


			/** 일반 ajax */
			$.ajax({
				type : "POST",
				url : "co_infochange_ok",
				dataType : "text",
				processData: false,
				contentType: false,
				data : form,
				success : function(data){
					console.log("success");
					alert("수정이 완료되었습니다.");
					location.href = "index.do";
				}
			});

     		//$("#changeform").submit();
		});

	});

</script>



</body>
</html>
