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
    public partial class UserSignUp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if(HiddenField1.Value != null)
            //{
            //    int val = Int32.Parse(HiddenField1.Value.ToString());
            //    val = val + 1;
            //    LabeHdn.Text = "Hidden Field Value is <b>" + val.ToString() + "</b>"; 

            //}
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (checkMemberExist())
            {
                Response.Write("<script>alert('Member Already Exist Try Another ID');</script>");
            }
            else
            {
                signUpNewUserMember();

            }

           // LabeHdn.Visible;

        }

        bool checkMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_master_tbl where member_id='" + TxtUserID.Text.Trim() + "'", con);

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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        //user define method
        void signUpNewUserMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" Insert into member_master_tbl(full_name,dob,contact_no,email,state,city,pincode,full_address,member_id,password,account_status) values (@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@member_id,@password,@account_status)", con);

                cmd.Parameters.AddWithValue("@full_name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TxtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TxtContact.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TxtEmailID.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DDLstate.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TxtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", TxtPinC.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", TxtFulAdd.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", TxtUserID.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TxtPass.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Sign Up Successful. Go to LogIn');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }


    }
}