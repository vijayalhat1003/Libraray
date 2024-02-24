using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace WebApplication1
{
    public partial class AdminBookInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillAuthorPublisherValue();
            }
            GridView1.DataBind();

        }


        protected void BtnGo_Click(object sender, EventArgs e)
        {
            getBookByID();
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            if (checkBookExist())
            {
                Response.Write("<script>alert('Book already esist');</script>");

            }
            else
            {
                AddNewBooks();
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (checkBookExist())
            {
                
                updatedBookID();
            }
            else
            {
                Response.Write("<script>alert('Invalid ID');</script>");
            }
        }

        protected void BtnDlt_Click(object sender, EventArgs e)
        {
            if (checkBookExist())
            {
                deleteBookID();
            }
            else
            {
                Response.Write("<script>alert('Invalid ID');</script>");
            }
        }

        void FillAuthorPublisherValue()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select author_name from author_master_tbl", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DDAthorName.DataSource = dt;
                DDAthorName.DataValueField = "author_name";
                DDAthorName.DataBind();

                cmd = new SqlCommand("select publisher_name from publisher_master_tbl", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DDPulishNam.DataSource = dt;
                DDPulishNam.DataValueField = "publisher_name";
                DDPulishNam.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
        bool checkBookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from book_master_tbl where book_id='" + TxtBookID.Text.Trim() + "' or book_name='" + txtBookName.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 01)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }


            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;

            }
        }

        void AddNewBooks()
        {
            try
            {
                
                string genres = "";

                foreach (int i in ListBoxGerne.GetSelectedIndices())
                {
                    genres = genres + ListBoxGerne.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);

                string filepath = "BooksInve/b3.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("BooksInve/" + filename));
                filepath = "BooksInve/" + filename;

                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string qurey = "insert into book_master_tbl (book_id, book_name, genre, author_name, publisher_name, publish_date, language, edition, book_cost, no_of_pages, book_description, actual_stock, current_stock, book_img_link) values (@book_id, @book_name, @genre, @author_name, @publisher_name, @publish_date, @language, @edition, @book_cost, @no_of_pages, @book_description, @actual_stock, @current_stock, @book_img_link) ";
                SqlCommand cmd = new SqlCommand(qurey, con);
                cmd.Parameters.AddWithValue("@book_id", TxtBookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);// genres);
                cmd.Parameters.AddWithValue("@author_name", DDAthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DDPulishNam.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", txtPubDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DDLang.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", TxtEdition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", TxtBookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", TxtPages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TxtBookDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TxtActStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TxtActStock.Text.Trim()); // bcz we insert 1st time 
                cmd.Parameters.AddWithValue("@book_img_link", filepath); // filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Added Book')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void updatedBookID()
        {
            if(checkBookExist())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(TxtActStock.Text.Trim());
                    int current_stock = Convert.ToInt32(TxtCurrentStock.Text.Trim());

                    if(global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if(actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual stock value stock cannot be less than the issued books')</script>");
                            return;
                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            TxtCurrentStock.Text = "" + current_stock;
                        }
                    }
                    string genres = "";

                    foreach (int i in ListBoxGerne.GetSelectedIndices())
                    {
                        genres = genres + ListBoxGerne.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "BooksInve/b3.jpg";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if(filename == "" || filename==null)
                    {
                        filepath = global_filepath;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("BooksInve/" + filename));
                        filepath = "BooksInve/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if(con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update book_master_tbl set book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, actual_stock=@actual_stock, current_stock=@current_stock, book_img_link= @book_img_link where book_id", con);
                    cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);// genres);
                    cmd.Parameters.AddWithValue("@author_name", DDAthorName.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DDPulishNam.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", txtPubDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DDLang.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", TxtEdition.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", TxtBookCost.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", TxtPages.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TxtBookDesc.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString()); // bcz we insert 1st time 
                    cmd.Parameters.AddWithValue("@book_img_link", filepath); // filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Book updated successfully');</script>");
                }
                catch(Exception ex) 
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }

        void deleteBookID()
        {
            if(checkBookExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("delete from book_master_tbl where book_id='"+ TxtBookID.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Member deleted successully');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from book_master_tbl where book_id='"+ TxtBookID.Text.Trim()+ "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtBookName.Text = dt.Rows[0]["book_name"].ToString();
                    txtPubDate.Text = dt.Rows[0]["publish_date"].ToString();
                    TxtEdition.Text = dt.Rows[0]["edition"].ToString();
                    TxtBookCost.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    TxtPages.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    TxtActStock.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TxtBookDesc.Text = dt.Rows[0]["book_description"].ToString();
                    TxtCurrentStock.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    TxtIssBook.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    DDLang.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DDPulishNam.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    DDAthorName.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();
                    ListBoxGerne.ClearSelection();

                    string[] gerne = dt.Rows[0]["gerne"].ToString().Trim().Split(',');

                    for (int i = 0; i < gerne.Length; i++)
                    {
                        for (int j = 0; j < ListBoxGerne.Items.Count; j++)
                        {
                            if (ListBoxGerne.Items[j].ToString() == gerne[i])
                            {
                                ListBoxGerne.Items[j].Selected = true; // multiselect feature
                            }

                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID')</script>");

                }

            }
            catch(Exception ex)
            {

            }

        }
    }
}