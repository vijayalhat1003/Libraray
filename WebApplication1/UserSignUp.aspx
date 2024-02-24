<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="WebApplication1.UserSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/generaluser.png" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Sign Up</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="LblID" runat="server">Full Name</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="Label1" runat="server">Date of Birth</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtDOB" runat="server" placeholder="Birth Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="Label8" runat="server">Contact No</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtContact" runat="server" TextMode="Number" placeholder="Contact No"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="Label9" runat="server">Email ID</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtEmailID" runat="server" placeholder="EmailID"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="Label4" runat="server">State</asp:Label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DDLstate" class="form-control" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Andra Pradesh" Value="Andra Pradesh" />
                                        <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                        <asp:ListItem Text="Assam" Value="Assam" />
                                        <asp:ListItem Text="Bihar" Value="Bihar" />
                                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                        <asp:ListItem Text="Goa" Value="Goa" />
                                        <asp:ListItem Text="Gujrat" Value="Gujrat" />
                                        <asp:ListItem Text="Haryana" Value="Haryana" />
                                        <asp:ListItem Text="Himacha Pradesh" Value="Himacha Pradesh" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="Label5" runat="server">City</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtCity" runat="server" placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="Label6" runat="server">Pin Code</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtPinC" runat="server" placeholder="Pin Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    <%--    <div class="row">
                            <div class="col">
                                <asp:HiddenField ID="HiddenField1" runat="server" value="2"/>
                                <asp:Label ID="LabeHdn" runat="server" Visible="false">HiddenField</asp:Label>
                            </div>
                        </div>--%>

                        <div class="row">
                            <div class="col">
                                <asp:Label ID="Label7" runat="server">Full Address</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtFulAdd" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <div class="form-group">
                                        <span class="badge badge-pill badge-info">Login Credential</span>
                                    </div>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="Label2" runat="server">User ID</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtUserID" runat="server" placeholder="User ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="Label3" runat="server">Password</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="btnSignUp" runat="server" Text="Log In" OnClick="btnSignUp_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="HomePage.aspx"><< Back To HomePage</a> </br> </br>
            </div>
        </div>
    </div>

</asp:Content>
