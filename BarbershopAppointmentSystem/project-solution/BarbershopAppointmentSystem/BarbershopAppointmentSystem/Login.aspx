<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BarbershopAppointmentSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
    <title>Login - Barber's Den</title>
    <meta property="og:type" content="website"/>
    <meta name="description" content="Designed for barbershops which creates a network between the barbershop and the customer, by allowing the customer to book their preferred service for their preferred time and date."/>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"/>
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css"/>
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css"/>
    <link rel="stylesheet" href="assets/fonts/line-awesome.min.css"/>
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css"/>
    <link rel="stylesheet" href="assets/css/barber.css"/>
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10">
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-flex">
                                <div class="flex-grow-1 bg-login-image" style="background-image: url(&quot;assets/img/dogs/image3.jpeg&quot;);"></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h4 class="text-dark mb-4">Welcome Back!</h4>
                                    </div>
                                    <form class="user" runat="server">
                                        <div class="form-group"><input runat="server" class="form-control form-control-user" type="email" id="tbEmail" aria-describedby="emailHelp" placeholder="Enter Email Address..." name="email" autofocus="" required="" inputmode="email"/></div>
                                        <div class="form-group"><input runat="server" class="form-control form-control-user" type="password" id="tbPassword" placeholder="Password" name="password" required=""/></div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <div class="form-check"><input runat="server" class="form-check-input custom-control-input" type="checkbox" id="chkRememberMe"/><label runat="server" class="form-check-label custom-control-label" for="chkRememberMe">Remember Me</label></div>
                                            </div>
                                        </div><button class="btn btn-primary btn-block text-white btn-user" type="submit">Login</button>
                                        <hr>
                                    </form>
                                    <div class="text-center"><a class="small" href="forgot-password.html">Forgot Password?</a></div>
                                    <div class="text-center"><a class="small" href="register.html">Create an Account!</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/barber.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
</body>
</html>
