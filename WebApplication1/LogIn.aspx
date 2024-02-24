<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="WebApplication1.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/generaluser.png" width="150px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:Label ID="LblID" runat="server">Member ID</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtId" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                                <asp:Label ID="LblPass" runat="server">Password</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-block btn-lg" ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click"  />
                                </div>
                                <div class="form-group">
                                    <a href="UserSignUp.aspx">
                                        <input class="btn btn-info btn-block btn-lg" id="btnSignUp" type="button" value="Sign Up" /> </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="HomePage.aspx"><< Back To HomePage</a>
                </br></br>
            </div>
        </div>
    </div>

</asp:Content>
