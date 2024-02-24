<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="WebApplication1.AdminUserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/generaluser.png" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                     <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="Label1" runat="server">Member ID</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtMemID" runat="server" placeholder="Member ID"></asp:TextBox>
                                        <asp:LinkButton Class="btn btn-success" ID="LnkBtn" runat="server" OnClick="LnkBtn_Click" ><i class="fa-solid fa-circle-check"></i></asp:LinkButton>
                                    </div>                               
                               </div>
                         </div>
                            <div class="col-md-4">
                                <asp:Label ID="LblID" runat="server">Full Name</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" ReadOnly="true" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <asp:Label ID="Label6" runat="server">Account Status</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TxtAccStats" runat="server" ReadOnly="true" placeholder="Account Status"></asp:TextBox>
                                        <asp:LinkButton Class="btn btn-success mr-1" ID="lnkBtnActive" runat="server" Text="A" OnClick="lnkBtnActive_Click" ></asp:LinkButton>
                                        <asp:LinkButton Class="btn btn-warning mr-1" ID="lnkBtnPending" runat="server" Text="P" OnClick="lnkBtnPending_Click"></asp:LinkButton>
                                        <asp:LinkButton Class="btn btn-danger mr-1" ID="lnkBtnDlt" runat="server" Text="D" OnClick="lnkBtnDlt_Click" ></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                       



                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="Label7" runat="server">DOB</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtDOB" runat="server" ReadOnly="true" placeholder="DOB"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="Label8" runat="server">Contatc Number</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtCont" runat="server" ReadOnly="true" placeholder="Contact Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <asp:Label ID="Label9" runat="server">Email ID</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtEmail" runat="server" ReadOnly="true" placeholder="Email ID"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <asp:Label ID="Label10" runat="server">State</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtState" runat="server" ReadOnly="true" placeholder="State"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="Label11" runat="server">City</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtCity" runat="server" ReadOnly="true" placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="Label12" runat="server">Pin Code</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtPin" runat="server" ReadOnly="true" placeholder="Pin Code"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <asp:Label ID="Label4" runat="server">Full Postal Address</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtAddress" runat="server" TextMode="MultiLine" ReadOnly="true" placeholder="FUll Postal Address"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-8 mx-auto">
                                <asp:Button ID="BtnDelete77" Class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User Permanently" OnClick="BtnDelete_Click" />
                            </div>
                        </div>
                    </div>


                </div>
                <a href="HomePage.aspx"><< Back To HomePage</a> </br> </br>
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member List</h4>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-ATJN764\SQLEXPRESS;Initial Catalog=eLibraryDB;Integrated Security=True;" DeleteCommand="DELETE FROM [member_master_tbl] WHERE [member_id] = @member_id" InsertCommand="INSERT INTO [member_master_tbl] ([full_name], [dob], [contact_no], [email], [state], [city], [pincode], [full_address], [member_id], [password], [account_status]) VALUES (@full_name, @dob, @contact_no, @email, @state, @city, @pincode, @full_address, @member_id, @password, @account_status)" SelectCommand="SELECT * FROM [member_master_tbl]" UpdateCommand="UPDATE [member_master_tbl] SET [full_name] = @full_name, [dob] = @dob, [contact_no] = @contact_no, [email] = @email, [state] = @state, [city] = @city, [pincode] = @pincode, [full_address] = @full_address, [password] = @password, [account_status] = @account_status WHERE [member_id] = @member_id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="member_id" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="full_name" Type="String" />
                                        <asp:Parameter Name="dob" Type="String" />
                                        <asp:Parameter Name="contact_no" Type="String" />
                                        <asp:Parameter Name="email" Type="String" />
                                        <asp:Parameter Name="state" Type="String" />
                                        <asp:Parameter Name="city" Type="String" />
                                        <asp:Parameter Name="pincode" Type="String" />
                                        <asp:Parameter Name="full_address" Type="String" />
                                        <asp:Parameter Name="member_id" Type="String" />
                                        <asp:Parameter Name="password" Type="String" />
                                        <asp:Parameter Name="account_status" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="full_name" Type="String" />
                                        <asp:Parameter Name="dob" Type="String" />
                                        <asp:Parameter Name="contact_no" Type="String" />
                                        <asp:Parameter Name="email" Type="String" />
                                        <asp:Parameter Name="state" Type="String" />
                                        <asp:Parameter Name="city" Type="String" />
                                        <asp:Parameter Name="pincode" Type="String" />
                                        <asp:Parameter Name="full_address" Type="String" />
                                        <asp:Parameter Name="password" Type="String" />
                                        <asp:Parameter Name="account_status" Type="String" />
                                        <asp:Parameter Name="member_id" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:GridView AlternatingRowStyle-CssClass="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
<AlternatingRowStyle CssClass="table table-striped table-bordered"></AlternatingRowStyle>
                                    <Columns>
                                        <asp:BoundField DataField="full_name" HeaderText="full_name" SortExpression="full_name" />
                                        <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                                        <asp:BoundField DataField="contact_no" HeaderText="contact_no" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                        <asp:BoundField DataField="pincode" HeaderText="pincode" SortExpression="pincode" />
                                        <asp:BoundField DataField="full_address" HeaderText="full_address" SortExpression="full_address" />
                                        <asp:BoundField DataField="member_id" HeaderText="member_id" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                                        <asp:BoundField DataField="account_status" HeaderText="account_status" SortExpression="account_status" />
                                    </Columns>
                                </asp:GridView>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
