<%@ Page Title="" Language="C#" MasterPageFile="~/mainPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BarbershopAppointmentSystem.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="text-dark mb-4">Profile</h3>
    <div class="row mb-3">
        <div class="col-lg-4">
            <div class="card mb-3">
                <div class="card-body text-center shadow">
                    <img class="rounded-circle mb-3 mt-4" src="assets/img/dogs/image3.jpeg" width="200" height="200">
                </div>
            </div>
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="text-primary font-weight-bold m-0">Introduction</h6>
                </div>
                <div class="card-body">
                    <div class="form-group"><textarea class="form-control" id="tbIntroduction" placeholder="Tell more about yourself." maxlength="200" runat="server" ClientIDMode="Static"></textarea></div><span id="count_message" class="pull-right label label-default" runat="server" ClientIDMode="Static">Text</span>
                    <div class="form-group"><asp:Button ID="btnSaveIntroduction" runat="server" class="btn btn-primary btn-sm" type="submit" Text="Update" OnClick="btnSaveIntroduction_Click"></asp:Button></div>
                </div>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="row">
                <div class="col">
                    <div class="card shadow mb-3">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">User Settings</p>
                        </div>
                        <div class="card-body">
                            <div class="form-row">
                                <div class="col">
                                    <div class="form-group"><label for="username"><strong>Username</strong></label><input id="tbUsername" readonly class="form-control" type="text" placeholder="Username" required="" runat="server"></div>
                                </div>
                                <div class="col">
                                    <div class="form-group"><label for="email"><strong>Email Address</strong></label><input id="tbEmail" readonly class="form-control" type="email" placeholder="Email Address" required="" runat="server"></div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col">
                                    <div class="form-group"><label for="first_name"><strong>First Name</strong></label><input id="tbFirstName" class="form-control" type="text" placeholder="First Name" required="" runat="server"></div>
                                </div>
                                <div class="col">
                                    <div class="form-group"><label for="last_name"><strong>Last Name</strong></label><input id="tbLastName" class="form-control" type="text" placeholder="Last Name" required="" runat="server"></div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col">
                                    <div class="form-group"><label><strong>Gender</strong></label>
                                        <div>
                                            <asp:RadioButtonList ID="rbGender" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="Male" Value="M" />
                                                <asp:ListItem Text="Female" Value="F" />
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group"><label><strong>Date of Birth</strong></label><asp:TextBox ID="dpBirthday" runat="server" class="form-control" TextMode="Date"></asp:TextBox></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnSaveUserSettings" runat="server" Text="Save Settings" class="btn btn-primary btn-sm" OnClick="btnSaveUserSettings_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Contact Settings</p>
                        </div>
                        <div class="card-body">
                            <div class="form-group"><label for="address"><strong>Address</strong></label><input id="tbAddress" runat="server" class="form-control" type="text" placeholder="Home Address" name="address"></div>
                            <div class="form-row">
                                <div class="col">
                                    <div class="form-group"><label for="country"><strong>Contact No.</strong></label><input id="tbContatNumber" runat="server" class="form-control" type="text" placeholder="Contact Number" name="contactno"></div>
                                </div>
                            </div>
                            <div class="form-group"><asp:Button ID="btnSaveContactSettings" runat="server" OnClick="btnSaveContactSettings_Click" class="btn btn-primary btn-sm" type="submit" Text="Save Settings"></asp:Button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
