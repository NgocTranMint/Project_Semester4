<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" type="image/png" href="~/client/images/icon.png" />
	<script type="text/javascript">
	
	    function countdown() {
	        seconds = document.getElementById("timerLabel").innerHTML;
	        if (seconds > 0) {
	            document.getElementById("timerLabel").innerHTML = seconds - 1;
	            setTimeout("countdown()", 1000);
	        }
	    }
	    setTimeout("countdown()", 1000);
	
	
	</script>
</head>
<head>
    <title>Reset Password Form In Bootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300i,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
         body {
         background-color: #17c0eb;
         font-family: Nunito Sans;
         }
         .btn {
         background-color: #17c0eb;
         width: 100%;
         color: #fff;
         padding: 10px;
         font-size: 18px;
         }
         .btn:hover {
         background-color: #2d3436;
         color: #fff;
         }
         input {
         height: 50px !important;
         }
         .form-control:focus {
         border-color: #18dcff;
         box-shadow: none;
         }
         h3 {
         color: #17c0eb;
         font-size: 36px;
         }
         .cw {
         width: 35%;
         }
         @*@media(max-width: 992px) {
         .cw {
         width: 60%;
         }
         }
         @media(max-width: 768px) {
         .cw {
         width: 80%;
         }
         }
         @media(max-width: 492px) {
         .cw {
         width: 90%;
         }
         }
             *@
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="bg-white text-center p-5 mt-3 center" style="height: 520px; width: 55%;">
            <h3>Forgot Password </h3>
            
            <form class="pb-3" method="post" action="${pageContext.request.contextPath }/user/forgotpassword/checkEmail">
                <div class="form-group">
                    <label class="control-label">Email:</label>
                    <input type="email" class="form-control" name="email" placeholder="Enter your email" required /><br>

                    <input type="submit" class="btn btn-primary" value="Send" />
                    
                    <span class="text-danger">${msgError }</span>
                    <span class="text-success">${msgSuccess }</span>
                </div>
            </form>
            <br />
            <form class="pb-3" method="post" action="${pageContext.request.contextPath }/user/forgotpassword/checkCode">
                <div class="form-control">
                    <label class="control-label">Code:</label>
                    <input type="text" class="form-control" name="codeconfirm" placeholder="Enter Code" required />

                    <input type="hidden" name="email" value="email" />
                    <span class="text-danger">${msgCode }</span>
                    <input type="submit" class="btn btn-primary" value="Check" />
                </div>
            </form>
        </div>
    </div>
</body>
</html>
  