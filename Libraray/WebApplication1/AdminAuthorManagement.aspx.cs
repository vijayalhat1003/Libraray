using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebApplication1
{
    public partial class AdminAuthorManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (checkAuthorExist())
            {
                Response.Write("<script>alert('Author ID is already existed Try another one')</script>");

            }
            else
            {
                ADdNewAuthor();
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (checkAuthorExist())
            {
                UpdateAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author ID is not Exist')</script>");
            }
        }

        protected void btnDlt_Click(object sender, EventArgs e)
        {
            if (checkAuthorExist())
            {
                DeleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author ID is not Exist')</script>");
            }
        }

        //GO
        protected void btnSignUpGo_Click(object sender, EventArgs e)
        {
            GetAuthorByID();
        }

        void GetAuthorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from author_master_tbl where author_id='" + TxtAuthorID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TxtAuthorName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid ID')</script>");
                }
            }


            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }

        bool checkAuthorExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from author_master_tbl where author_id='"+ TxtAuthorID.Text.Trim()+ "'", con);
                SqlDataAdapter da =new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if(dt.Rows.Count >= 01 )
                {
                    return true;
                }
                else 
                {
                    return false;
                }
            }


            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;

            }
        }

        void ADdNewAuthor()
        {
            try 
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Insert into author_master_tbl (author_id, author_name) values (@author_id, @author_name)", con);
                cmd.Parameters.AddWithValue("@author_id", TxtAuthorID.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", TxtAuthorName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author added successful ')</script>");
                clearForm();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void UpdateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Update author_master_tbl set author_name=@author_name where author_id = '" + TxtAuthorID.Text.Trim() + "'", con);
                ///cmd.Parameters.AddWithValue("@author_id", TxtAuthorID.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", TxtAuthorName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated successfully ')</script>");
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void DeleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("delete from author_master_tbl where author_id = '" + TxtAuthorID.Text.Trim() + "'", con);
                ///cmd.Parameters.AddWithValue("@author_id", TxtAuthorID.Text.Trim());
               // cmd.Parameters.AddWithValue("@author_name", TxtAuthorName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author deleted successfully ')</script>");
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void clearForm()
        {
            TxtAuthorID.Text = "";
            TxtAuthorName.Text = "";

        }

    }
}