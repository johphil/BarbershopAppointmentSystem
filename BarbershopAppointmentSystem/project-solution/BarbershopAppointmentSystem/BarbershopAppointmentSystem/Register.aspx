<%@ Page Title="" Language="C#" MasterPageFile="~/mainPage2.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BarbershopAppointmentSystem.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card shadow-lg o-hidden border-0 my-5">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-flex">
                        <div class="flex-grow-1 bg-register-image" style="background-image: url(&quot;assets/img/dogs/image2.jpeg&quot;);"></div>
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h4 class="text-dark mb-4">Create an Account!</h4>
                            </div>
                            <form class="user" runat="server">
                                <div class="form-group"><input runat="server" class="form-control form-control-user" type="text" id="tbUsername" placeholder="Username" name="username" required="" autofocus="" maxlength="20"/></div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input runat="server" class="form-control form-control-user" type="text" id="tbFirstName" placeholder="First Name" name="first_name" required="" maxlength="50"/></div>
                                    <div class="col-sm-6"><input runat="server" class="form-control form-control-user" type="text" id="tbLastName" placeholder="Last Name" name="last_name" required="" maxlength="50"/></div>
                                </div>
                                <div class="form-group"><input runat="server" class="form-control form-control-user" type="email" id="tbEmail" aria-describedby="emailHelp" placeholder="Email Address" name="email" required="" inputmode="email" maxlength="50"/></div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input runat="server" class="form-control form-control-user" type="password" id="tbPassword" placeholder="Password" name="password" required="" maxlength="20"/></div>
                                    <div class="col-sm-6"><input runat="server" class="form-control form-control-user" type="password" id="tbPasswordRepeat" placeholder="Repeat Password" name="password_repeat" required="" maxlength="20"/></div>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnRegister" runat="server" class="btn btn-primary btn-block text-white btn-user" Text="Register Account" OnClick="btnRegister_Click"/>
                                </div>
                                <hr/>
                            </form>
                            <div class="text-center"><a class="small" href="forgot-password.html">Forgot Password?</a></div>
                            <div class="text-center"><a class="small" href="login.html">Already have an account? Login!</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
