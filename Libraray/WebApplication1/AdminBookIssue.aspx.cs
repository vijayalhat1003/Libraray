using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AdminBookIssue : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void BtnIssue_Click(object sender, EventArgs e)
        {
            if (checkIfBookExist() && checkIfMemberExist())
            {
                if (checkIfIssueEntryExist())
                {
                    Response.Write("<script>alert('Member is already has this book')</script>");
                }
                else 
                { 
                    issueBook();
                } 
            }
            else
            {
                Response.Write("<script>alert('wrong book id or member id')</script>");
            }
        }

        protected void BtnReturn_Click(object sender, EventArgs e) 
        {
            if (checkIfBookExist() && checkIfMemberExist())
            {
                if (checkIfIssueEntryExist())
                {
                    ReturnBook();
                }
                else
                {
                    Response.Write("<script>alert('Issue book does not exist')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('wrong book id or member id')</script>");
            }
        }

        protected void BtnGo_Click(object sender, EventArgs e)
        {
            getNames();


        }
    
        void getNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed )
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select book_name from book_master_tbl where book_id='" + TxtBookID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable(); 
                da.Fill(dt);

                if(dt.Rows.Count >= 1) 
                {
                    TxtbookNam.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong book id');</script>");
                }

                cmd = new SqlCommand("select full_name from member_master_tbl where member_id ='" + TxtMemID.Text.Trim()+ "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                if(dt.Rows.Count >= 1)
                {
                    TxtMemNam.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Name');</script>");
                }
            }
            catch(Exception ex) 
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");

            }

        }

        bool checkIfIssueEntryExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_issue_tbl where member_id ='" + TxtMemID.Text.Trim() + "' and book_id='" + TxtBookID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
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
                return false;
            }
            
        }

        bool checkIfBookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select book_name from book_master_tbl where book_id='" + TxtBookID.Text.Trim() + "' and current_stock >0", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch ( Exception ex )
            {
                return false;
            }
        }

        bool checkIfMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select full_name from member_master_tbl where member_id ='" + TxtMemID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
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
                     return false;
            }
           
        }

        void issueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into book_issue_tbl (member_id, member_name, book_id, book_name, issue_date, due_date) values (@member_id, @member_name, @book_id, @book_name, @issue_date, @due_date)", con);
                cmd.Parameters.AddWithValue("@member_id", TxtMemID.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", TxtMemNam.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", TxtBookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TxtbookNam.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", TxtIssueDate.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", TxtEndDate.Text.Trim());
                
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand("update book_master_tbl set current_stock= current_stock-1 where book_id='" + TxtBookID.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery(); 
                con.Close();
                Response.Write("<script>alert('Book issued successfully')</script>");
                GridView1.DataBind();


            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"')</script>");
            }
        }

        void ReturnBook()
        {
            try { 
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("Delete from book_issue_tbl where book_id='" + TxtBookID.Text.Trim() + "' and member_id ='" + TxtMemID.Text.Trim() + "' ", con);
            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                cmd = new SqlCommand("update book_master_tbl set current_stock= current_stock+1 where book_id='" + TxtBookID.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book returned successfully')</script>");
                GridView1.DataBind();
                con.Close();
            }
            else
            {
                Response.Write("<script>alert('Invalid Details')</script>");
            }
            }catch(Exception ex)
            {
                Response.Write("<script>alert('Invalid details')</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //check condition
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleGoldenrod;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    
    }

}