using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AdminUserManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //GridView1.DataBind();
        }

        //Go
        protected void LnkBtn_Click(object sender, EventArgs e)
        {
            getMemberID();
        }

        protected void lnkBtnActive_Click(object sender, EventArgs e)
        {
            updateMemberStatus("active");
        }

        protected void lnkBtnPending_Click(object sender, EventArgs e)
        {
            updateMemberStatus("pending");
        }

        protected void lnkBtnDlt_Click(object sender, EventArgs e)
        {
            updateMemberStatus("deactive");
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            delteMemberIb();
        }

        bool checkMemberrExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from member_master_tbl where [member_id]='" + txtMemID.Text.Trim() + "'", con);
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

        void getMemberID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from [member_master_tbl] where [member_id]='" + txtMemID.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>"); //8th posiotion
                        txtFullName.Text = dr.GetValue(0).ToString();
                        TxtAccStats.Text = dr.GetValue(10).ToString();
                        TxtDOB.Text = dr.GetValue(1).ToString();
                        TxtCont.Text = dr.GetValue(2).ToString();
                        TxtEmail.Text = dr.GetValue(3).ToString();
                        TxtState.Text = dr.GetValue(4).ToString();
                        TxtCity.Text = dr.GetValue(5).ToString();
                        TxtPin.Text = dr.GetValue(6).ToString();
                        TxtAddress.Text = dr.GetValue(7).ToString();
                    }


                }
                else
                {
                    Response.Write("<script>alert('Invalid crredentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }

        void updateMemberStatus(string status)
        {
            if (checkMemberrExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update [member_master_tbl] set account_status='" + status + "' where [member_id]='" + txtMemID.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();

                    Response.Write("<script>alert('Member status updated')</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Member ID not Exists')</script>");
            }
        }

        void delteMemberIb()
        {
            if (checkMemberrExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("delete from member_master_tbl where member_id = '" + txtMemID.Text.Trim() + "'", con);
                    ///cmd.Parameters.AddWithValue("@author_id", TxtAuthorID.Text.Trim());
                    // cmd.Parameters.AddWithValue("@author_name", TxtAuthorName.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Member deleted successfully ')</script>");
                    clearForm();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Member ID not Exists')</script>");

            }


        }
        void clearForm()
        {
            txtFullName.Text = "";
            TxtAccStats.Text = "";
            TxtDOB.Text = "";
            TxtCont.Text = "";
            TxtEmail.Text = "";
            TxtState.Text = "";
            TxtCity.Text = "";
            TxtPin.Text = "";
            TxtAddress.Text = "";
        }


    }
}