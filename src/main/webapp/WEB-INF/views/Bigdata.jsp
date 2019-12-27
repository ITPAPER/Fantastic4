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
                        <h4 id="market">상권 개요</h4>
                        </div>
                    <div class="container">
                        <div class="main-content">
                        <div class="page01" role="form" id="result01" style="display: block;">                               
                                <h4>1인가구</h4>
                                <div id="box1"></div>                                                                            
                                <h4>서울시 자치구별 인구수</h4>
                                <div class="box2"></div>  
                                <h4>서울시 직종별 사업체수</h4>
                                <div class="box3"></div>    
                                <h4>2019년 소비자 물가지수</h4>
                                <div class="box4"></div>
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
        <script src="https://www.amcharts.com/lib/4/core.js"></script>
        <script src="https://www.amcharts.com/lib/4/charts.js"></script>
        <script src="https://www.amcharts.com/lib/4/maps.js"></script>
        <script src="https://www.amcharts.com/lib/4/geodata/usaAlbersLow.js"></script>
        <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
        <script type="text/javascript">
        
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
    </body>
</html>


