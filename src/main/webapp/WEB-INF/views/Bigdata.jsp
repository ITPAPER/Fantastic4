<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <title>세모- 상가 중개사이트</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/Bigdata.css">
        
    </head>
    <style type="text/css">
/*------------- 복사해서 사용하세요  --------------------*/

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

.mymodal-body .adduser {
	margin-left: 55px;
}

.loginbtn {
	margin-top: 30px;
	display: inline-block;
	width: 270px;
}

/*------------- 복사해서 사용하세요 END --------------------*/
    </style>
    <body>
        <!--------------------------- 복사하여 사용 하세요 ---------------------------->
		<!-- 상단 메뉴 바 -->
			<%@ include file="assets/include/header.jsp" %>
		<!--  로그인 Modal -->
			<%@ include file="assets/include/loginmodal.jsp" %>

        <!-- 컨텐츠 -->
        <div class="content">
            <div class="body-content">
                <div class="main-space">          
                     <div class="commercialArea">                          
                        <h4 id="market">빅데이터 상권분석</h4>
                        </div>
                    <div class="container">
                        <div class="main-content">
                        <div class="page01" role="form" id="result01" style="display: block;">        
                        <!-- amchart 그래프 구현 -->                       
                                <h4>✔서울시 남녀 1인가구 비율</h4>
                                <div class="fontsty1">
       							<h2	class="font1">25~29세 남성</h2>
       							<h3>1인가구 비율이 가장 높습니다.</h3>
       							<h6>업데이트  2019.12</h6>
       							</div>
                                <div id="box1"></div>                                                                            
                                <h4>✔Top 10개 자치구별 창업 위험지수</h4>
                                <div class="fontsty2">
       							<h2	class="font1">송파구,강서구는</h2>
       							<h3>창업 위험지수가 높습니다!</h3>
       							<h6>업데이트  2019.12</h6>
       							</div>
                                <div id="box2"></div>
                         <!-- python 그래프 구현 -->  
                                <h4>✔자치구별 인구 비율</h4>
                                <div class="fontsty">
       							<h2	class="font1">송파구</h2>
       							<h3>인구수가 가장 많습니다.</h3>
       							<h6>업데이트  2019.12</h6>
       							</div>
                                <div id="box3"><img src="assets/data/jumin2.png"></div>    
                                <h4>✔2019년 월별 소비자 지출 태도</h4>
                                <div class="fontsty3">
       							<h2	class="font1">10월이</h2>
       							<h3>소비자 지출비율이 가장 높습니다.</h3>
       							<h6>업데이트  2019.12</h6>
       							</div>
                                <div id="box4"><img src="assets/data/jumin5.png"></div>
                            </div>
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
        <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://www.amcharts.com/lib/4/core.js"></script>
        <script src="https://www.amcharts.com/lib/4/charts.js"></script>
        <script src="https://www.amcharts.com/lib/4/maps.js"></script>
        <script src="https://www.amcharts.com/lib/4/geodata/usaAlbersLow.js"></script>
        <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
        // =======================box1 amchart 그래프 script=========================
     	// Themes begin
        am4core.useTheme(am4themes_animated);
        // Themes end

        var mainContainer = am4core.create("box1", am4core.Container);
        mainContainer.width = am4core.percent(100);
        mainContainer.height = am4core.percent(100);
        mainContainer.layout = "horizontal";
   
        var usData=${Json};
                

        var maleChart = mainContainer.createChild(am4charts.XYChart);
        maleChart.paddingRight = 0;
        maleChart.data = JSON.parse(JSON.stringify(usData));

        // Create axes
        var maleCategoryAxis = maleChart.yAxes.push(new am4charts.CategoryAxis());
        maleCategoryAxis.dataFields.category = "castle";
        maleCategoryAxis.renderer.grid.template.location = 0;
        //maleCategoryAxis.renderer.inversed = true;
        maleCategoryAxis.renderer.minGridDistance = 15;

        var maleValueAxis = maleChart.xAxes.push(new am4charts.ValueAxis());
        maleValueAxis.renderer.inversed = true;
        maleValueAxis.min = 0;
        maleValueAxis.max = 20;
        maleValueAxis.strictMinMax = true;

        maleValueAxis.numberFormatter = new am4core.NumberFormatter();
        maleValueAxis.numberFormatter.numberFormat = "#.#'%'";

        // Create series
        var maleSeries = maleChart.series.push(new am4charts.ColumnSeries());
        maleSeries.dataFields.valueX = "man";
        maleSeries.dataFields.valueXShow = "percent";
        maleSeries.calculatePercent = true;
        maleSeries.dataFields.categoryY = "castle";
        maleSeries.interpolationDuration = 1000;
        maleSeries.columns.template.tooltipText = "남자, 나이{categoryY}: {valueX} ({valueX.percent.formatNumber('#.0')}%)";
        //maleSeries.sequencedInterpolation = true;


        var femaleChart = mainContainer.createChild(am4charts.XYChart);
        femaleChart.paddingLeft = 0;
        femaleChart.data = JSON.parse(JSON.stringify(usData));

        // Create axes
        var femaleCategoryAxis = femaleChart.yAxes.push(new am4charts.CategoryAxis());
        femaleCategoryAxis.renderer.opposite = true;
        femaleCategoryAxis.dataFields.category = "castle";
        femaleCategoryAxis.renderer.grid.template.location = 0;
        femaleCategoryAxis.renderer.minGridDistance = 15;

        var femaleValueAxis = femaleChart.xAxes.push(new am4charts.ValueAxis());
        femaleValueAxis.min = 0;
        femaleValueAxis.max = 20;
        femaleValueAxis.strictMinMax = true;
        femaleValueAxis.numberFormatter = new am4core.NumberFormatter();
        femaleValueAxis.numberFormatter.numberFormat = "#.#'%'";
        femaleValueAxis.renderer.minLabelPosition = 0.01;


        // Create series
        var femaleSeries = femaleChart.series.push(new am4charts.ColumnSeries());
        femaleSeries.dataFields.valueX = "woman";
        femaleSeries.dataFields.valueXShow = "percent";
        femaleSeries.calculatePercent = true;
        femaleSeries.fill = femaleChart.colors.getIndex(4);
        femaleSeries.stroke = femaleSeries.fill;
        //femaleSeries.sequencedInterpolation = true;
        femaleSeries.columns.template.tooltipText = "여자, 나이{categoryY}: {valueX} ({valueX.percent.formatNumber('#.0')}%)";
        femaleSeries.dataFields.categoryY = "castle";
        femaleSeries.interpolationDuration = 1000;
        </script>
        
        <script>
      //=======================box2 amchart 그래프 script=========================  
        am4core.useTheme(am4themes_animated);
     // Themes end

     var chart = am4core.create("box2", am4charts.RadarChart);
     chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

     var label = chart.createChild(am4core.Label);
     label.text = "Drag slider to change radius";
     label.exportable = false;

     chart.data = ${Json2};
     
     chart.radius = am4core.percent(95);
     chart.startAngle = 270 - 180;
     chart.endAngle = 270 + 180;
     chart.innerRadius = am4core.percent(60);

     var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
     categoryAxis.dataFields.category = "city";
     categoryAxis.renderer.labels.template.location = 0.5;
     categoryAxis.renderer.grid.template.strokeOpacity = 0.1;
     categoryAxis.renderer.axisFills.template.disabled = true;
     categoryAxis.mouseEnabled = false;

     var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
     valueAxis.tooltip.disabled = true;
     valueAxis.renderer.grid.template.strokeOpacity = 0.05;
     valueAxis.renderer.axisFills.template.disabled = true;
     valueAxis.renderer.axisAngle = 260;
     valueAxis.renderer.labels.template.horizontalCenter = "right";
     valueAxis.min = 30;

     var series1 = chart.series.push(new am4charts.RadarColumnSeries());
     series1.columns.template.radarColumn.strokeOpacity = 1;
     series1.name = "9월";
     series1.dataFields.categoryX = "city";
     series1.columns.template.tooltipText = "{name}: {valueY.value}";
     series1.dataFields.valueY = "index9";
     series1.stacked = true;

     var series2 = chart.series.push(new am4charts.RadarColumnSeries());
     series2.columns.template.radarColumn.strokeOpacity = 1;
     series2.columns.template.tooltipText = "{name}: {valueY.value}";
     series2.name = "10월";
     series2.dataFields.categoryX = "city";
     series2.dataFields.valueY = "index10";
     series2.stacked = true;

     var series3 = chart.series.push(new am4charts.RadarColumnSeries());
     series3.columns.template.radarColumn.strokeOpacity = 1;
     series3.columns.template.tooltipText = "{name}: {valueY.value}";  
     series3.name = "11월";
     series3.dataFields.categoryX = "city";
     series3.dataFields.valueY = "index11";
     series3.stacked = true;

     var series4 = chart.series.push(new am4charts.RadarColumnSeries());
     series4.columns.template.radarColumn.strokeOpacity = 1;
     series4.columns.template.tooltipText = "{name}: {valueY.value}";
     series4.name = "12월";
     series4.dataFields.categoryX = "city";
     series4.dataFields.valueY = "index12";
     series4.stacked = true;
     
     

     chart.seriesContainer.zIndex = -1;

     var slider = chart.createChild(am4core.Slider);
     slider.start = 0.5;
     slider.exportable = false;
     slider.events.on("rangechanged", function() {
       var start = slider.start;

       chart.startAngle = 270 - start * 179 - 1;
       chart.endAngle = 270 + start * 179 + 1;

       valueAxis.renderer.axisAngle = chart.startAngle;
     });
        </script>
    </body>
</html>


