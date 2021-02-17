<%@ Page Title="" Language="C#" MasterPageFile="~/mainPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BarbershopAppointmentSystem.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1"   EnablePageMethods="true"   EnablePartialRendering="true" runat="server" />
    <div class="modal fade" role="dialog" tabindex="-1" id="selectedItem">
        <div class="modal-dialog" role="document">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <div>   
                                <h5><asp:Label ID="txtModalTitle" runat="server" class="modal-title mr-2" Text="Title"></asp:Label></h5>
                                <asp:Label ID="txtModalPrice" runat="server" class="font-weight-bolder badge-primary badge-pill text-white"></asp:Label>
                            </div>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Mag set ng schedule at pumili ng barbero.</p>
                            <div class="form-group">
                                <span>Select your preferred barber</span>
                                <asp:DropDownList ID="cbModalBarbers" runat="server" AutoPostBack="True" class="form-control" OnSelectedIndexChanged="cbModalBarbers_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <span>Select a date</span>
                                <asp:DropDownList ID="cbModalDate" runat="server" AutoPostBack="True" class="form-control" OnSelectedIndexChanged="cbModalDate_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <span>Select a time</span>
                                <asp:DropDownList ID="cbModalTime" runat="server" AutoPostBack="True" class="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-light" type="button" data-dismiss="modal">Cancel</button>
                            <asp:Button ID="btnBookNow" runat="server" class="btn btn-primary" Text="Book Now" OnClick="btnBookNow_Click"></asp:Button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="mb-2">
        <h5 class="text-dark d-lg-flex align-items-lg-center mb-2 ml-3"><i class="fa fa-star mr-2"></i>Top 3 Popular</h5>
        <div class="container-fluid">
            <div class="row flex-nowrap scstyle sc-overflow">
                <asp:Repeater ID="repPopularItem" runat="server" OnItemCommand="repPopularItem_ItemCommand">
                    <ItemTemplate>
                        <div class="col popular-item">
                            <asp:LinkButton ID="itemPopular" runat="server" CommandName="SelectItem" CommandArgument='<%# Eval("ServiceID") %>'>
                                <div class="card card-block">
                                    <div class="card-body">
                                        <asp:Label ID="txtItemPopularTitle" runat="server" class="card-title item-service-title" Text='<%# Eval("Name") %>'></asp:Label>
                                        <div class="d-lg-flex align-items-lg-center d-flex justify-content-between" style="position: absolute;bottom: 20px;width: 200px;">
                                            <asp:Label ID="txtItemPopularPrice" runat="server" class="font-weight-bolder badge-primary badge-pill text-white" style="margin: 0px;" Text='<%# Eval("GetPrice") %>'></asp:Label>
                                            <asp:Label class="small" ID="txtItemPopularBookings" runat="server" Text='<%# Eval("GetBookings") %>'></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <div class="mb-2">
        <div class="d-flex justify-content-between">
            <h5 class="text-dark d-lg-flex align-items-lg-center mb-2 ml-3">
                Others you might like...
            </h5>
        </div>
        <div class="container-fluid">
            <div class="row">
                 <asp:Repeater ID="repAllItems" runat="server" OnItemCommand="repAllItems_ItemCommand">
                    <ItemTemplate>
                        <div class="col popular-item">
                            <asp:LinkButton ID="itemAll" runat="server" CommandName="SelectItem" CommandArgument='<%# Eval("ServiceID") %>'>
                                <div class="card card-block">
                                    <div class="card-body">
                                        <asp:Label ID="txtItemTitle" runat="server" class="card-title item-service-title" Text='<%# Eval("Name") %>'></asp:Label>
                                        <div class="d-lg-flex align-items-lg-center d-flex justify-content-between" style="position: absolute;bottom: 20px;width: 200px;">
                                            <asp:Label ID="txtItemPrice" runat="server" class="font-weight-bolder badge-primary badge-pill text-white" style="margin: 0px;" Text='<%# Eval("GetPrice") %>'></asp:Label>
                                            <asp:Label class="small" ID="txtItemBookings" runat="server" Text='<%# Eval("GetBookings") %>'></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <script>
        function showItemModal() {
            $('#selectedItem').modal('show');
        }
        function closeItemModal() {
            $('#selectedItem').modal('hide');
        }
    </script>
</asp:Content>
