<%@ Page Language="C#" Title="Dish Search" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DishSearch.aspx.cs" Inherits="GoodFood.DishSearch" %>

<asp:Content ID="DishSearchForm" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div>
            <asp:Label ID="Label2" runat="server" Text="Search Dish" CssClass="h3"></asp:Label>
        </div>
        <br />
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Dish"></asp:Label>
            <asp:DropDownList ID="ddlDish" runat="server" DataSourceID="DishData" DataTextField="DISH_NAME" DataValueField="DISH_ID" CssClass="form-control"></asp:DropDownList>
            <asp:SqlDataSource ID="DishData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DISH_ID&quot;, &quot;DISH_NAME&quot; FROM &quot;DISH&quot;"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary" />
        </div>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label6" runat="server" Text="Dish Details Table" CssClass="h4"></asp:Label>
    </div>    
    <div>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover"></asp:GridView>
    </div>
</asp:Content>
