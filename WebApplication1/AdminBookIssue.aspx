<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookIssue.aspx.cs" Inherits="WebApplication1.AdminBookIssue" %>

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
                                    <h4>Book Issuing</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/books.png" width="100px" />
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
                                <asp:Label ID="LblID" runat="server">Member ID</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TxtMemID" runat="server" placeholder="Member ID"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="Label1" runat="server">Book ID</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TxtBookID" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="BtnGo" runat="server" Text="Go" OnClick="BtnGo_Click"  />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="Label2" runat="server">Member Name</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtMemNam" ReadOnly="true" runat="server" placeholder="Member Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="Label3" runat="server">Book Name</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtbookNam" ReadOnly="true" runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="Label4" runat="server">Issue Date</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtIssueDate" runat="server" TextMode="Date" placeholder="Issue Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="Label5" runat="server">Due Date</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtEndDate" runat="server" TextMode="Date" placeholder="Due Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="BtnIssue" Class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" OnClick="BtnIssue_Click" />
                            </div>
                            <div class="col-6">
                                <asp:Button ID="BtnReturn" Class="btn btn-lg btn-block btn-success" runat="server" Text="Return" OnClick="BtnReturn_Click" />
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
                                    <h4>Issued Book List</h4>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-ATJN764\SQLEXPRESS;Initial Catalog=eLibraryDB;Integrated Security=True" DeleteCommand="DELETE FROM [book_issue_tbl] WHERE [member_id] = @member_id" InsertCommand="INSERT INTO [book_issue_tbl] ([member_id], [member_name], [book_id], [book_name], [issue_date], [due_date]) VALUES (@member_id, @member_name, @book_id, @book_name, @issue_date, @due_date)" SelectCommand="SELECT * FROM [book_issue_tbl]" UpdateCommand="UPDATE [book_issue_tbl] SET [member_name] = @member_name, [book_id] = @book_id, [book_name] = @book_name, [issue_date] = @issue_date, [due_date] = @due_date WHERE [member_id] = @member_id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="member_id" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="member_id" Type="String" />
                                        <asp:Parameter Name="member_name" Type="String" />
                                        <asp:Parameter Name="book_id" Type="String" />
                                        <asp:Parameter Name="book_name" Type="String" />
                                        <asp:Parameter Name="issue_date" Type="String" />
                                        <asp:Parameter Name="due_date" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="member_name" Type="String" />
                                        <asp:Parameter Name="book_id" Type="String" />
                                        <asp:Parameter Name="book_name" Type="String" />
                                        <asp:Parameter Name="issue_date" Type="String" />
                                        <asp:Parameter Name="due_date" Type="String" />
                                        <asp:Parameter Name="member_id" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:GridView AlternatingRowStyle-CssClass="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
<AlternatingRowStyle CssClass="table table-striped table-bordered"></AlternatingRowStyle>
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
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
