<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>세모- 매물 등록</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/Maemul_register.css" />
<link rel="stylesheet" href="plugins/datepicker/datepicker.min.css" />
<link rel="stylesheet" href="plugins/sweetalert/sweetalert2.min.css" />
<link rel="stylesheet" href ="plugins/icheck/css/blue.css" /> 

</head>
<body>
 <!-- 상단 메뉴바  -->
 <%@ include file="include/co_loginHeader.jsp"%>
 <!-- //상단 메뉴바 -->

	<!--page title-->
	<div class="content">
		<div class="container">
			<h1 class="text-center">상가 매물등록수정</h1>
			<p class="text-muted">▶등록된 매물은 60일간 노출되며, 매물 관리 규정에 위배되거나 신고된 매물은
				비공개 혹은 삭제 처리됩니다.</p>
			<!--//page title-->
			<!--main section 시작-->
			<div class="main_section">
				<form id="registerform" name="registerform" action="Maemul.detailed.jsp" target="post"
					role="form">
					<!--위치정보-->
					<table class="info_article_one">
						<caption class="text-center">위치 정보</caption>
						<tbody>
							<tr>
								<th>주소</th>
								<td>
									<div class="address_info">
										<div class="button">
											<input type="text" name="sample5_address" id="sample5_address" readonly /> <input
												class="btn btn-primary" type="button"
												onclick="sample5_execDaumPostcode()" value="주소 검색" />
										</div>
										<div class="detailed_form">
											<textarea class="form-control" id="adddetailed" name="adddetailed"
												style="width: 400px; height: 130px; margin-top: 20px;"
												placeholder="상세주소를 입력하세요." required></textarea>
										</div>
									</div>
								</td>
								<td>
									<div class="map_box">
										<div id="map"
											style="width: 400px; height: 200px; display: none; position: absolute;"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					
					<!--//위치정보-->
					<!--건물 정보-->
					<table class="info_article_two">
						<caption class="text-center">건물 정보</caption>
						<tbody>
							<tr>
								<th>건물 정보</th>
								<td>
									<div class="maemul_info">
										<!--공개여부 버튼-->
										<div class="toggle-radio">
											<input type="radio" class="radionon" name="rdo" id="yes" checked />
											<input type="radio" class="radionon" name="rdo" id="no"/>
											<div class="switch">
												<label for="yes">공개</label> <label for="no">비공개</label> <span></span>
											</div>
										</div>
										<!--공개여부 버튼 끝-->
										<tr>
											<th>건물명</th>
											<td><input type="text" class="form-control"
												name="maemul_name" id="maemul_name" placeholder="건물명을 입력하세요."
												maxlength="50글자 이하로 입력하세요." data-val-length-max="50" style="width: 400px; margin:15px;" required/>
											</td>
										</tr>
										<tr>
											<th>사진</th>
                     						 <td>
											<img id="preview" src="" width="400" height="200" alt="사진 영역입니다.">
											<input type="file" id="getfile" name="getfile" accept="image/*" required/></td>
										</tr>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<!--//건물 정보-->
					<!--거래 정보-->
					<table class="info_article_three">
						<caption class="text-center">거래 정보</caption>
						<tbody>
							<tr>
								<th>종류 선택</th>
								<td>
									<div class="deal_info">    
										 <input type="radio" id="button_rent" class="icheckuse" name="addmaemul"  value="rent" checked />&nbsp;월세 추가
										  <input type="radio" id="button_buy" class="icheckuse" name="addmaemul" value="buy"/>&nbsp;매매 추가
										  
										  <div class="addrent" hidden="" style="margin-top:10px"><input type="text" class="addtext" name="deposit" placeholder="보증금"
										  onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')"/>&nbsp;/
										       <input type="text" class="addtext" name="monthrent" placeholder="월세"
										       onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')"/>&nbsp;만원&nbsp;&nbsp;(예: 5000/100)</div>
										  <div class="addbuy" hidden="" style="margin-top:10px"><input type="text" name="buy" placeholder="매매가"
										  onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')"/>&nbsp;/
										    <input type="text" class="addtext" name="gideposit" placeholder="기보증금"
										    onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')"/>&nbsp;/
										    <input type="text" class="addtext" name="gimonthrent" placeholder="기월세"
										    onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')"/>&nbsp;만원&nbsp;&nbsp;(예: 5000)
										  </div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<!--//거래 정보-->
					<!--기본 정보-->
					<table class="info_article_four">
						<caption class="text-center">기본 정보</caption>
						<tbody>
							<tr>
								<th>해당 층수</th>
								<td>
									<div class="number_floors" style="display: inline-block;">
										<select class="form-control" id="validselect" name="numberfloors" style="width: 110px;" required>
											<option value="">--선택--</option>
											<option value="03">지하3층</option>
											<option value="02">지하2층</option>
											<option value="01">지하1층</option>
											<option value="1">1층</option>
											<option value="2">2층</option>
											<option value="3">3층</option>
											<option value="4">4층</option>
											<option value="5">5층</option>
											<option value="6">6층</option>
											<option value="7">7층</option>
											<option value="8">8층</option>
											<option value="9">9층</option>
											<option value="10">10층</option>
											<option value="11">11층</option>
											<option value="12">12층</option>
											<option value="13">13층</option>
											<option value="14">14층</option>
											<option value="15">15층</option>
											<option value="16">16층</option>
											<option value="17">17층</option>
											<option value="18">18층</option>
											<option value="19">19층</option>
											<option value="20">20층</option>
											<option value="21">21층</option>
											<option value="22">22층</option>
											<option value="23">23층</option>
											<option value="24">24층</option>
											<option value="25">25층</option>
											<option value="26">26층</option>
											<option value="27">27층</option>
											<option value="28">28층</option>
											<option value="29">29층</option>
											<option value="30">30층</option>
										</select>
									</div>
							<div class="form-check" style="display: inline;">
 				 				<input type="checkbox" class="icheckuse"  name="select_check" id="validselect" checked/>
 							 <label class="form-check-label" for="select_check">복층(연층)</label>
								</div>				
						<div class="form-check"  style="display: inline; margin-right:20px;">
 					 		<input type="checkbox" class="icheckuse" name="select_check" id="validselect" checked/>
 							 <label class="form-check-label" for="select_check2">건물 전체</label>
							</div>
							</td>
							<th>계약면적</th>
								<td>	
								    <div class="maemul_size" style="display: inline-flex;">
									<input type="text" class="form-control" id="maemulsize" pattern="/^[0-9]*$/" name="maemulsize" style="width: 88px;" maxlength="4"
									 onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')"/>
									 <span style="padding-top: 10px;">평</span></div>
									<div class="maemul_size" style="display: inline-flex;">
									<input type="text" class="form-control" id="maemulsize2" name="maemulsize2" style="margin-left: 20px; width: 88px;"
									 onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')"/>
									<span style="padding-top: 10px">m</span></div>
							    </td>
							    <tr>
								<th>건물 층수</th>
								<td>
									<div class="maemul_floors" style="width: 110px;">
										<select class="form-control" id="validselect" name="maemulfloors" required>
											<option value="">--선택--</option>
											<option value="1">1층</option>
											<option value="2">2층</option>
											<option value="3">3층</option>
											<option value="4">4층</option>
											<option value="5">5층</option>
											<option value="6">6층</option>
											<option value="7">7층</option>
											<option value="8">8층</option>
											<option value="9">9층</option>
											<option value="10">10층</option>
											<option value="11">11층</option>
											<option value="12">12층</option>
											<option value="13">13층</option>
											<option value="14">14층</option>
											<option value="15">15층</option>
											<option value="16">16층</option>
											<option value="17">17층</option>
											<option value="18">18층</option>
											<option value="19">19층</option>
											<option value="20">20층</option>
											<option value="21">21층</option>
											<option value="22">22층</option>
											<option value="23">23층</option>
											<option value="24">24층</option>
											<option value="25">25층</option>
											<option value="26">26층</option>
											<option value="27">27층</option>
											<option value="28">28층</option>
											<option value="29">29층</option>
											<option value="30">30층</option>
										</select>
									</div>
										<th>전용 면적</th>
								<td>	
								    <div class="maemul_size2" style="display: inline-flex;">
									<input type="text" class="form-control" id="maemulsize1" name="maemulsize1" maxlength="4"
									 onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')"/>
									<span style="padding-top: 10px;">평</span></div>
									<div class="maemul_size2" style="display: inline-flex;">
									<input type="text" class="form-control" id="maemulsize3" name="maemulsize3"
									 onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')"/>
									<span style="padding-top: 10px">m</span></div>
							    </td>
							</tr>
							<tr>
								<th>난방 종류</th>
								<td>
									<div class="heat_info" style="width: 110px;">
										<select class="form-control" id="validselect" name="heatform" required>
											<option value="">--선택--</option>
											<option value="personal1">개별난방</option>
											<option value="area1">지역난방</option>
											<option value="center1">중앙난방</option>
											<option value="personal2">개별냉난방</option>
											<option value="area2">지역냉난방</option>
											<option value="personal2">중앙냉난방</option>
											<option value="nono">없음</option>
										</select>
									</div>
								</td>
									<th>화장실</th>
									<td>
										<div class="toilet_form" style="width: 140px;">
											<select class="form-control" id="validselect" name="toiletform" required>
											<option value="">--선택--</option>
											<option value="outside1">외부/남녀구분</option>
											<option value="outside2">외부/남녀혼용</option>
											<option value="inside1">내부/남녀구분</option>
											<option value="inside1">내부/남녀혼용</option>
											<option value="toiletno">없음</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th>준공년도</th>
								<td>
									<div class="year_form" style="display: inline-block; margin: 20px; width: 110px;">
											<select class="form-control" id="validselect" name="yearform" required>
											<option value="">--선택--</option>
											<option value="2019">2019년도</option>
											<option value="2018">2018년도</option>
											<option value="2017">2017년도</option>
											<option value="2016">2016년</option>
											<option value="2015">2015년</option>
											<option value="2014">2014년</option>
											<option value="2013">2013년</option>
											<option value="2012">2012년</option>
											<option value="2011">2011년</option>
											<option value="2010">2010년</option>
											<option value="2009">2009년</option>
											<option value="2008">2008년</option>
											<option value="2007">2007년</option>
											<option value="2006">2006년</option>
											<option value="2005">2005년</option>
											<option value="2004">2004년</option>
											<option value="2003">2003년</option>
											<option value="2002">2002년</option>
											<option value="2001">2001년</option>
											<option value="2000">2000년</option>
											<option value="1990">1990년도</option>
											<option value="1980">1980년도</option>
											<option value="1970">1970년도</option>
										</select>
										</div>			
											<div class="month_form" style="display: inline-block; width: 110px;" >
											<select class="form-control" id="validselect" name="monthform" required>
											<option value="">--선택--</option>
											<option value="1">1월</option>
											<option value="2">2월</option>
											<option value="3">3월</option>
											<option value="4">4월</option>
											<option value="5">5월</option>
											<option value="6">6월</option>
											<option value="7">7월</option>
											<option value="8">8월</option>
											<option value="9">9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
										</select>
									</div>
									</td>	
							    </tr>
							    <tr>
							    	<th>입주가능일</th>
							    	<td colspan="3">
							   <div class="movein_day">
									 <input type="radio" class="icheckuse" name="nowbtn" id="nowbtn" value="nowgo"checked/>&nbsp;즉시입주
									  <input type="radio" class="icheckuse" name="nowbtn" id="withbtn" value="withgo"/>&nbsp;협의가능
									   <input type="text" id="datepicker" placeholder="&nbsp;달력을 클릭하세요." readonly  />
									      <img src="img/calendar.png" id="show-cal" height="20" style="float: none; cursor:pointer;">
							    		</div>
							    	</td>
							    </tr>
						</tbody>
					</table>
					<!--//기본정보-->
					<!--추가 정보-->
					 <table>
						<caption class="text-center">추가 정보</caption>
							   <tbody>
							     	<tr>
							    	   <th>권리금</th>
							    		<td>
							    		<div class="foregift_chk"  style="margin : 15px 20px;">		
							    		 <input type="radio" id="foregiftchk" class="icheckuse"  name="foregiftchk" value="yes"/>&nbsp;있음 
							    		 <input type="radio" class="icheckuse" name="foregiftchk" value="no" checked />&nbsp;없음
							    		  <div class="foregift" hidden="" style="margin-top:10px"><input type="text" class="foregifttext" name="foregift" placeholder="권리금"
							    		   onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')"/>&nbsp;만원&nbsp;&nbsp;(예: 1000)</div>
							    		</div>
							    		</td>
							    		<tr>
							    		<th>관리비</th>
							    		<td>
							    		<div class="manage_chk" style="margin : 15px 20px;">
							    		 <input type="radio" class="icheckuse" id="managechk" name="managechk" id="managechk" value="yes"/>&nbsp;있음
							    		  <input type="radio" class="icheckuse" name="managechk" id="manage1" value="no"checked/>&nbsp;없음
							    		   <div class="manage" hidden="" style="margin-top:10px"><input type="text" class="managetext" name="manage" placeholder="관리비"
							    		    onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')"/>&nbsp;만원&nbsp;&nbsp;(예: 1000)</div>
							    		</div>
							    		</td>
							    		</tr>
							    		<tr>
							    		<th>주차</th>
							    		<td>
							    		<div class="park_chk" style="margin : 15px 20px;">
							    		 <input type="radio" class="icheckuse" name="parkchk" id="parkchk" value="yes"/>&nbsp;가능
							    		  <input type="radio" class="icheckuse" name="parkchk" id="parkchk" value="no"checked/>&nbsp;불가능
							    		  <div class="parkuse" hidden=""style="margin-top:10px; width:110px;" ><select class="form-control" id="validselect" name="parkuse" required>
							    		  <option value="">--선택--</option>
							    		  <option value="1">1대</option>
							    		  <option value="2">2대</option>
							    		  <option value="3">3대</option>
							    		  <option value="4">4대</option>
							    		  <option value="5">5대</option>
							    		  <option value="6">6대</option>
							    		  <option value="7">7대</option>
							    		  <option value="8">8대</option>
							    		  <option value="9">9대</option>
							    		  <option value="10">10대</option>
							    		  <option value="20">20대</option>
							    		  <option value="30">30대</option>
							    		  <option value="40">40대</option>
							    		  <option value="50">50대</option>
							    		  <option value="60">60대</option>
							    		  <option value="70">70대</option>
							    		  <option value="80">80대</option>
							    		  <option value="90">90대</option>
							    		  <option value="100">100대이상</option>
							    		  </select></div>
							    		</div>
							    		</td>
							    		</tr>
							    		<tr>
							    		<th>엘리베이터</th>
							    		<td>
							    		<div class="eleva_chk" style="margin : 15px 20px;">
							    		 	<input type="radio" class="icheckuse" name="elevachk" id="elevachk" value="yes"/>&nbsp;있음
							    		  	<input type="radio" class="icheckuse" name="elevachk" id="elevachk1" value="no"checked/>&nbsp;없음	
							    		  	 <div class="elevause" hidden=""style="margin-top:10px; width:110px;" ><select class="form-control" id="validselect" name="elevause" required>
							    		  	 <option value="">--선택--</option>
							    		  	 <option value="1">1</option>
							    		  	 <option value="2">2</option>
							    		  	 <option value="3">3</option>
							    		  	 <option value="4">4</option>
							    		  	 <option value="5">5</option>
							    		  	 <option value="6">6</option>
							    		  	 <option value="7">7</option>
							    		  	 <option value="8">8</option>
							    		  	 <option value="9">9</option>
							    		  	 <option value="10">10대이상</option>
							    		  	 </select>
							    		  	 </div>
							    		</div>
							    		</td>
							    		</tr>
							    	</tbody>
							    </table>
					<!--//추가정보-->
					<!--상세설명-->
					<table>
						<caption class="text-center">상세설명</caption>
						<tbody>
							<tr>
								<th>제목</th>
								<td>
									<input type="text" class="form-control"	name="explain_name" id="explain_name" placeholder="제목을 입력하세요."
									maxlength="50글자 이하로 입력하세요." data-val-length-max="50" style="width: 800px; margin: 20px;" required/>
								</td>
								<tr>
								<th>상세설명</th>
								<td>
									<div class="detailed_explain">
											<textarea class="form-control" style="width: 800px; height: 300px; margin: 20px;"
											placeholder="상세설명을 입력하세요." required></textarea>
										</div>
								</td>
							</tr>
							<tr>
								<th>비공개 메모</th>
								<td>
									<input type="text" class="form-control"	name="notopen_memo" id="notopen_memo" placeholder="등록자만 확인할 수 있는 메모 영역입니다."
									maxlength="50글자 이하로 입력하세요." data-val-length-max="50" style="width: 800px; margin: 20px;" required/>
								</td>
							</tr>
						
						</tbody>
					</table>
					<!--//상세설명-->
					<!--사진 등록-->
					<table>
						<caption class="text-center">사진 등록</caption>
							<tbody>
								<tr>
									<th>일반 사진</th>
									 <td><img id="preview2" src="" width="600" height="400" alt="사진 영역입니다.">
											<input multiple="multiple" type="file" id="getfile2" name="getfile2" accept="image/*" /></td>
								</tr>
							</tbody>
					</table>
					<!--//사진 등록-->
					<div>
						<input type="checkbox" class="icheckuse" name="agree" id="check_box" value="check" required/>
						<label for="check_box" style="font-weight: normal; margin-top:15px;"><strong>[필수]</strong>
						매물정책 관리 정책을 준수하지 않을 경우 광고 종료 또는 삭제 될 수 있는 것에 동의합니다.</label>
					</div>
					<!-- (완료버튼) -->
					<div class="register_btn">
							<button type="button" id="button_cancel" name="button_cancel" class="btn btn-info btn-lg">취소</button>
							<input type="submit" id="button_fini" name="button_fini" class="btn btn-primary btn-lg" value="수정완료"/>
						</div>
				</form>
			</div>
			<!--//main section-->

		</div>
		<!-- Footer -->
