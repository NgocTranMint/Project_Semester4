<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:layout_admin title="Faculty - Dashboard">

	<jsp:attribute name="content">
	<div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Revenue and exam analysis</h1>
          </div>
					<!-- /.col -->
        
					<!-- /.col -->
        </div>
				<!-- /.row -->
      </div>
			<!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div id="chartdiv"
			style="width: 100%; height: 400px; background-color: #FFFFFF;"></div>
     <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            	
            	 <div class="card">
              <div class="card-header">
                <h3 class="card-title">Details</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-sm">
                  <thead>
                    <tr>
                      <th style="width: 10px"></th>
                      <th>Title</th>
                      <th style="width: 40px">USD</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td>Total income in 2022</td>
                    
                      <td><span class="badge bg-danger">${totalincome }</span></td>
                    </tr>
                   
                    <tr>
                      <td>3.</td>
                      <td>Total times do test in 2022</td>
                     
                      <td><span class="badge bg-primary">${totaldotest}</span></td>
                    </tr>
                   
                  </tbody>
                </table>
                 
              </div>
             </div>
             
              <!-- /.card-body -->
            </div>
              <div class="col-md-6">
            <div class="card">
            <div class="card-header">
                <h3 class="card-title">
Number of exams in 2022</h3>
              </div>
              <div class="card-body p-0">
               <div class="card" id="chartdiv2"
									style="width: 100%; height: 400px; background-color: #FFFFFF;"></div>
              </div>
            </div>
    <!-- /.content -->
    </div>
        </div>
        <!-- /.row -->
      </div>
			<!-- /.container-fluid -->
    </section>
	
	</jsp:attribute>
</mt:layout_admin>
<script type="text/javascript"
	src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript"
	src="https://www.amcharts.com/lib/3/serial.js"></script>
<script type="text/javascript"
	src="https://www.amcharts.com/lib/3/themes/dark.js"></script>
<script type="text/javascript"
	src="https://www.amcharts.com/lib/3/radar.js"></script>

<!-- amCharts javascript code -->
<script type="text/javascript">
			AmCharts.makeChart("chartdiv",
				{
					"type": "serial",
					"categoryField": "category",
					"angle": 30,
					"depth3D": 30,
					"startDuration": 1,
					"categoryAxis": {
						"gridPosition": "start"
					},
					"trendLines": [],
					"graphs": [
						{
							"balloonText": "[[title]] of [[category]]:[[value]]",
							"fillAlphas": 1,
							"id": "AmGraph-1",
							"title": "Net Value",
							"type": "column",
							"valueField": "column-1"
						}
					],
					"guides": [],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"stackType": "3d",
							"title": "USD"
						}
					],
					"allLabels": [],
					"balloon": {},
					"legend": {
						"enabled": true,
						"useGraphSettings": true
					},
					"titles": [
						{
							"id": "Title-1",
							"size": 15,
							"text": ${year}
						}
					],
					"dataProvider": ${category}
				}
			);
		</script>
<script type="text/javascript">
	AmCharts.makeChart("chartdiv2", {
		"type" : "radar",
		"categoryField" : "country",
		"startDuration" : 2,
		"graphs" : [ {
			"balloonText" : "[[value]] Clicks in thish month",
			"bullet" : "round",
			"id" : "AmGraph-1",
			"valueField" : "litres"
		} ],
		"guides" : [],
		"valueAxes" : [ {
			"axisTitleOffset" : 20,
			"gridType" : "circles",
			"id" : "ValueAxis-1",
			"minimum" : 0,
			"axisAlpha" : 0.15,
			"dashLength" : 3
		} ],
		"allLabels" : [],
		"balloon" : {},
		"titles" : [],
		"dataProvider" : ${category2}
	});
</script>