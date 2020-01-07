<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>세모- 상가 중개사이트</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/Maemul.detailed.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/Login.css">


<style type="text/css">

html, body {
   margin: 0;
   padding: 0;
   width: 100%;

}


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

/*------------- 복사해서 사용하세요 END --------------------*/
.M_icon_item1 {
   text-align: center;
   font-size: 40px;
   width: 23%;

}
.M_icon_item1::after {
   font-weight: normal;
   font-size: 12px;
   display: block;
   content: "사무실"
}
.M_icon_item2 {
   text-align: center;
   font-size: 40px;
   width: 23%;
}
.M_icon_item2::after {
   font-weight: normal;
   font-size: 12px;
   display: block;
   content: "${output.all_width}평"
}
.M_icon_item3 {
   text-align: center;
   font-size: 40px;
   width: 23%;
}
.M_icon_item3::after {
   font-weight: normal;
   font-size: 11.3px;
   display: block;
   <c:choose>
      <c:when test="${output.floor == 300}">
         content: "지하3/${output.all_floor}층"
      </c:when>
      <c:when test="${output.floor == 200}">
         content: "지하2층/${output.all_floor}층"
      </c:when>
      <c:when test="${output.floor == 100}">
         content: "지하1층/${output.all_floor}층"
      </c:when>
      <c:otherwise>
         content: "${output.floor}/${output.all_floor}층"
      </c:otherwise>

   </c:choose>
}
.M_icon_item4 {
   text-align: center;
   font-size: 40px;
   width: 23%;
}
.M_icon_item4::after {
   font-weight: normal;
   font-size: 12px;
   display: block;
   <c:choose>
      <c:when test="${output.manage_ex == 0}">
         content: "없음"
      </c:when>
      <c:otherwise>
         content: "${output.manage_ex}만원"
      </c:otherwise>
   </c:choose>
}

</style>


</head>
<body>
<!--------------------------- 복사하여 사용 하세요 ---------------------------->
<!-- 상단 메뉴 바 -->
<%@ include file="./assets/include/header.jsp" %>
<!-- 상단 메뉴 바  -->


<!--  로그인 Modal -->
<%@ include file="./assets/include/loginmodal.jsp" %>
<!-- 로그인 Modal end -->



