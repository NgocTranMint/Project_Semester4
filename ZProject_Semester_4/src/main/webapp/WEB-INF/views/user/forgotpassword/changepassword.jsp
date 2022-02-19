<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300i,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<style>
    body {
        background-image: url(${pageContext.request.contextPath }/resources/user/images/change-password.jpg);
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }
    .background {
        padding: 3%;
        border-radius: 25px;
        background-color: #97c5e982;
    }
</style>
<body>
    <div class="container" style="text-align: -webkit-center; padding: 5%">
            <div class="col-md-8 col-md-offset-2 background">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="alert alert-success">
                             <div class="text-danger">${error }</div>
                            <div class="text-info">${success }</div>
                        </div>
                        <h1>Change Password</h1>

<!--                         <div class="alert alert-info">
                            Your password has expired, please change it.
                        </div> -->
                        <form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/user/forgotpassword/changepassword">
                            <div class="form-group">
                                <label for="password" class="col-md-4 control-label">New Password</label>
                                <div class="col-md-6">
                                    <input id="password" name="password" type="password" class="form-control" required>
                                    <span class="help-block">
                                        <strong></strong>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password-confirm" class="col-md-4 control-label">Confirm New Password</label>
                                <div class="col-md-6">
                                    <input id="password-confirm" name="passwordConfirm" type="password" class="form-control" required>
                                    <span class="help-block">
                                        <strong></strong>
                                    </span>
                                </div>
                            </div>
                            <input type="hidden"/> <br />
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-4">
                                    <button type="submit" class="btn btn-primary">
                                        Reset Password
                                    </button>
                                </div>
                            </div>
                        </form>
                        <a type="button" href="${pageContext.request.contextPath }/user/home/index">Signin</a>

                    </div>
                </div>
            </div>
        </div>
</body>

</html>