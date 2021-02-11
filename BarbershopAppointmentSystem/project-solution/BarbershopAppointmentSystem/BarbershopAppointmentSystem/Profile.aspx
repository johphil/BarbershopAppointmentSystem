<%@ Page Title="" Language="C#" MasterPageFile="~/mainPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BarbershopAppointmentSystem.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="text-dark mb-4">Profile</h3>
    <div class="row mb-3">
        <div class="col-lg-4">
            <div class="card mb-3">
                <div class="card-body text-center shadow"><img class="rounded-circle mb-3 mt-4" src="assets/img/avatars/avatar3.jpeg" width="200" height="200">
                    <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Change Photo</button></div>
                </div>
            </div>
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="text-primary font-weight-bold m-0">Introduction</h6>
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group"><textarea class="form-control" id="textIntro" rows="4" name="signature" placeholder="Tell more about yourself." maxlength="200"></textarea></div><span id="count_message" class="pull-right label label-default">Text</span>
                        <div class="form-group"><button class="btn btn-primary btn-sm" type="submit">Update</button></div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="row mb-3 d-none">
                <div class="col">
                    <div class="card text-white bg-primary shadow">
                        <div class="card-body">
                            <div class="row mb-2">
                                <div class="col">
                                    <p class="m-0">Peformance</p>
                                    <p class="m-0"><strong>65.2%</strong></p>
                                </div>
                                <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                            </div>
                            <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card text-white bg-success shadow">
                        <div class="card-body">
                            <div class="row mb-2">
                                <div class="col">
                                    <p class="m-0">Peformance</p>
                                    <p class="m-0"><strong>65.2%</strong></p>
                                </div>
                                <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                            </div>
                            <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card shadow mb-3">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">User Settings</p>
                        </div>
                        <div class="card-body">
                            <form runat="server">
                                <div class="form-row">
                                    <div class="col">
                                        <div class="form-group"><label for="username"><strong>Username</strong></label><input id="tbUsername" class="form-control" type="text" placeholder="Username" required="" runat="server"></div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group"><label for="email"><strong>Email Address</strong></label><input id="tbEmail" class="form-control" type="email" placeholder="Email Address" required="" runat="server"></div>
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
                                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" class="form-check form-check-inline" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                    <asp:ListItem Text="Male" class="form-check-input" />
                                                    <asp:ListItem Text="Female" class="form-check-input" />
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group"><label><strong>Date of Birth</strong></label><input class="form-control" type="date"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnSaveUserSettings" runat="server" Text="Save Settings" class="btn btn-primary btn-sm" type="submit" OnClick="btnSaveUserSettings_Click"/>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Contact Settings</p>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-group"><label for="address"><strong>Address</strong></label><input class="form-control" type="text" placeholder="Home Address" name="address"></div>
                                <div class="form-row">
                                    <div class="col">
                                        <div class="form-group"><label for="country"><strong>Contact No.</strong></label><input class="form-control" type="text" placeholder="Contact Number" name="contactno"></div>
                                    </div>
                                </div>
                                <div class="form-group"><button class="btn btn-primary btn-sm" type="submit">Save&nbsp;Settings</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <h3 class="text-dark mb-4">My Barbershop</h3>
    <div class="row mb-3">
        <div class="col-lg-4">
            <div class="card shadow mb-3">
                <div class="card-header py-3">
                    <p class="text-primary m-0 font-weight-bold">Barbershop Settings</p>
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group"><label for="address"><strong>Shop Name</strong></label><input class="form-control" type="text" placeholder="Barbershop Name" name="address"></div>
                        <div class="form-group"><label for="country"><strong>Introduction</strong></label><textarea class="form-control" rows="4" name="signature" placeholder="Introduce your barbershop."></textarea></div>
                        <div class="form-group"><button class="btn btn-primary btn-sm" type="submit">Save&nbsp;Settings</button></div>
                    </form>
                </div>
            </div>
            <div class="card shadow mb-3">
                <div class="card-header py-3">
                    <div class="d-flex justify-content-between">
                        <p class="text-primary d-lg-flex align-items-lg-center m-0 font-weight-bold">My Services</p><a class="btn btn-primary btn-circle" role="button" href="#"><i class="fas fa-plus text-white"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="list-group mb-2"><a class="list-group-item list-group-item-action" href="#">Haircut for Men</a><a class="list-group-item list-group-item-action" href="#">Hairstyle for Men</a></div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card shadow mb-5">
                <div class="card-header py-3">
                    <p class="text-primary m-0 font-weight-bold">Service Requests</p>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush" style="max-height: 512px;overflow-y: scroll;">
                        <li class="list-group-item">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="text-dark font-weight-bolder mb-1">Haircut for Men</h5><small>3 mins ago</small>
                            </div>
                            <div class="d-flex w-100 justify-content-between"><span>Schedule: Feb 4, 2021 5:00 PM</span>
                                <div class="btn-group float-right" role="group"><a class="btn btn-danger btn-circle ml-1" role="button"><i class="fas fa-trash text-white"></i></a><a class="btn btn-success btn-circle ml-1" role="button"><i class="fas fa-check text-white"></i></a></div>
                            </div><small>Customer:&nbsp;<a href="#"><span style="text-decoration: underline;">Juan Dela Cruz</span></a><br></small>
                        </li>
                        <li class="list-group-item">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="text-dark font-weight-bolder mb-1">Haircut for Men</h5><small>3 mins ago</small>
                            </div>
                            <div class="d-flex w-100 justify-content-between"><span>Schedule: Feb 4, 2021 5:00 PM</span>
                                <div class="btn-group float-right" role="group"><a class="btn btn-danger btn-circle ml-1" role="button"><i class="fas fa-trash text-white"></i></a><a class="btn btn-success btn-circle ml-1" role="button"><i class="fas fa-check text-white"></i></a></div>
                            </div><small>Customer:&nbsp;<a href="#"><span style="text-decoration: underline;">Juan Dela Cruz</span></a><br></small>
                        </li>
                        <li class="list-group-item">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="text-dark font-weight-bolder mb-1">Hairstyle for Men</h5><small>12 mins ago</small>
                            </div>
                            <div class="d-flex w-100 justify-content-between"><span>Schedule: Feb 3, 2021 5:00 PM</span>
                                <div class="btn-group float-right" role="group"><a class="btn btn-danger btn-circle ml-1" role="button"><i class="fas fa-trash text-white"></i></a><a class="btn btn-success btn-circle ml-1" role="button"><i class="fas fa-check text-white"></i></a></div>
                            </div><small>Customer:&nbsp;<a href="#"><span style="text-decoration: underline;">Juan Dela Paz</span></a><br></small>
                        </li>
                        <li class="list-group-item">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="text-dark font-weight-bolder mb-1">Hairstyle for Men</h5><small>12 mins ago</small>
                            </div>
                            <div class="d-flex w-100 justify-content-between"><span>Schedule: Feb 3, 2021 5:00 PM</span>
                                <div class="btn-group float-right" role="group"><a class="btn btn-danger btn-circle ml-1" role="button"><i class="fas fa-trash text-white"></i></a><a class="btn btn-success btn-circle ml-1" role="button"><i class="fas fa-check text-white"></i></a></div>
                            </div><small>Customer:&nbsp;<a href="#"><span style="text-decoration: underline;">Juan Dela Paz</span></a><br></small>
                        </li>
                        <li class="list-group-item">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="text-dark font-weight-bolder mb-1">Hairstyle for Men</h5><small>12 mins ago</small>
                            </div>
                            <div class="d-flex w-100 justify-content-between"><span>Schedule: Feb 3, 2021 5:00 PM</span>
                                <div class="btn-group float-right" role="group"><a class="btn btn-danger btn-circle ml-1" role="button"><i class="fas fa-trash text-white"></i></a><a class="btn btn-success btn-circle ml-1" role="button"><i class="fas fa-check text-white"></i></a></div>
                            </div><small>Customer:&nbsp;<a href="#"><span style="text-decoration: underline;">Juan Dela Paz</span></a><br></small>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
