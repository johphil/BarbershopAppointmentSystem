<%@ Page Title="" Language="C#" MasterPageFile="~/mainPage2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BarbershopAppointmentSystem.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                        </div>
                                        <asp:Button ID="btnLogin" runat="server" class="btn btn-primary btn-block text-white btn-user" type="submit" Text="Login" OnClick="btnLogin_Click"/>
                                        <hr/>
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
</asp:Content>
