<%@ Page Language="C#" Title="Customer Order" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerOrderForm.aspx.cs" Inherits="GoodFood.CustomerOrderForm" %>

<asp:Content ID="CustomerOrderForm" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Customer Order Details" CssClass="h3"></asp:Label>
        </div>
        <br />
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Customer"></asp:Label>
            <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="CustomerDropdown" DataTextField="CUSTOMER_NAME" DataValueField="CUSTOMER_ID" CssClass="form-control"></asp:DropDownList>
            <asp:SqlDataSource ID="CustomerDropdown" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;CUSTOMER_ID&quot;, &quot;CUSTOMER_NAME&quot; FROM &quot;CUSTOMER&quot;"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Order Serial Number"></asp:Label>
            <asp:DropDownList ID="ddlOrder" runat="server" DataSourceID="OrderDropdown" DataTextField="SN" DataValueField="ORDER_ID" CssClass="form-control"></asp:DropDownList>
            <asp:SqlDataSource ID="OrderDropdown" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ORDER_ID&quot;, &quot;SN&quot; FROM &quot;ORDERS&quot;"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary" />
        </div>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label6" runat="server" Text="Customer Order Table" CssClass="h4"></asp:Label>
    </div>
    <div class="form-group">
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover"></asp:GridView>
    </div>
</asp:Content>
