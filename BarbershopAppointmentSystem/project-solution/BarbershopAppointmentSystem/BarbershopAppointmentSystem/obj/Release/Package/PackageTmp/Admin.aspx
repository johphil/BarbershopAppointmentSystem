<%@ Page Title="" Language="C#" MasterPageFile="~/mainPage.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="BarbershopAppointmentSystem.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="text-dark mb-4">Admin Panel</h3>
    <div class="btn-group mb-2" role="group">
        <asp:Button ID="btnView1" class="btn btn-outline-primary" Text="Appointments" runat="server" OnClick="btnView1_Click"/>
        <asp:Button ID="btnView2" class="btn btn-outline-primary" Text="Service Schedule" runat="server" OnClick="btnView2_Click"/>
        <asp:Button ID="btnView3" class="btn btn-outline-primary" Text="Services" runat="server" OnClick="btnView3_Click"/>
        <asp:Button ID="btnView4" class="btn btn-outline-primary" Text="Barbers" runat="server" OnClick="btnView4_Click"/>
    </div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
                <div class="card shadow mb-2">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 font-weight-bold">Appointments</p>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush" style="max-height: 710px; overflow-y: auto;">
                            <asp:Repeater ID="repAppointment" runat="server" OnItemCommand="repAppointment_ItemCommand">
                                <ItemTemplate>
                                    <li class="list-group-item">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h5 class="text-dark font-weight-bolder mb-1">
                                                <asp:Literal runat="server" Text='<%# Eval("Schedule.Service.Name") %>'></asp:Literal>
                                            </h5>
                                            <small>
                                                <asp:Literal runat="server" Text='<%# Eval("GetTimeSpan") %>'></asp:Literal>
                                            </small>
                                        </div>
                                        <div class="d-flex w-100 justify-content-between">
                                            <div>
                                                <div>
                                                    <span> Schedule:
                                                        <asp:Literal runat="server" Text='<%# Eval("Schedule.GetDateAndTime") %>'></asp:Literal>
                                                    </span>
                                                </div>
                                                <div>
                                                    <span> Barber:
                                                        <asp:Literal runat="server" Text='<%# Eval("Schedule.Barber.Name") %>'></asp:Literal>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="btn-group float-right" role="group">
                                                <asp:LinkButton ID="btnCancel" runat="server" class="btn btn-warning btn-circle ml-1" CommandName="Cancel" CommandArgument='<%# Eval("AppointmentID") %>'>
                                                    <i class="fas fa-trash text-white"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnFinish" runat="server" class="btn btn-success btn-circle ml-1" CommandName="Finish" CommandArgument='<%# Eval("AppointmentID") %>'>
                                                    <i class="fas fa-check text-white"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                        <small>Customer:&nbsp;
                                            <span style="text-decoration: underline;">
                                                <asp:Literal runat="server" Text='<%# Eval("Account.Username") %>'></asp:Literal>
                                            </span>
                                            <br/>
                                        </small>
                                    </li>             
                                </ItemTemplate>
                            </asp:Repeater> 
                        </ul>
                    </div>
                </div>
                <div class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 font-weight-bold">Recent Appointments</p>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush" style="max-height: 710px; overflow-y: auto;">
                            <asp:Repeater ID="repRecentAppointment" runat="server">
                                <ItemTemplate>
                                    <li class="list-group-item">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h5 class="text-dark font-weight-bolder mb-1">
                                                <asp:Literal runat="server" Text='<%# Eval("Schedule.Service.Name") %>'></asp:Literal>
                                            </h5>
                                            <small>
                                                <asp:Literal runat="server" Text='<%# Eval("GetTimeSpan") %>'></asp:Literal>
                                            </small>
                                        </div>
                                        <div class="d-flex w-100 justify-content-between">
                                            <div>
                                                <div>
                                                    <span> Schedule:
                                                        <asp:Literal runat="server" Text='<%# Eval("Schedule.GetDateAndTime") %>'></asp:Literal>
                                                    </span>
                                                </div>
                                                <div>
                                                    <span> Barber:
                                                        <asp:Literal runat="server" Text='<%# Eval("Schedule.Barber.Name") %>'></asp:Literal>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="float-right">
                                                <asp:Label ID="txtPending" Text="Pending" CssClass="font-weight-bolder badge-primary badge-pill text-white" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="txtCancelled" Text="Cancelled" CssClass="font-weight-bolder badge-warning badge-pill text-white" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="txtFinished" Text="Finished" CssClass="font-weight-bolder badge-success badge-pill text-white" runat="server" Visible="False"></asp:Label>
                                            </div>
                                        </div>
                                        <small>Customer:&nbsp;
                                            <span style="text-decoration: underline;">
                                                <asp:Literal runat="server" Text='<%# Eval("Account.Username") %>'></asp:Literal>
                                            </span>
                                            <br/>
                                        </small>
                                    </li>             
                                </ItemTemplate>
                            </asp:Repeater> 
                        </ul>
                    </div>
                </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="card shadow mb-3">
                <div class="card-header py-3">
                    <p class="text-primary m-0 font-weight-bold">Add Service Schedule</p>
                </div>
                <div class="card-body">
                    <div class="form-group"><label><strong>Service</strong></label>
                        <asp:DropDownList ID="cbService" runat="server" class="form-control">
                            <asp:ListItem Value="">Pumili ka ng serbisyo</asp:ListItem>  
                        </asp:DropDownList>
                    </div>
                    <div class="form-group"><label><strong>Barber</strong></label>
                        <asp:DropDownList ID="cbBarber" runat="server" class="form-control">
                            <asp:ListItem Value="">Pumili ka ng barbero</asp:ListItem>  
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>
                            <strong>Schedule</strong>
                        </label>
                        <div class="d-flex">
                            <asp:TextBox ID="dpScheduleDate" runat="server" class="form-control mr-2" TextMode="Date"></asp:TextBox>
                            <asp:DropDownList ID="cbTimeSlot" runat="server" class="form-control ml-2">
                                <asp:ListItem Value="">Pumili ka ng oras</asp:ListItem>  
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnAddSchedule" runat="server" class="btn btn-primary btn-sm" Text="Add Schedule" OnClick="btnAddSchedule_Click"></asp:Button>
                    </div>
                </div>
            </div>
            <div class="card shadow mb-3">
                <div class="card-header py-3">
                    <p class="text-primary m-0 font-weight-bold">Schedules</p>
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
                                </tr>
                            </thead>
                            <asp:Repeater ID="repSchedule" runat="server" OnItemCommand="repSchedule_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td><asp:Label ID="txtServiceName" runat="server" Text='<%# Eval("Service.Name") %>'></asp:Label></td>
                                        <td><asp:Label ID="txtBarberName" runat="server" Text='<%# Eval("Barber.Name") %>'></asp:Label></td>
                                        <td><asp:Label ID="txtDate" runat="server" Text='<%# Eval("GetDate") %>'></asp:Label></td>
                                        <td><asp:Label ID="txtTime" runat="server" Text='<%# Eval("TimeSlot.TimeString") %>'></asp:Label></td>
                                        <td><asp:Button ID="btnRemoveSchedule" class="btn btn-danger btn-sm float-right" Text="Remove" runat="server" CommandName="Remove" CommandArgument='<%# Eval("ScheduleID") %>' UseSubmitBehavior="false"/></td>
                                    </tr>                
                                </ItemTemplate>
                            </asp:Repeater>            
                        </table>  
                    </div>
                </div>
            </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <div class="card shadow mb-3">
                <div class="card-header py-3">
                    <p class="text-primary m-0 font-weight-bold">Add Service</p>
                </div>
                <div class="card-body">
                    <div class="form-group"><label><strong>Service</strong></label><input id="tbServiceName" runat="server" class="form-control" type="text" placeholder="Service Name" maxlength="100" autofocus="autofocus"></div>
                    <div class="form-group">
                        <label>
                            <strong>Price</strong>
                        </label>
                        <asp:TextBox ID="tbPrice" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group"><asp:Button ID="btnAddService" runat="server" class="btn btn-primary btn-sm" Text="Add Service" OnClick="btnAddService_Click"></asp:Button></div>
                </div>
            </div>
            <div class="card shadow mb-3">
                <div class="card-header py-3">
                    <p class="text-primary m-0 font-weight-bold">Services</p>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Service ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                                <asp:Repeater ID="repService" runat="server" OnItemCommand="repService_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td><asp:Label ID="txtServiceID" runat="server" Text='<%# Eval("ServiceID") %>'></asp:Label></td>
                                        <td><asp:Label ID="txtServiceName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></td>
                                        <td><asp:Label ID="txtPrice" runat="server" Text='<%# Eval("GetPrice") %>'></asp:Label></td>
                                        <td><asp:Button ID="btnRemoveService" class="btn btn-danger btn-sm float-right" Text="Remove" runat="server" CommandName="Remove" CommandArgument='<%# Eval("ServiceID") %>' UseSubmitBehavior="false"/></td>
                                    </tr>                
                                </ItemTemplate>
                            </asp:Repeater>            
                        </table>  
                    </div>
                </div>
            </div>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <div class="card shadow mb-3">
                <div class="card-header py-3">
                    <p class="text-primary m-0 font-weight-bold">Add Barber</p>
                </div>
                <div class="card-body">
                    <div class="form-group"><label><strong>Barber's Name</strong></label><input id="tbBarberName" runat="server" class="form-control" type="text" placeholder="Name of Barber" maxlength="50" autofocus="autofocus"></div>
                    <div class="form-group"><asp:Button ID="btnAddBarber" runat="server" class="btn btn-primary btn-sm" Text="Add Barber" OnClick="btnAddBarber_Click"></asp:Button></div>
                </div>
            </div>
            <div class="card shadow mb-3">
                <div class="card-header py-3">
                    <p class="text-primary m-0 font-weight-bold">Barbers</p>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Barber ID</th>
                                    <th>Name</th>
                                </tr>
                            </thead>
                                <asp:Repeater ID="repBarbers" runat="server" OnItemCommand="repBarbers_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td><asp:Label ID="txtBarberID" runat="server" Text='<%# Eval("BarberID") %>'></asp:Label></td>
                                        <td><asp:Label ID="txtBarberName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></td>
                                        <td><asp:Button ID="btnRemoveBarber" class="btn btn-danger btn-sm float-right" Text="Remove" runat="server" CommandName="Remove" CommandArgument='<%# Eval("BarberID") %>' UseSubmitBehavior="false"/></td>
                                    </tr>                
                                </ItemTemplate>
                            </asp:Repeater>            
                        </table>  
                    </div>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
