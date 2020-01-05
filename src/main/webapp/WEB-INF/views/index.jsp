<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>세모 - 상가 매물 중개 사이트</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/Main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icheck/css/blue.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/nouislider/nouislider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />

</head>
<body>
    <div class="content">
        <!-- 상단 메뉴 바 -->
        <!-- JSTL : 사용자 타입별 메뉴 변환 구현 191203 : 이재민 -->
        <%@ include file="assets/include/header.jsp"%>
        <!--  로그인 Modal -->
        <%@ include file="assets/include/loginmodal.jsp"%>

        <!-- 컨텐츠 -->
        <div class="select-menu">

            <!------------------------- 거래 유형 드롭다운 -------------------------------->
            <div class="dropdown trade">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="true">
                    거래유형<span class="caret"></span>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <h5>
                        <b>거래유형</b>
                    </h5>
                    <input type='radio' class='ichecked' id="selectAll" name="salestype" value="" checked /> &nbsp; 전체 <br> <input type='radio' class='ichecked' name="salestype" value="Y"> &nbsp; 월세<br> <input
                        type='radio' class='ichecked' name="salestype" value="N"> &nbsp; 매매
                </div>
            </div>


            <!-------------------------------- 가격 드롭다운 -------------------------------->
            <div class="dropdown price">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2 mydropdown" data-toggle="dropdown" aria-expanded="true">
                    가격 <span class="caret"></span>
                </button>
                <div class="dropdown-menu pricemenu" aria-labelledby="dropdownMenu2">
                    <h5>
                        <b>보증금/매매가</b>
                    </h5>
                    <div id="salesrange" class="priceSales">
                        <span class="startprice" id="startprice">0</span> <span class="centerprice">1억7,000만원</span> <span class="endprice" id="endpirce">무제한</span>
                    </div>
                    <hr>
                    <h5>
                        <b>월세</b>
                    </h5>

                    <div id="monthrange" class="mpriceSales">
                        <span class="mstartprice" id="mstartprice">0</span> <span class="mcenterprice">500만원</span> <span class="mendpirce" id="mendpirce">무제한</span>
                    </div>
                </div>

            </div>

            <!-------------------------------- 전용면적 드롭다운 -------------------------------->
            <div class="dropdown area">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="true">
                    전용면적 <span class="caret"></span>
                </button>
                <div class="dropdown-menu areamenu" aria-labelledby="dropdownMenu2">
                    <h5>
                        <b>전용면적</b>
                    </h5>
                    <div id="arearange" class="dediArea">
                        <span class="startarea" id="startarea">0</span> <span class="centerarea">264㎡ (80평)</span> <span class="endarea" id="endarea">무제한</span>
                    </div>
                </div>
            </div>
            <!-- ------------------------------ 상세검색 드롭다운 ---------------------------- -->
            <div class="dropdown price">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="true">
                    상세검색 <span class="caret"></span>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu2" style="width: 250px;">
                    <input onkeypress="if( event.keyCode == 13 ){center();}" type="search" name="add_search" id="add_search" class="form-control search" placeholder="지역검색" style="float: left; width: 185px;"> <span
                        class="input-group-btn">
                        <button type="submit" class="btn searchB" style="float: left;">
                            <i class="fas fa-search"></i>
                        </button>
                    </span>
                </div>
            </div>
        </div>

        <!-- -------------------------------- 카카오 맵 ---------------------------------- -->
        <div class="main-content">
            <div class="row main-content">
                <div id="map" class="col-md-9 map"></div>
                <!-- -------------------------------- 매물 리스트  ------------------------------------ -->
                <div class="col-md-3 list">
                    <div class="listheader" style="border-bottom: 1px solid red;">매물 리스트</div>
                    <div class="listcount">
                        <span>검색결과</span> <span class="maemulCount" style="color: red;"></span> <span>개</span>
                    </div>
                    <div class="maemulList" style="overflow-x: hidden; overflow-y: scroll">
                        <div id="listdiv">
                            <!-- 매물리스트 자리  -->
                            <!-- 테스트중 -->
                        </div>
                    </div>
                    <!-- pagenation -->
                    <div class="pageCount">
                        <a href="http://www.hillstate.co.kr" target="_blank"><img src="${pageContext.request.contextPath}/assets/img/HS.jpg"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script id="maemul-list-tmpl" type="text/x-handlebars-template">
{{#output}}
    {{#if monthly}}
        <div class="list-item" OnClick="window.open('${pageContext.request.contextPath}/view.ok?maemul_num={{maemul_num}}')" style="cursor: pointer;">
          <div class="image-container">
              <div class="image" style="background-image: url(${pageContext.request.contextPath}/download.do?file={{File_path}});"></div>
          </div>
       <div class="price-container">
           <div class="primary">
               <span>월세</span> <span>{{warrenty}}/{{monthly}}</span>
           </div>
           <div class="premium">
            {{#if premium}}
               권리금{{premium}}만원
              {{else}}
                                    권리금 없음
              {{/if}}
           </div>
       </div>
       <div class="detail-container">
           <div class="location">{{item_addrst}}</div>
           <div class="option">
               <span>
               {{#Jiha}}{{floor}}{{/Jiha}}
            </span>
            <span> | </span><span>{{all_width}}평</span><span> | </span>
            <span>
                   {{#if manage_ex}}
                                             관리비{{manage_ex}}만
                        {{else}}
                                             관리금 없음
                    {{/if}}
            </span>
        </div>
        <div class="tag">
            {{#if parking}}
                <span class="option-tag">주차</span>
            {{/if}}
            {{#if elv}}
                <span class="option-tag">엘리베이터</span>
            {{/if}}
        </div>
       </div>
   </div>

   {{else}}

   <div class="list-item" OnClick="window.open('${pageContext.request.contextPath}/view.ok?maemul_num={{maemul_num}}')" style="cursor: pointer;">
       <div class="image-container">
           <div class="image" style="background-image: url(${pageContext.request.contextPath}/download.do?file={{File_path}});"></div>
       </div>
       <div class="price-container">
           <div class="primary">
               <span>매매</span> <span>{{sale}} 만원</span>
           </div>
           <div class="premium">
            {{#if premium}}
                                     권리금{{premium}}만원
                {{else}}
                                     권리금 없음
                {{/if}}
           </div>
       </div>
       <div class="detail-container">
           <div class="location">{{item_addrst}}</div>
           <div class="option">
               <span>
               {{#Jiha}}
                  {{floor}}
                  {{/Jiha}}
            </span>
            <span> | </span><span>{{all_width}}평</span><span> | </span>
         <span>
               {{#if manage_ex}}
                                      관리비{{manage_ex}}만
               {{else}}
                                      관리금 없음
               {{/if}}
         </span>
        </div>
        <div class="tag">
            {{#if parking}}
                <span class="option-tag">주차</span>
            {{/if}}
            {{#if elv}}
                <span class="option-tag">엘리베이터</span>
            {{/if}}
        </div>
    </div>
   </div>
    {{/if}}
{{/output}}
   </script>
    <!-- 컨텐츠  END -->


    <!--------------------------- 복사하여 사용 하세요  END---------------------------->
    <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98a9ba7245ae5c0929fafa188dbfaf9a&libraries=libraries=services,clusterer,drawing"></script>
    <script type="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <!-- Handlebar CDN 참조 -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/nouislider/nouislider.min.js"></script>
    <script>

   // =========================================핸들바 조건문을 위한 핸들바핼퍼입니다.=========================================
   Handlebars.registerHelper('Jiha', function(options) {
       if(this.floor == 300) {
          return "지하3층";
       } else if(this.floor == 200) {
          return "지하2층";
       } else if(this.floor == 100) {
          return "지하1층";
       } else {
          return options.fn(this)+"층";
       }
      });
   // =============================================================================================================

   // ======================================카카오Map 객체를 생성합니다.=================================================

      //KAKAO api javascript
      var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

      var options = { //지도를 생성할 때 필요한 기본 옵션
         center : new kakao.maps.LatLng(37.497972, 127.027720), //지도의 중심좌표.
         level : 5
      //지도의 레벨(확대, 축소 정도)
      };

      var map = new kakao.maps.Map(container, options);
      /**************** 마커 *************************/

      // 마커 클러스터러를 생성합니다
      var clusterer = new kakao.maps.MarkerClusterer({
         map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
         averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
         minLevel : 1,
         disableClickZoom: true
      // 클러스터 할 최소 지도 레벨
      });

      var control = new kakao.maps.ZoomControl();
      map.addControl(control, kakao.maps.ControlPosition.TOPRIGHT);
      // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
      var mapTypeControl = new kakao.maps.MapTypeControl();

      // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
      // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

   // =============================================================================================================

   // ==========================================처음 셋업시 지도에 마커를 찍습니다.==========================================


      $.get("${pageContext.request.contextPath}/Mjson",{}, function(data) {
         // 데이터에서 좌표 값을 가지고 마커를 표시합니다
         // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
         var markers = $(data.positions).map(
            function(i, position) {
               var content = position.maemul_num;
               return new kakao.maps.CustomOverlay({
                  position : new kakao.maps.LatLng(position.lat, position.lng, position.maemul_num),
                  // 매물번호를 입력
                  content :"" + content
               });
            });
         //console.log(data.positions);
         clusterer.setMinClusterSize(1);
         // 클러스터러에 마커들을 추가합니다
         clusterer.addMarkers(markers);

   //======================================= 처음 셋업시 매물리스트를 뿌립니다. =======================================
         var item = markers;

          var M_number = new Array();
          for(var i=0; i<item.length; i++) {
             //인덱스 지정해서 넣어야 함
             M_number[i] = item[i].getContent();
          }
             // Ajax 전송시 배열로 넘기면 data[]=&daa2[]=2 이런식으로감 그걸 방지하는 구문
             $.ajaxSettings.traditional = true;
             $.ajax({
                 "url": "maemul",
                 "type": "get",
                 "data": {M_number : M_number},
                 "dataType": "json",
                 // 요청을 한개씩 주고받고
                 "async" : false,
                 "success": function(data) {
                       var source = $("#maemul-list-tmpl").html();
                       var template = Handlebars.compile(source);
                       // 여기서 한뎁스 들어감
                       var result = template(data);

                       $("#listdiv").append(result);
                       //매물개수
                       var maemulCount = $('.list-item').length;
                       $(".maemulCount").html(maemulCount);
                 }
             });


      });
      // ==========================================(END)처음 셋업시 지도에 마커를 찍습니다.==========================================

      //======================================= 필터링 발생시 실행됩니다. =======================================
      function center() {
         $("#listdiv").empty();
         $(".maemulCount").empty();
         var result = Select_sale();
         var result2 = Salesrange();
         var result3 = Monthrange();
         var result4 = Arearange();
         var add =search_return();
         var item_addrst = add;
         var Fmin = result2[0];
         var Fmax = result2[1];
         var Wmin = result3[0];
         var Wmax = result3[1];
         var Amin = result4[0];
         var Amax = result4[1];
         $(".maemulCount").append("0");
         //${pageContext.request.contextPath}/
         $.get("Mjson",{select_sale : result, Fmin:Fmin, Fmax:Fmax, Wmin:Wmin, Wmax:Wmax,
            Amin:Amin, Amax:Amax,item_addrst: item_addrst}, function(data) {
            // 데이터에서 좌표 값을 가지고 마커를 표시합니다
            // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
            var markers = $(data.positions).map(
               function(i, position) {
                  var content = position.maemul_num;
                  return new kakao.maps.CustomOverlay({
                     position : new kakao.maps.LatLng(position.lat, position.lng),
                     content :"" + content
                  });
               });
            // 클러스터 초기화
            clusterer.clear();
            clusterer.setMinClusterSize(1);
            // 클러스터러에 마커들을 추가합니다
            clusterer.addMarkers(markers);
         });

         // 필터링 작동시 리스트란에 이미지 추가
         $("#listdiv").html("<img src='${pageContext.request.contextPath}/assets/img/Etest.jpg' style='width: 100%; height:100%;'>");
         $(".maemulList").scrollTop(100);
      }
      // =============================================================================================================
      // 마커 클러스터러에 클릭이벤트를 등록합니다
       // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
       // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
      // ==========================================마커 클러스터 클릭시 활성화==========================================
       kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
          // 리스트란  초기화
          $("#listdiv").empty();
          var item = cluster.getMarkers();
          var M_number = new Array();
          for(var i=0; i<item.length; i++) {
            M_number[i] = item[i].getContent();
          }
             $.ajaxSettings.traditional = true;
             $.ajax({
                 "url": "maemul",
                 "type": "get",
                 "data": {M_number : M_number},
                 "dataType": "json",
                 "async" : false,
                 "success": function(data) {
                       var source = $("#maemul-list-tmpl").html();
                       var template = Handlebars.compile(source);
                       // 여기서 한뎁스 들어감
                       var result = template(data);
                       $("#listdiv").append(result);
                       //매물개수
                       var maemulCount = $('.list-item').length;
                       $(".maemulCount").html(maemulCount);
                 }
             });

          // 조회후 스크롤바를 초기화 해주기 위한 스크립트
          $(".maemulList").scrollTop(0);
           // 현재 지도 레벨에서 1레벨 확대한 레벨
           var level = map.getLevel()-1;

           // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
           map.setLevel(level, {anchor: cluster.getCenter()});

       });
    // =============================================================================================================

      //KAKAO API javaxcript END

      <!-- 메인의 광고이미지 기능 구현입니다. -->
      var imgtest = [];
      imgtest[0] =  '<a href="http://www.hillstate.co.kr" target="_blank"><img src="${pageContext.request.contextPath}/assets/img/HS.jpg"></a>'
      imgtest[1] =  '<a href="https://www.kiwoom.com" target="_blank"><img src="${pageContext.request.contextPath}/assets/img/KM.jpg"></a>'
      imgtest[2] =  '<a href="https://www.kakaocorp.com/service/KakaoStory" target="_blank"><img src="${pageContext.request.contextPath}/assets/img/KS.png"></a>'
      imgtest[3] =  '<a href="https://www.nexon.com/Home/Game" target="_blank"><img src="${pageContext.request.contextPath}/assets/img/NS.jpg"></a>'
      imgtest[4] =  '<a href="https://www.prugio.com" target="_blank"><img src="${pageContext.request.contextPath}/assets/img/PG.png"></a>'

     // 난수생성을 위한 기능구현
      var randomNum = function(min, max) {
         var ranNum = Math.floor(Math.random()*(max-min+1)) + min;
         return ranNum;
      }

      // 5초에 한번씩 실행
      setInterval(onchange, 5000);

      function onchange() {
        // 광고입력란 초기화
         $('.pageCount').empty();
         var ranNum = randomNum(0, 4);
         var dumi = imgtest[ranNum];
         var gigi = $('.pageCount').append(dumi);
         $('.pageCount a').find('img').attr('style', 'width:100%; height:80px;');
      }
      <!-- //메인의 광고이미지 기능 구현입니다.(END) -->

      $(function() {
         //icheck plugin적용
         $(".ichecked").iCheck({
            checkboxClass : 'icheckbox_flat-blue',
            radioClass : 'iradio_flat-blue'
         });
         s_type();
         search();
      });
      function Select_sale(e) {
            var select_sale = $("input[name='salestype']:checked").val();
            return select_sale;
      }
      function Salesrange(e) {
         var Salesrange = salesrange.noUiSlider.get();
         var result = new Array();
          for(var l=0; l<Salesrange.length; l++) {
             var jum = Salesrange[l].indexOf(".");
             result[l] = Salesrange[l].substring(0, jum);
          }

         return result;
      }
      function Monthrange(e) {
         var Monthrange = monthrange.noUiSlider.get();
         var result = new Array();
         for(var k = 0; k<Monthrange.length; k++) {
            var jum = Monthrange[k].indexOf(".");
            result[k] = Monthrange[k].substring(0, jum);
         }
         return result;
      }
      function Arearange(e) {
         var Arearange = arearange.noUiSlider.get();
         var result = new Array();
         var jum;
         for(var k = 0; k<Arearange.length; k++) {
            jum = Arearange[k].indexOf(".");
            result[k]  = Arearange[k].substring(0, jum);
         }
         return result;
      }
      function s_type() {
         $('.ichecked').on('ifChecked', function(event) {
            select_sale = $(this).val();
            return center();
         });
      }
      function search() {
         $('.searchB').click(function() {
            var add = $('#add_search').val();
            return center();
         });
      }
      function search_return() {
          add = $('#add_search').val();
         return add;
      }

      /* 필터 -드롭다운 - 자동 toggle 해제 */
      $('.dropdown-menu').click(function(e) {
         e.stopPropagation();
      })

      /********************* 보증금 noUIslider **********************/
      var salesrange = document.getElementById('salesrange');
      noUiSlider.create(salesrange, {
         start : [ 0, 200000 ],
         connect : true,
         range : {
            'min' : [ 0, 100 ],
            '10%' : [ 500, 500 ],
            '20%' : [ 5000, 1000 ],
            '50%' : [ 20000, 5000 ],
            '80%' : [ 100000, 10000 ],
            'max' : [ 200000 ]
         }

      });
      var nodes = [ document.getElementById('startprice'), // 0
      document.getElementById('endpirce') // 1
      ];

      // Display the slider value and how far the handle moved
      // from the left edge of the slider.

      salesrange.noUiSlider.on('update', function(values, handle, unencoded,
            isTap, positions) {
          val = Math.floor(values[handle]);
         if (val == 0) {
            nodes[handle].innerHTML = val + "원";
         } else if (val < 10000) {
            nodes[handle].innerHTML = val + "만원";
         } else if (val >= 10000 || val < 199999) {
            nodes[handle].innerHTML = val / 10000 + "억";
         } else if (val >= 199999) {
            nodes[handle].innerHTML = "무제한";
         }
         //console.log(salesrange.noUiSlider.get());

      });
      $(".noUi-touch-area").mouseup(function() {
            console.log(salesrange.noUiSlider.get());
            center();
      });

      /********************* 월세 noUIslider **********************/
      var monthrange = document.getElementById('monthrange');
      noUiSlider.create(monthrange, {
         start : [ 0, 200000 ],
         connect : true,
         range : {
            'min' : [ 0, 50 ],
            '50%' : [ 500, 100 ],
            '80%' : [ 3000, 1000 ],
            'max' : [ 10000 ]
         }
      });
      var nodes1 = [ document.getElementById('mstartprice'), // 0
      document.getElementById('mendpirce') // 1
      ];

      // Display the slider value and how far the handle moved
      // from the left edge of the slider.
      monthrange.noUiSlider.on('update', function(values, handle, unencoded,
            isTap, positions) {
         var val = Math.floor(values[handle]);
         if (val == 0) {
            nodes1[handle].innerHTML = val + "원";
         } else if (val < 10000) {
            nodes1[handle].innerHTML = val + "만원";
         } else if (val == 10000) {
            nodes1[handle].innerHTML = "무제한";
         }

      });
      $(".noUi-touch-area").mouseup(function() {
         console.log(monthrange.noUiSlider.get());
         center();
      });


      /*********************** 전용면적 noUIslider ************************/

      var arearange = document.getElementById('arearange');
      noUiSlider.create(arearange, {
         start : [ 0, 10000 ],
         connect : true,
         range : {
            'min' : [ 0, 10 ],
            '60%' : [ 100, 50 ],
            '90%' : [ 500, 100 ],
            'max' : [ 10000 ]
         }
      });
      var nodes2 = [ document.getElementById('startarea'), // 0
      document.getElementById('endarea') // 1
      ];

      // Display the slider value and how far the handle moved
      // from the left edge of the slider.
      arearange.noUiSlider.on('update', function(values, handle, unencoded,
            isTap, positions) {
         var val = Math.floor(values[handle]);
         if (val <= 500) {
            nodes2[handle].innerHTML = val * 3.3 + "㎡" + "(" + val + "평)";
         } else {
            nodes2[handle].innerHTML = "무제한";
         }
      });
      $(".noUi-touch-area").mouseup(function() {
         center();
      });

      //엔터로 로그인하기
    function searchData() {
      $('#loginForm').submit();
    }

   </script>
</body>
</html>
