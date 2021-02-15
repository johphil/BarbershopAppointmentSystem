<%@ Page Title="" Language="C#" MasterPageFile="~/mainPage.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="BarbershopAppointmentSystem.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
