<%@ Page Language="C#" Title="Customer" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerForm.aspx.cs" Inherits="GoodFood.CustomerForm" %>

<asp:Content ID="DishForm" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Customer Form" CssClass="h3"></asp:Label>
        </div>
        <br />
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name required!" ForeColor="#FF5050" ValidationGroup="CustomerGroup" ControlToValidate="txtName"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Email Address"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Write proper email!" ForeColor="#FF5050" ValidationGroup="CustomerGroup" ControlToValidate="txtEmail" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Phone Number"></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" OnTextChanged="txtPhone_TextChanged"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="Phone number required!" ForeColor="#FF5050" ValidationGroup="CustomerGroup" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter Valid Number!" ForeColor="#FF5050" ValidationExpression="^[0-9]*$" ValidationGroup="CustomerGroup"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="Label5" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address required!" ForeColor="#FF5050" ValidationGroup="CustomerGroup" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" ValidationGroup="CustomerGroup" CssClass="btn btn-primary" />
        </div>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label6" runat="server" Text="Customer Table" CssClass="h4"></asp:Label>
    </div>    
    <div>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" DataKeyNames="CUSTOMER_ID" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." AutoGenerateEditButton="true" AutoGenerateDeleteButton="true"></asp:GridView>
    </div>
</asp:Content>
