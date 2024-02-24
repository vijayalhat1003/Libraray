using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].Equals(""))
                {
                    LnkBtnUser.Visible = true;
                    LnkBtnSgnUp.Visible = true;
                    LnkBtnLogOut.Visible = false;
                    LnkBtnHelloUser.Visible = false;

                    LnkBtnAdmLogIn.Visible = true;
                    LnkBtnAthrManag.Visible = false;
                    LnkBtnPublMang.Visible = false;
                    LnkBtnBookInventory.Visible=false;
                    LnkBtnBookIss.Visible = false;
                    LnkBtnMembMang.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    LnkBtnUser.Visible = false;
                    LnkBtnSgnUp.Visible = false;
                    LnkBtnLogOut.Visible = true;
                    LnkBtnHelloUser.Visible = true;
                    LnkBtnHelloUser.Text = "Hello " + Session["username"].ToString();

                    LnkBtnAdmLogIn.Visible = true;
                    LnkBtnAthrManag.Visible = false;
                    LnkBtnPublMang.Visible = false;
                    LnkBtnBookInventory.Visible = false;
                    LnkBtnBookIss.Visible = false;
                    LnkBtnMembMang.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    LnkBtnUser.Visible = false;
                    LnkBtnSgnUp.Visible = false;
                    LnkBtnLogOut.Visible = true;
                    LnkBtnHelloUser.Visible = true;
                    LnkBtnHelloUser.Text = "Hello Admin";

                    LnkBtnAdmLogIn.Visible = false;
                    LnkBtnAthrManag.Visible = true;
                    LnkBtnPublMang.Visible = true;
                    LnkBtnBookInventory.Visible = true;
                    LnkBtnBookIss.Visible = true;
                    LnkBtnMembMang.Visible = true;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void LnkBtnAdmLogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogIn.aspx");
        }

        protected void LnkBtnAthrManag_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAuthorManagement.aspx");
        }

        protected void LnkBtnPublMang_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPublisherManagement.aspx");
        }

        protected void LnkBtnBookIss_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookIssue.aspx");
        }

        protected void LnkBtnMembMang_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMemberManagement.aspx");
        }

        protected void LnkBtnVwBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookIssue.aspx");
        }

        protected void LnkBtnUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void LnkBtnSgnUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUp.aspx");
        }

        protected void LnkBtnBookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookInventory.aspx");
        }


        protected void LnkBtnLogOut_Click1(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LnkBtnUser.Visible = true;
            LnkBtnSgnUp.Visible = true;
            LnkBtnLogOut.Visible = false;
            LnkBtnHelloUser.Visible = false;

            LnkBtnAdmLogIn.Visible = true;
            LnkBtnAthrManag.Visible = false;
            LnkBtnPublMang.Visible = false;
            LnkBtnBookInventory.Visible = false;
            LnkBtnBookIss.Visible = false;
            LnkBtnMembMang.Visible = false;
        }

        protected void LnkBtnHelloUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
}