<div class="footer"></div>
		<!-- Footer END -->
	</div>

	 <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	 <script src = "plugins/icheck/icheck.min.js"></script>
    <script src="plugins/datepicker/datepicker.min.js"></script>
    <script src="plugins/datepicker/datepicker.ko-KR.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95f002774aca91da5371858ef1ee4891&libraries=services"></script>
    <script>
    <!-------------------------datepicker 시작------------------------------->
        $(function() {
           $("#datepicker").datepicker({
                autoHide: true,         // 날짜 선택 후 자동 숨김 (true/false)
                format: 'yyyy-mm-dd',   // 날짜 형식
                language: 'ko-KR',      // 언어
                weekStart: 0,           // 시작요일(0=일요일~6=토요일)
                trigger: '#show-cal'    // 클릭시 달력을 표시할 요소의 id
            });
           <!--//datepicker 끝-->
            <!--평수 자동변환 로직-->
            $("#maemulsize").keyup(function(){

                // 2. #out 공간에 #data의 내용이 출력된다.

                
                $("#maemulsize2").val($("#maemulsize").val() * 3.3);

                // #out의 위치에 text로 데이터를 받는다.(setter)

                // 들어가는 데이터는 #data의 값(.val())이다. (getter)

                // 메서드 괄호 안에 아무것도 없으면 getter, 파라미터가 있으면 setter이다.

             });
            $("#maemulsize1").keyup(function(){
            	$("#maemulsize3").val($("#maemulsize1").val() * 3.3);	
            });
            $("#maemulsize2").keyup(function(){
            	$("#maemulsize").val($("#maemulsize2").val() / 3.3 );	
            });
            $("#maemulsize3").keyup(function(){
            	$("#maemulsize1").val($("#maemulsize3").val() / 3.3);	
            });
        });
    </script>

