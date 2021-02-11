<%@ Page Title="" Language="C#" MasterPageFile="~/mainPage.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="BarbershopAppointmentSystem.Appointments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="text-dark mb-4">Appointments</h3>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">Upcoming...</p>
        </div>
        <div class="card-body">
            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                <table class="table my-0" id="dataTable">
                    <thead>
                        <tr>
                            <th>Barbershop</th>
                            <th>Service</th>
                            <th>Price</th>
                            <th>Date and Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img class="rounded-circle mr-2" width="30" height="30" src="assets/img/avatars/avatar5.jpeg">Barbershop 1</td>
                            <td>Haircut for Men</td>
                            <td><strong>₱499.00</strong><br></td>
                            <td>Feb 3, 2021 5:00PM</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td><strong>Barbershop</strong></td>
                            <td><strong>Service</strong></td>
                            <td><strong>Price</strong></td>
                            <td><strong>Date and Time</strong></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="row">
                <div class="col-md-6 align-self-center">
                    <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 1 of 1</p>
                </div>
                <div class="col-md-6">
                    <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                        <ul class="pagination">
                            <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">Recent Transactions</p>
        </div>
        <div class="card-body">
            <div class="table-responsive table mt-2" id="dataTable-1" role="grid" aria-describedby="dataTable_info">
                <table class="table my-0" id="dataTable">
                    <thead>
                        <tr>
                            <th>Barbershop</th>
                            <th>Service</th>
                            <th>Price</th>
                            <th>Date and Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img class="rounded-circle mr-2" width="30" height="30" src="assets/img/avatars/avatar5.jpeg">Barbershop 1</td>
                            <td>Haircut for Men</td>
                            <td><strong>₱499.00</strong><br></td>
                            <td>Dec 31, 2020 5:00PM</td>
                        </tr>
                        <tr>
                            <td><img class="rounded-circle mr-2" width="30" height="30" src="assets/img/avatars/avatar5.jpeg">Barbershop 1</td>
                            <td>Haircut for Men</td>
                            <td><strong>₱499.00</strong><br></td>
                            <td>Sep 26, 2020 5:00PM</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td><strong>Barbershop</strong></td>
                            <td><strong>Service</strong></td>
                            <td><strong>Price</strong></td>
                            <td><strong>Date and Time</strong></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="row">
                <div class="col-md-6 align-self-center">
                    <p id="dataTable_info-1" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 2 of 1</p>
                </div>
                <div class="col-md-6">
                    <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                        <ul class="pagination">
                            <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
