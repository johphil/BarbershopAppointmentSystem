<%@ Page Title="" Language="C#" MasterPageFile="~/mainPage.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="BarbershopAppointmentSystem._404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center mt-5">
        <div class="error mx-auto" data-text="404">
            <p class="m-0">404</p>
        </div>
        <p class="text-dark mb-5 lead">Page Not Found</p>
        <p class="text-black-50 mb-0">It looks like you found a glitch in the matrix...</p><a href="/">← Back to Dashboard</a>
    </div>
</asp:Content>
