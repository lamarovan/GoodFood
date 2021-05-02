<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GoodFood._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron"  style="background-image: url(https://www.rainbowvalley.com.au/wp-content/uploads/2017/02/food-background.jpg); background-repeat: repeat; background-size:cover">
        <h1 style="color:azure">Good Food</h1>
        <p class="lead" style="color:azure">An online platform for satisfying your cravings from anywhere.</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Basic Forms</h2>
            <p>
                <a class="btn btn-outline-primary" href="DishForm">Dish </a>
            </p>
            <p>
                <a class="btn btn-outline-primary" href="RestaurantForm">Restaurant</a>
            </p>
            <p>
                <a class="btn btn-outline-primary" href="CustomerForm">Customer</a>
            </p>
            <p>
                <a class="btn btn-outline-primary" href="DeliveryAddressForm">Delivery Address</a>
            </p>
            <p>
                <a class="btn btn-outline-primary" href="LoyaltyPointsForm">Loyalty Points</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Complex Forms</h2>
            <p>
                <a class="btn btn-outline-primary" href="CustomerOrderForm">Customer Order </a>
            </p>
            <p>
                <a class="btn btn-outline-primary" href="DishSearch">Dish Details</a>
            </p>
            <p>
                <a class="btn btn-outline-primary" href="OrderActivityForm">Order Activity</a>
            </p>
        </div>
        <div class="col-md-4" >
            <h2>Free Delivery Available</h2>
            <br />
            <img src="https://blog.ipleaders.in/wp-content/uploads/2019/11/foodmitho.jpg" style="background-repeat: no-repeat; background-size:contain; height:200px; width:auto;" />
        </div>
    </div>

</asp:Content>
