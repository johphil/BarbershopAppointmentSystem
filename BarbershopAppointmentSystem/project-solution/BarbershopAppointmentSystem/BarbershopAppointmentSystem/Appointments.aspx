<%@ Page Title="" Language="C#" MasterPageFile="~/mainPage.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="BarbershopAppointmentSystem.Appointments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="text-dark mb-4">Appointments</h3>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">Appointments</p>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Service</th>
                            <th>Barber</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th class="text-center">Status</th>
                            <th></th>
                        </tr>
                    </thead>
                        <asp:Repeater ID="repAppointments" runat="server" OnItemCommand="repUpcomingAppointments_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td><asp:Label ID="txtServiceName" runat="server" Text='<%# Eval("Schedule.Service.Name") %>'></asp:Label></td>
                                <td><asp:Label ID="txtBarberName" runat="server" Text='<%# Eval("Schedule.Barber.Name") %>'></asp:Label></td>
                                <td><asp:Label ID="txtDate" runat="server" Text='<%# Eval("Schedule.GetDate") %>'></asp:Label></td>
                                <td><asp:Label ID="txtTime" runat="server" Text='<%# Eval("Schedule.TimeSlot.TimeString") %>'></asp:Label></td>
                                <td class="text-center">
                                    <asp:Label ID="txtPending" Text="Pending" CssClass="font-weight-bolder badge-primary badge-pill text-white" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="txtCancelled" Text="Cancelled" CssClass="font-weight-bolder badge-warning badge-pill text-white" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="txtFinished" Text="Finished" CssClass="font-weight-bolder badge-success badge-pill text-white" runat="server" Visible="False"></asp:Label>
                                </td>
                                <td><asp:Button ID="btnCancelSchedule" class="btn btn-warning btn-sm float-right" Text="Cancel" runat="server" CommandName="Cancel" CommandArgument='<%# Eval("AppointmentID") %>' UseSubmitBehavior="false"/></td>
                            </tr>                
                        </ItemTemplate>
                    </asp:Repeater>            
                </table>  
            </div>
        </div>
    </div>
</asp:Content>