<!-- 컨텐츠 -->
<div class="content">
   <div class="container">
      <div class="row">
         <!-- 본문 영역 -->
         <div class="col-xs-8">
            <!-- 캐러셀 영역 구성 -->
         <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- 현재 위치 표시 -->
            <!-- 사진 length 만큼 늘어나게 처리 -->
            <ol class="carousel-indicators">
               <c:forEach var="C_image" items="${fileoutput}" varStatus="status">
                  <c:if test="${C_image.fieldName eq 'maemulinput_imgs'}">
                     <c:choose>
                        <c:when test="${status.index eq 1}">
                           <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        </c:when>
                        <c:otherwise>
                           <li data-target="#carousel-example-generic" data-slide-to="${status.index}"></li>
                        </c:otherwise>
                     </c:choose>
                  </c:if>
               </c:forEach>
             </ol>

            <!-- 내용 영역 -->
            <div class="carousel-inner center-block">
               <c:forEach var="Mimg" items="${fileoutput}" varStatus="status">
                  <c:if test="${Mimg.fieldName eq 'maemulinput_imgs'}">
                     <c:choose>
                        <c:when test="${status.index eq 1}">
                                <div class="item active">
                                    <img src="${pageContext.request.contextPath}/download.do?file=${Mimg.filePath}">
                                </div>
                               </c:when>
                               <c:otherwise>
                                  <div class="item">
                                      <img src="${pageContext.request.contextPath}/download.do?file=${Mimg.filePath}">
                                  </div>
                               </c:otherwise>
                     </c:choose>
                  </c:if>
               </c:forEach>
            </div>
            <!-- // 내용영역 구성 -->

            <!-- 이동 버튼 -->
            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> <span class="icon-prev"></span> </a>
            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> <span class="icon-next"></span> </a>
         </div>
         <!-- 캐러셀 영역 끝 -->

         <div class="panel panel-default">
            <div class="container" style="width: 100%">
               <div class="info B_info">
                  <div class="title">
                     매물정보
                  </div>

                  <div class="row">
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">매물번호</span>
                           <span class="value">${output.maemul_num}</span>
                        </div>

                     </div>
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">난방종류</span>
                           <span class="value">${output.heating}</span>
                        </div>
                     </div>
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">상가이름</span>
                           <span class="value">${output.build_name}</span>
                        </div>
                     </div>
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">엘레베이터</span>
                           <c:choose>
                              <c:when test="${output.elv == 0}">
                                 <span class="value">없음</span>
                              </c:when>
                              <c:otherwise>
                                 <span class="value">있음/${output.elv}대</span>
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name" style="width: 400px;">주차공간</span>
                           <c:choose>
                              <c:when test="${output.parking == 0}">
                                 <span class="value">없음</span>
                              </c:when>
                              <c:otherwise>
                                 <span class="value">${output.parking}대</span>
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <c:choose>
                              <c:when test="${output.select_sale == 'Y'}" >
                                 <span class="name">보증금/월세</span>
                                 <span class="value">${output.warrenty}만원/${output.monthly}만원</span>
                              </c:when>
                              <c:otherwise>
                                 <span class="name">기보증금/기월세</span>
                                 <span class="value">${output.pre_war}만원 / ${output.pre_month}만원</span>
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">권리금</span>
                           <c:choose>
                              <c:when test="${output.manage_ex == 0}">
                                 <span class="value">없음</span>
                              </c:when>
                              <c:otherwise>
                                 <span class="value">${output.manage_ex}만원</span>
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">화장실</span>
                           <span class="value">${output.toilet}</span>
                        </div>
                     </div>
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">해당층/건물층</span>
                           <span class="value"><c:choose>
					      <c:when test="${output.floor == 300}">
					         	 지하3/${output.all_floor}층
					      </c:when>
					      <c:when test="${output.floor == 200}">
					         	 지하2층/${output.all_floor}층
					      </c:when>
					      <c:when test="${output.floor == 100}">
					        	 지하1층/${output.all_floor}층
					      </c:when>
					      <c:otherwise>
					          ${output.floor}/${output.all_floor}층
					      </c:otherwise>

					   </c:choose></span>
                        </div>
                     </div>
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">인테리어(시설)</span>
                           <span class="value">없음</span>
                        </div>
                     </div>
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">계약면적/전용면적</span>
                           <span class="value">${output.all_width}평/${output.pri_width}평</span>
                        </div>
                     </div>
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">입주가능일</span>
                           <c:choose>
                              <c:when test="${output.movein == 'Y'}">
                                 <span class="value">즉시입주가능</span>
                              </c:when>
                              <c:otherwise>
                                 <span class="value">협의가능</span>
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                     <c:choose>
                        <c:when test="${output.select_sale == 'N'}">
                           <div class="col-sm-12 col-md-6">
                              <div class="text">
                                 <span class="name">매매가</span>
                                 <span class="value">${output.sale}만원</span>
                              </div>
                           </div>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                     </c:choose>
                     <!--
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">추천업종</span>
                           <span class="value">종교</span>
                        </div>
                     </div>
                     -->
                     <div class="col-sm-12 col-md-6">
                        <div class="text">
                           <span class="name">준공년도</span>
                           <span class="value">${output.comple_year}년</span>
                        </div>
                     </div>
                  </div> <!-- row end -->
                  <div class="row last-row">
                  <!--
                     <div class="col-md-12">
                        <div class="Text">
                           <span class="name">옵션</span>
                           <span class="value">#24시간개방</span>
                        </div>
                     </div>
                  -->
                  </div>
               </div> <!-- B_info end -->
               <!-- DB_info -->
               <div class="info BD_info">
                  <div class="title">매물 상세 설명</div>
                  <div class="row">
                     <div class="col-md-12 index">
                        <div class="Value">
                           <span class="value_detail" style="line-height: 180%;">

                           ${output.content}

                              </span>
                        </div>
                     </div>
                  </div>
               </div> <!-- BD_info end -->
               <div class="info BD_image_info">
                  <div class="title">건물 정보</div>
                  <div class="row">
                     <!-- 시작 -->
                        <c:choose>
                           <c:when test="${output.select_type eq 'N'}">
                              <div class="col-md-6 col-sm-12">
                                 <div class="image well">
                                 </div>
                              </div>
                              <div class="col-md-6 col-sm-12" style="padding-left: 10px;">
                                 <div class="Name" style="margin-bottom: 28px;">중개인의 요청으로 건물 정보제공을 제한합니다.</div>
                              </div>
                           </c:when>
                           <c:otherwise>
                              <div class="col-md-6 col-sm-12">
                                 <div class="image">
                                    <c:forEach var="Bitem" items="${fileoutput}" varStatus="status">
                                                   <c:if test="${Bitem.fieldName eq 'getfile'}">
                                                       <img src="${pageContext.request.contextPath}/download.do?file=${Bitem.filePath}" style="width:319px; height:160px;">
                                                   </c:if>
                                               </c:forEach>
                                 </div>
                              </div>
                              <div class="col-md-6 col-sm-12" style="padding-left: 10px;">
                                         <div class="Name" style="margin-bottom: 28px;">${output.build_name}</div>
                                         <div class="address">${output.item_addrst}</div>
                                           <div class="floor">총 ${output.all_floor}층</div>
                                          <div class="build">${output.comple_year}년</div>
                                     </div>
                           </c:otherwise>
                        </c:choose>
                     <!-- 끝 -->
                  </div>
               </div> <!-- DB_image_info end-->
               <div class="info BD_fee">
                  <div class="title">중개보수</div>
                  <table class="table">
                     <tbody>
                        <tr>
                           <th class="active" rowspan="2"><span>중개보수</span></th>
                           <span class="value">
                              <td style="padding-top: 14px;">최대 1260만원</td>
                           </span>
                        </tr>
                        <tr>
                           <span class="value">
                              <td style="padding-top: 14px;">상한요율</td>
                           </span>
                        </tr>
                     </tbody>
                  </table>
                  <div class="subtext">
                     <span class="fas fa-exclamation-circle"></span>
                     <span class="comment">중개수수료는 실제 적용되는 금액과 다를
                     수 있으니, 계약 전 확인이 필요합니다.</span>
                  </div>
               </div>
            </div>
         </div>
         </div> <!-- 본문 영역 end -->


         <!-- 사이드 바 영역 -->
         <div class="col-xs-4" style="height: 400px;">
            <div class="affix" data-spy="affix" data-offset-top="0" data-offset-bottom="339">
               <div class="main_side panel panel-default" style="margin:0;">
                  <div class="container inside_side">
                     <div class="M_Number">
                        <span class="M_Number_item1">매물번호</span>
                        <span class="M_Number-item2">${output.maemul_num}</span>
                     </div>
                     <div class="well" id="well_side">
                        <div class="M_price">
                           <c:choose>
                              <c:when test="${output.select_sale eq 'Y'}">
                                 <span class="price-kind">월세</span>
                                 <span class="price">${output.warrenty}/${output.monthly}</span>
                                 <span class="price-level">만원</span>
                              </c:when>
                              <c:otherwise>
                                 <span class="price-kind">매매</span>
                                 <span class="price">${output.sale}</span>
                                 <span class="price-level">만원</span>
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div> <!-- jumbo end -->
                     <div class="M_location">
                        <div class="location_grid">
                           <span class="M_location_item">${output.item_addrst}</span>
                        </div>
                        <div class="location_grid2">
                           <span class="M_location_item2">${output.title}</span>
                        </div>
                     </div>
                     <div class="M_icon" id="icon_box" style="margin-top: 12px;">
                        <ul class="list-inline">
                           <li class="M_icon_item1"><span class="fas fa-building"></span></li>
                           <li class="M_icon_item2"><span class="fas fa-arrows-alt"></span></li>
                           <li class="M_icon_item3"><span class="fas fa-arrows-alt-v"></span></li>
                           <li class="M_icon_item4"><span class="fas fa-shield-alt"></span></li>
                        </ul>
                     </div>
                     <div class="office">
                        <div class="office_name">
                           <span class="office_name_item"><strong>${coOutput.co_name}</strong></span>
                        </div>
                        <div class="office_info">
                           <div class="profile-default">
                              <img alt="" src="${pageContext.request.contextPath}/download.do?file=${coOutput.broker_img}">
                           </div>
                           <div class="office_info_item">
                              <div class="office_info_name">
                                 <span class="office_info_name_item">${coOutput.boss_name}</span>
                              </div>
                              <div class="office_info_address">
                                 <span class="office_info_address_item">${coOutput.office_addr}</span>
                              </div>
                           </div>
                           <div class="office_info_detail">
                              <span>
                              <button type="button" class="form-control btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2" id="button">연락처 보기</button>
                              </span>
                           </div>
                        </div>
                     </div> <!-- office end -->
                  </div> <!-- container end -->
               </div>
            </div>
         </div> <!-- 사이드 바 영역 END -->
         <!-- Modal -->
         <div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
               <div class="modal-content">
                  <div class="modal-header" style="border-style: none;">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="position: relative;  bottom: 10px; display: inline-block; font-size: 50px;">
                        &times;
                     </button>
                  </div>
                  <div class="modal-body" style="text-align: center;">
                     <div class="modal_profile_default">
                        <img class="fa-user" alt="" src="${pageContext.request.contextPath}/download.do?file=${coOutput.broker_img}">
                     </div>
                     <div class="I_Number">담당자 연락처</div>
                     <div class="I_Title"><STRONG>
                        <span class="I_Name">${coOutput.assi_name}</span>
                        (<span class="I_Tname" id="coPosition"></span>)
                     </STRONG></div>
                     <div class="modal_M_Number">
                        <div class="alert alert-info" role="alert">
                             <span class="M_Number_title">매물번호</span>
                             <span class="M_Number_value">${output.maemul_num}</span>
                        </div>
                     </div>
                     <hr />
                     <div class="Explain">
                        "세모 보고 연락드렸습니다."라고 말씀하신 후<br>
                        매물번호를 알려주시면 친절하게 안내받으실 수 있습니다.
                     </div>
                  </div> <!-- modal-body end -->
                  <div class="modal-footer bg-info">
                     <div class="Modal_office_Name">
                        <span class="Modal_office_name_item">${coOutput.boss_name}</span>
                        (<span class="Modal_office_position">대표 <span class="Modal_office_Tname"></span>${coOutput.boss_name}</span>)
                     </div>
                     <div class="Modal_office_address">
                        <span class="adrress_item">
                           	${coOutput.office_addr}
                        </span>
                     </div>
                     <div class="Modal_I_Phone">
                        대표번호:<span class="Modal_I_Phone_item">${coOutput.tel}</span>
                     </div>
                  </div>
               </div>
            </div> <!-- moda-dialog end -->
         </div> <!-- modal end -->
      </div>
   </div>
   <!-- Footer -->
   <div class="footer">

   </div>
   <!-- Footer END -->
</div>
<!-- 컨텐츠  END -->

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
<script type="text/javascript">

	$(function(){
		var position;
		if (${coOutput.position eq "A"}) {
			position = "대표공인중개사";
		} else if (${coOutput.position eq "B"}) {
			position = "소속공인중개사";
		} else {
			position = "중개보조원";
		}

		$("#coPosition").html(position);
	});

</script>
</body>
</html>
