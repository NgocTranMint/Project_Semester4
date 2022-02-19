<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:layout_admin title="Admin - Dashboard">

	<jsp:attribute name="content">
		   <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">New member analysis</h1>
          </div>
					<!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div>
					<!-- /.col -->
        </div>
				<!-- /.row -->
      </div>
			<!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
   
     <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-8">
            <div class="card">
            <div class="card-header">
                <h3 class="card-title">New member in 2022</h3>
              </div>
              <div class="card-body p-0">
                <div id="chartdiv"
							style="width: 100%; height: 400px; background-color: #FFFFFF;"></div>
              </div>
            </div>
    <!-- /.content -->
    </div>
          <div class="col-md-4">
            	
            	 <div class="card">
              <div class="card-header">
                <h3 class="card-title">Details</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-sm">
                  <thead>
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>Title</th>
                      
                      <th style="width: 40px">Label</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td>Total New User in 2022</td>
                      
                      <td><span class="badge bg-danger">${totalnewuser }</span></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td>Faculty</td>
                      
                      <td><span class="badge bg-warning">${newfaculty }</span></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td>Candidate</td>
                      
                      <td><span class="badge bg-primary">${newcandidate }</span></td>
                    </tr>
                    <tr>
                      <td>2.</td>
                      <td>Total User</td>
                      
                      <td><span class="badge bg-success">${totaluser }</span></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td>Faculty</td>
                      
                      <td><span class="badge bg-success">${totalfaculty }</span></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td>Candidate</td>
                      
                      <td><span class="badge bg-success">${totalcandidate }</span></td>
                    </tr>
                  </tbody>
                </table>
                 
              </div>
             </div>
             
              <!-- /.card-body -->
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
	src="https://www.amcharts.com/lib/3/radar.js"></script>



<!-- amCharts javascript code -->
<script type="text/javascript">
	AmCharts.makeChart("chartdiv", {
		"type" : "serial",
		"categoryField" : "category",
		"angle" : 30,
		"depth3D" : 30,
		"startDuration" : 1,
		"categoryAxis" : {
			"gridPosition" : "start"
		},
		"trendLines" : [],
		"graphs" : [ {
			"balloonText" : "[[title]] of [[category]]:[[value]]",
			"fillAlphas" : 1,
			"id" : "AmGraph-1",
			"title" : "Candidate",
			"type" : "column",
			"valueField" : "column-1"
		}, {
			"balloonText" : "[[title]] of [[category]]:[[value]]",
			"fillAlphas" : 1,
			"id" : "AmGraph-2",
			"title" : "Faculty",
			"type" : "column",
			"valueField" : "column-2"
		}

		],
		"guides" : [],
		"valueAxes" : [ {
			"id" : "ValueAxis-1",
			"stackType" : "3d",
			"title" : "Unit : Account"
		} ],
		"allLabels" : [],
		"balloon" : {},
		"legend" : {
			"enabled" : true,
			"useGraphSettings" : true
		},
		"titles" : [ {
			"id" : "Title-1",
			"size" : 15,
			"text" : "New member in 2022"
		} ],
		"dataProvider" : ${categories}
	});
</script>
