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

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/Login.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/Maemul.manage.css">

<style type="text/css">
   body, html {
      height: 100%;
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
   min-height: 1000px;
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


</head>
<body>

<!--------------------------- 복사하여 사용 하세요 ---------------------------->
<!-- 상단 메뉴 바 -->
<%@ include file="assets/include/header.jsp" %>
<!-- 상단 메뉴 바  -->

<!-- 컨텐츠 -->
<div class="content">
    <div class="container">
        <div class="title">
            <span class="titlt-item">매물관리</span>
        </div>
        <div class="Title_Ex">
            <span class="title-ex-item">등록한 매물에 대한 상태 변경및 수정, 삭제가 가능합니다.</span>
        </div>
        <div class="select">
            <form action="${pageContext.request.contextPath}/maemul_manage_do" method="get">
                <div class="maemul-search input-group input-group-md">
                   <c:choose>
                      <c:when test="${keyword == 0}">
                         <input type="search" name="keyword" id="keyword" class="form-control search" placeholder="매물번호">
                      </c:when>
                      <c:otherwise>
                         <input type="search" name="keyword" id="keyword" class="form-control search" placeholder="매물번호"  value="${keyword}">
                      </c:otherwise>
                   </c:choose>
                    <span class="input-group-btn">
                        <button type="submit" class="btn"><i class="fas fa-angle-double-left"></i></button>
                    </span>
                </div>
            </form>
        </div>
      <div class="main">
          <div class="main-item">
              <table class="table table-hover">
                  <thead>
                      <tr>
                          <th>매물정보</th>
                          <th>등록정보</th>
                      </tr>
                      <tbody>
                          <c:choose>
                             <%--jstl null check test="${empty output}"  --%>
                             <c:when test="${output == null}">
                                <h1>조회결과가 없습니다.</h1>
                             </c:when>
                             <c:otherwise>
                                <c:forEach var="item" items="${output}" varStatus="status">
                                   <tr>
                              <td>
                                 <!-- ${pageContext.request.contextPath} NONO!!!! -->
                                 <c:url value="/view.ok" var="view">
                                    <c:param name="maemul_num" value="${item.maemul_num}"/>
                                 </c:url> 
                                  <a href="${view}"> 
                                     <div class="maemul" id="maemul">
                                         <div class="maemul-image">
                                         <%--????? --%>
                                              <span><img src="${pageContext.request.contextPath}/assets/upload${item.file_path}"></span>
                                          </div>
                                          <div class="maemul-detailed">
                                             <c:choose>
                                                   <c:when test="${item.select_sale eq 'Y'}">
                                                      <div class="maemul-type">
                                                           <span class="badge badge-type">월</span>
                                                           <span class="price">
                                                               <strong>${item.monthly}만원</strong>
                                                           </span>
                                                           
                                                           <span class="Gprice badge badge-gun">권</span>
                                                           <span class="Gprice-item">
                                                                  <strong>${item.warrenty}만원</strong>
                                                           </span>
                                                       </div>
                                                   </c:when>
                                                   <c:otherwise>
                                                      <div class="maemul-type">
                                                           <span class="badge badge-type" style="background-color: red">매매</span>
                                                           <span class="price">
                                                               <strong>${item.sale}만원</strong>
                                                           </span>
                                                           
                                                           <span class="Gprice badge badge-gun">보증금</span>
                                                           <span class="Gprice-item">
                                                               <strong>${item.pre_war}만원</strong>
                                                           </span>
                                                       </div>
                                                   </c:otherwise>
                                                </c:choose>
                                              <div class="maemul-simple">
                                                  <span class="maemul-top">${item.heating}</span>
                                                  <span class="maemul-top">${item.all_floor }층</span>
                                                  <span class="maemul-top">${item.floor}층</span>
                                                  <span class="maemul-top">${item.all_width }평</span>
                                                  <c:choose>
                                                     <c:when test="${item.manage_ex != 0}">
                                                        <span class="maemul-top">관리비
                                                            <span class="s_price">${item.manage_ex}</span>만</span>   
                                                     </c:when>
                                                     <c:otherwise>
                                                        <span class="maemul-top">관리비
                                                            <span class="s_price">없음</span></span>
                                                     </c:otherwise>
                                                  </c:choose>
                                                  
                                              </div>
                                              <!-- maemul-simple end -->
                                              <div class="maemul-address">
                                                  <div class="address-info">
                                                      <span class="info-head">주소정보:</span>
                                                      <span class="address-info-item">${item.item_addrst}</span>
                                                  </div>
                                                  <div class="address-road">
                                                      <span class="road-head">[건물이름]:</span>
                                                      <span class="address-road-item">${item.build_name}</span>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="function">
                                              <a href="${pageContext.request.contextPath}/maemul_update.do?maemul_num=${item.maemul_num}">
                                                 <button class="btn btn-primary update">수정</button>
                                              </a>
                                              <a href="${pageContext.request.contextPath}/maemul/delete_ok?maemul_num=${item.maemul_num}">
                                                 <button class="btn btn-primary delete">삭제</button>
                                              </a>
                                          </div>   
                                      </div> <!-- 매물 end --> 
                                  </a>
                              </td>
                              <td>
                                 <div class="register-info">
                                      <div class="maemul-number">
                                          <span class="maemul-number-item">매물번호:</span>
                                          <span class="number-position">${item.maemul_num}</span>
                                      </div>
                                      <div class="register">
                                          <span class="register-item">등록일:</span>
                                          <span class="register-position">${item.reg_date}</span>
                                      </div>   
                                 </div>
                              </td>
                          </tr>
                                </c:forEach>
                             </c:otherwise>
                          </c:choose>
                          
                      </tbody>
                  </thead>
              </table>
          </div>
      </div>
   <!-- 페이지 번호 구현부분 !!! -->
    <div class="page-number">
        <ul class="pagination pagination-lg">
           
    <!-- 페이지 번호 구현  -->
    <%--이전 그룹에 대한 링크  --%>
    <c:choose>
        <%-- 이전 그룹으로 이동가능하다면? --%>
        <c:when test="${pageData.prevPage> 0 }">
            <%--이동할 URL생성 --%>
            <c:url value="/maemul_manage_do" var="prevPageUrl">
                <c:param name="page" value="${pageData.prevPage}"/>
                <c:param name="keyword" value="${keyword}" />
            </c:url>
            <li>
              <a href="${prevPageUrl}" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
               </a>
          </li>
             
        </c:when>
        <c:otherwise>
            <li class="disabled"><span aria-hidden="true">&laquo;</span></li>
        </c:otherwise>
    </c:choose>
    
    <%--페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
    <c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
        <%--이동할 URL 생성 --%>
        <c:url value="/maemul_manage_do" var="pageUrl">
            <c:param name="page" value="${i}" />
            <c:param name="keyword" value="${keyword}"/>
        </c:url>
        
        <%--페이지 번호 출력 --%>
        <c:choose>
            <%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
            <c:when test="${pageData.nowPage == i}">
                  <li class="active"><span>${i}<span class="sr-only">(current)</span></span></li>
            </c:when>
            <%--나머지 페이지의 경우 링크 적용함 --%>
            <c:otherwise>
                <li><a href="${pageUrl}">${i}</a></li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    
    <%--다음 그룹에 대한 링크  --%>
    <c:choose>
        <%-- 다음 그룹으로 이동 가능하다면? --%>
        <c:when test="${pageData.nextPage > 0}">
            <%-- 이동할 URL 생성 --%>
            <c:url value="/maemul_manage_do" var="nextPageUrl">
                <c:param name="page" value="${pageData.nextPage}"/>
                <c:param name="keyword" value="${keyword}"/>
            </c:url>
            <li>
               <a href="${nextPageUrl}" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
               </a>
          </li>
        </c:when>
        <c:otherwise>
            <li class="disabled"><span aria-hidden="true">&raquo;</span></li>
        </c:otherwise>
    </c:choose>
        </ul>
    </div>
</div>
<!-- container -->
<!-- Footer -->
<div class="footer">

</div>
<!-- Footer END -->
</div>
<!-- 컨텐츠  END -->


<!--------------------------- 복사하여 사용 하세요  END---------------------------->


   <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
   <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
   <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
   <script type="text/javascript">
   
      function sakje(e) {
         $(".delete").click(function(e) {
            if(confirm("정말 삭제하시겠습니까?") == false) {
               return false;
            }
         });
      }
      
      function update(e) {
         $(".update").click(function(e) {
            if(confirm("수정할떄 매물이미지는 초기화됩니다 정말수정하겠습니까?") == false) {
               return false;
            }
         });
      }

      $(function() {
         sakje();
         update();
      });

      
   </script>
</body>
</html>