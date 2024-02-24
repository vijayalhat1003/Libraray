<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookInventory.aspx.cs" Inherits="WebApplication1.AdminBookInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
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
                                    <h4>Book Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" src="BooksInve/b1.jpg" height="150px" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col" cssclass="form-control">
                                <asp:FileUpload ID="FileUpload1" onchange="readURL(this);" CssClass="form-control" runat="server" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="Label1" runat="server">Book ID</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TxtBookID" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:LinkButton Class="btn btn-success" ID="BtnGo" runat="server" Text="A" OnClick="BtnGo_Click"><i class="fa-solid fa-circle-check"></i></asp:LinkButton>
                                    </div>
                                </div>
                                 
                            </div>
                            <div class="col-md-9">
                                <asp:Label ID="LblID" runat="server">Book Name</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBookName" runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="Label7" runat="server">Language</asp:Label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DDLang" runat="server">
                                        <asp:ListItem Text="Marathi" Value="Marathi" />
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                        <asp:ListItem Text="English" Value="English" />
                                    </asp:DropDownList>
                                </div>
                                <asp:Label ID="Label2" runat="server">Publisher Name</asp:Label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DDPulishNam" runat="server">
                                        <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                        <asp:ListItem Text="Publisher 2" Value="Publisher 2" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="Label3" runat="server">Author Name</asp:Label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DDAthorName" runat="server">
                                        <asp:ListItem Text="A1" Value="A1" />
                                        <asp:ListItem Text="A2" Value="A2" />
                                    </asp:DropDownList>
                                </div>
                                <asp:Label ID="Label5" runat="server">Publisher Date</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPubDate" Placeholder="Date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Label ID="Label9" runat="server">Gerne</asp:Label>
                                <div class="form-group">
                                    <asp:ListBox ID="ListBoxGerne" CssClass="form-control" runat="server" SelectionMode="Multiple" Rows="4">
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Weelness" Value="Weelness" />
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Art" Value="Art" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                    </asp:ListBox>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <asp:Label ID="Label10" runat="server">Edition</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtEdition" runat="server" placeholder="Edition"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="Label11" runat="server">Book Cost</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtBookCost" runat="server" placeholder="Book Cost" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="Label12" runat="server">Pages</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtPages" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="Label6" runat="server">Actual Stock</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtActStock" runat="server" placeholder="Actual Stock"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="Label8" runat="server">Current Stock</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtCurrentStock" runat="server" ReadOnly="true" placeholder="Current Stock" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="Label13" runat="server">Issued Books</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtIssBook" runat="server" ReadOnly="true" placeholder="Issued Books" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <asp:Label ID="Label4" runat="server">Book Description</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TxtBookDesc" runat="server" TextMode="MultiLine" ReadOnly="false" placeholder="Book Description"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="BtnAdd" Class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="BtnAdd_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="BtnUpdate" Class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="BtnUpdate_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="BtnDlt" Class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="BtnDlt_Click" />
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBBookInventory %>" DeleteCommand="DELETE FROM [book_master_tbl] WHERE [book_id] = @book_id" InsertCommand="INSERT INTO [book_master_tbl] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [book_cost], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (@book_id, @book_name, @genre, @author_name, @publisher_name, @publish_date, @language, @edition, @book_cost, @no_of_pages, @book_description, @actual_stock, @current_stock, @book_img_link)" SelectCommand="SELECT * FROM [book_master_tbl]" UpdateCommand="UPDATE [book_master_tbl] SET [book_name] = @book_name, [genre] = @genre, [author_name] = @author_name, [publisher_name] = @publisher_name, [publish_date] = @publish_date, [language] = @language, [edition] = @edition, [book_cost] = @book_cost, [no_of_pages] = @no_of_pages, [book_description] = @book_description, [actual_stock] = @actual_stock, [current_stock] = @current_stock, [book_img_link] = @book_img_link WHERE [book_id] = @book_id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="book_id" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="book_id" Type="String" />
                                        <asp:Parameter Name="book_name" Type="String" />
                                        <asp:Parameter Name="genre" Type="String" />
                                        <asp:Parameter Name="author_name" Type="String" />
                                        <asp:Parameter Name="publisher_name" Type="String" />
                                        <asp:Parameter Name="publish_date" Type="String" />
                                        <asp:Parameter Name="language" Type="Decimal" />
                                        <asp:Parameter Name="edition" Type="String" />
                                        <asp:Parameter Name="book_cost" Type="String" />
                                        <asp:Parameter Name="no_of_pages" Type="String" />
                                        <asp:Parameter Name="book_description" Type="String" />
                                        <asp:Parameter Name="actual_stock" Type="String" />
                                        <asp:Parameter Name="current_stock" Type="String" />
                                        <asp:Parameter Name="book_img_link" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="book_name" Type="String" />
                                        <asp:Parameter Name="genre" Type="String" />
                                        <asp:Parameter Name="author_name" Type="String" />
                                        <asp:Parameter Name="publisher_name" Type="String" />
                                        <asp:Parameter Name="publish_date" Type="String" />
                                        <asp:Parameter Name="language" Type="Decimal" />
                                        <asp:Parameter Name="edition" Type="String" />
                                        <asp:Parameter Name="book_cost" Type="String" />
                                        <asp:Parameter Name="no_of_pages" Type="String" />
                                        <asp:Parameter Name="book_description" Type="String" />
                                        <asp:Parameter Name="actual_stock" Type="String" />
                                        <asp:Parameter Name="current_stock" Type="String" />
                                        <asp:Parameter Name="book_img_link" Type="String" />
                                        <asp:Parameter Name="book_id" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:GridView AlternatingRowStyle-CssClass="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <AlternatingRowStyle CssClass="table table-striped table-bordered"></AlternatingRowStyle>
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID" FooterStyle-Font-Bold="true" ReadOnly="True" SortExpression="book_id" />

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label14" Font-Bold="true" Font-Size="X-Large" runat="server" Text='<%# Eval("book_name") %>'></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Author -
                                                                    <asp:Label ID="Label15" runat="server" Font-Bold="true" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                    &nbsp;| Genre -
                                                                    <asp:Label ID="Label16" runat="server" Font-Bold="true" Text='<%# Eval("genre") %>'></asp:Label>
                                                                    &nbsp;| Language -
                                                                    <asp:Label ID="Label17" runat="server" Font-Bold="true" Text='<%# Eval("language") %>'></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Publishers -
                                                                    <asp:Label ID="Label18" runat="server" Font-Bold="true" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                    &nbsp;| Publish Date -
                                                                    <asp:Label ID="Label19" runat="server" Font-Bold="true" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                    &nbsp;| Pages -
                                                                    <asp:Label ID="Label20" runat="server" Font-Bold="true" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                    &nbsp;| Edition -
                                                                    <asp:Label ID="Label21" Font-Bold="true" runat="server" Text='<%# Eval("edition") %>'></asp:Label>
                                                                    &nbsp;</div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Cost -
                                                                    <asp:Label ID="Label22" runat="server" Font-Bold="true" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                    &nbsp;| Actual stock -
                                                                    <asp:Label ID="Label23" runat="server" Font-Bold="true" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                    &nbsp;| Avalable Stock -
                                                                    <asp:Label ID="Label24" runat="server" Font-Bold="true" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Description -
                                                                    <asp:Label ID="Label25" runat="server" Font-Bold="true" Font-Italic="true" Text='<%# Eval("book_description") %>'></asp:Label>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image Class="img-fluid p-2" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link")  %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

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
