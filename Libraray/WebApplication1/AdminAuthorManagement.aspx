<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminAuthorManagement.aspx.cs" Inherits="WebApplication1.AdminAuthorManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <%--<script type="text/javascript">
        $(document).ready(function () {
            //$(document).ready(function () { 
            //    $('.table').datatble();
            //});
        $(".table").prepend($("<thead></thead>").append($(this).find("th:first"))).datatble});
    </script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
     <div class="row">
         <div class="col-md-5">

             <div class="card">
                 <div class="card-body">

                     <div class="row">
                         <div class="col">
                             <center>
                                 <h4>Author Details</h4>
                             </center>
                         </div>
                     </div>

                     <div class="row">
                         <div class="col">
                             <center>
                                 <img src="Images/writer.png" width="100px" />
                             </center>
                         </div>
                     </div>

                     <div class="row">
                         <div class="col">
                             <hr>
                         </div>
                     </div>

                     <div class="row">
                         <div class="col-md-4">
                             <asp:Label ID="LblID" runat="server">Author ID</asp:Label>
                             <div class="form-group">
                                 <div class="input-group">
                                 <asp:TextBox CssClass="form-control" ID="TxtAuthorID" runat="server" placeholder="Author ID"></asp:TextBox>
                                 <asp:Button class="btn btn-primary " ID="btnSignUpGo" runat="server" Text="Go" OnClick="btnSignUpGo_Click" />
                                 </div> 
                             </div>
                         </div>
                         <div class="col-md-8">
                             <asp:Label ID="Label1" runat="server">Author Name</asp:Label>
                             <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TxtAuthorName" runat="server" placeholder="Author Name" ></asp:TextBox>
                             </div>
                         </div>
                     </div>
                     
                     <div class="row">
                     <div class="row">
                         <div class="col-4">
                             <asp:Button ID="btnAdd" Class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btnAdd_Click" />
                         </div>
                         <div class="col-4">
                             <asp:Button ID="btnUpdate" Class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                         </div>
                         <div class="col-4">
                             <asp:Button ID="btnDlt" Class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDlt_Click" />
                         </div>
                     </div>
                     </div>
                 </div>
             </div>
            <a href="HomePage.aspx" ><< Back To HomePage</a> </br> </br>
         </div>

         <div class="col-md-7">
             <div class="card">
                 <div class="card-body">

                     <div class="row">
                         <div class="col">
                             <center>
                                 <h4>Author List</h4>
                                 <asp:Label ID="Label9" class="badge badge-pill badge-info" runat="server" Text="Your books info"></asp:Label>
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
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" DeleteCommand="DELETE FROM [author_master_tbl] WHERE [author_id] = @author_id" InsertCommand="INSERT INTO [author_master_tbl] ([author_id], [author_name]) VALUES (@author_id, @author_name)" SelectCommand="SELECT * FROM [author_master_tbl]" UpdateCommand="UPDATE [author_master_tbl] SET [author_name] = @author_name WHERE [author_id] = @author_id">
                                 <DeleteParameters>
                                     <asp:Parameter Name="author_id" Type="String" />
                                 </DeleteParameters>
                                 <InsertParameters>
                                     <asp:Parameter Name="author_id" Type="String" />
                                     <asp:Parameter Name="author_name" Type="String" />
                                 </InsertParameters>
                                 <UpdateParameters>
                                     <asp:Parameter Name="author_name" Type="String" />
                                     <asp:Parameter Name="author_id" Type="String" />
                                 </UpdateParameters>
                             </asp:SqlDataSource>
                             <asp:GridView AlternatingRowStyle-CssClass="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
<AlternatingRowStyle CssClass="table table-striped table-bordered"></AlternatingRowStyle>
                                 <Columns>
                                     <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                                     <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
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
