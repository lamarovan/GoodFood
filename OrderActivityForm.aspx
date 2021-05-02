<%@ Page Language="C#" Title="Order Activity" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderActivityForm.aspx.cs" Inherits="GoodFood.OrderActivityForm" %>

<asp:Content ID="DishForm" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="jumbotron">
        <div>
            <asp:Label ID="Label2" runat="server" Text="Order Activity Form" CssClass="h3"></asp:Label>
        </div>
        <br />
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Month (in mon format)"></asp:Label>
            <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMonth" runat="server" ErrorMessage="Month required!" ControlToValidate="txtMonth" ForeColor="#FF5050" ValidationGroup="orderActGroup"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary" ValidationGroup="orderActGroup" />
        </div>
    </div>
    <br />
    <div class="form-group">
        <asp:label ID="Label3" runat="server" Text="Order Activity Table" CssClass="h4"></asp:label>
    </div>
    <div class="form-group">
        <asp:GridView ID="GridView1" runat="server" CssClass="table"></asp:GridView>
    </div>
</asp:Content>