<!--//평수 자동변환 로직-->
<!--------------------------------- radio,checkbox icheck  -------------------------->
 
<script> 
$ (document) .ready (function () { 
  $ ('.icheckuse').iCheck ({ 
	checkboxClass : 'icheckbox_flat-blue', 
    radioClass : 'iradio_flat-blue' 
}); 
  $('#button_rent').on('ifChecked', function() {
      console.log("checked");
     $(".addrent").show();
});
  $('#button_rent').on('ifUnchecked', function() {
      console.log("unchecked");
     $(".addrent").hide();
});
  
  $('#button_buy').on('ifChecked', function() {
      console.log("checked");
     $(".addbuy").show();
});
  $('#button_buy').on('ifUnchecked', function() {
      console.log("unchecked");
     $(".addbuy").hide();
});
  $('#foregiftchk').on('ifChecked', function() {
      console.log("checked");
     $(".foregift").show();
});
  $('#foregiftchk').on('ifUnchecked', function() {
      console.log("unchecked");
     $(".foregift").hide();
});
  $('#managechk').on('ifChecked', function() {
      console.log("checked");
     $(".manage").show();
});
  $('#managechk').on('ifUnchecked', function() {
      console.log("unchecked");
     $(".manage").hide();
});
  $('#parkchk').on('ifChecked', function() {
      console.log("checked");
     $(".parkuse").show();
});
  $('#parkchk').on('ifUnchecked', function() {
      console.log("unchecked");
     $(".parkuse").hide();
});
  $('#elevachk').on('ifChecked', function() {
      console.log("checked");
     $(".elevause").show();
});
  $('#elevachk').on('ifUnchecked', function() {
      console.log("unchecked");
     $(".elevause").hide();
});
});


</script>
<!-- //icheck  -->
<!--------------------------------------------- input type 유효성 검사 -------------------------------------->
<script>

</script>
<!-- //input type 유효성 검사 -->
	<!-- 카카오 map -->
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});

		function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("sample5_address").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results,
							status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";
							map.relayout();
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
	</script>
	<!-------------------------------------//카카오 map----------------------------------------->
	<!------------------------------------ 라디오 버튼 요소표시-------------------------------------->
	
	<!-- //라디오버튼 요소표시 -->
	<!-- 이미지파일 -->
	<script>
	var file = document.querySelector('#getfile');

	file.onchange = function () { 
    var fileList = file.files ;
    
    // 읽기
    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    //로드 한 후
    reader.onload = function  () {
        document.querySelector('#preview').src = reader.result;
    }; 
}; 
</script>
	<script>
	var file = document.querySelector('#getfile2');

	file.onchange = function () { 
    var fileList = file.files ;
    
    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    reader.onload = function  () {
        document.querySelector('#preview2').src = reader.result;
    }; 
}; 
</script>

<!-- 취소버튼  -->
<script>
        $(function(){
     		$('#button_cancel').click(function(){
     			location.href = 'Main.jsp';
     		});
     	});
</script>

	
</body>
</html>