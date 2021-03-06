<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/Pw_reset.css" />

<title>세모- 상가 중개사이트</title>
</head>
<body>
   <!-- 상단 메뉴 바 -->
   <%@ include file="assets/include/header.jsp" %>
   <!--  로그인 Modal -->
   <%@ include file="assets/include/loginmodal.jsp" %>

   <!-- 컨텐츠 -->
   <div class="content">
      <div class="container content-container">
         <div class="content-top">
            <h2>비밀번호 초기화</h2>
            <p>새로운 비밀번호로 초기화 하세요.</p>
         </div>
         <form action="Pw_edit.do" method="post" onsubmit="toEnabled()">
         <div class="content-body">
            <div class="pwch-title">
               <span class="title">비밀번호 초기화</span><br>
               <span class="subtitle">회원가입시 입력한 이메일 주소와 새 비밀번호를 입력하세요.</span>
            </div>
               
               <table class="table">
                  <tr>
                     <th class="th">
                        이메일
                     </th>
                     <td class="td">
                        <input type="text" class="form-control email" name="email" value="${mailId}" disabled/>
                        <span class="alertEmail"></span>
                     </td>
                  </tr>
                  <tr>
                     <th class="th">
                        비밀번호
                     </th>
                     <td class="td">
                        <input type="password" class="form-control passwd" name="passwd" required/>
                     </td>
                  </tr>
                  <tr>
                     <th class="th">
                        비밀번호 확인
                     </th>
                     <td class="td">
                        <input type="password" class="form-control repasswd" name="repasswd" required/>
                        <span class="alertrePasswd"></span>
                     </td>
                  </tr>
               </table>
            
            </div>
         <input type="submit" class="btn btn-primary pwchEmail" id="pwchEmail" value="비밀번호 초기화" />
         </form>   
      </div>
   </div>


   <!-- 컨텐츠  END -->
   <!-- Footer -->
   <div class="footer"></div>
   <!-- Footer END -->

   <!--------------------------- 복사하여 사용 하세요  END---------------------------->


   <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
   <script>
      $(function(){
         
         var email1 = $('.email');
         var passwd = $('.passwd');
         var repasswd = $('.repasswd');
         
         var alertEmail = $('.alertEmail');         
         var alertrepasswd = $('.alertrePasswd');
      
         
         email1.focus(function(){
            alertEmail.empty();
         });
         
         repasswd.focusout(function(){
            if (passwd.val()!=repasswd.val()){
               alertrepasswd.html('비밀번호가 다릅니다.').css("color","red");
               return false;
            }
            
         });
         repasswd.focus(function(){
            alertrepasswd.empty();
         });
      });
   
   </script>
   
   <script type="text/javascript">
		function toEnabled() {
			$("input[name=email]").attr("disabled", false);
		}
	</script>

</body>
</html>