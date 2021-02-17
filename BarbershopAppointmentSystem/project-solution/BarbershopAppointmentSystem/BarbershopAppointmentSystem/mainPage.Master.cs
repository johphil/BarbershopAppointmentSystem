using BarbershopAppointmentSystem.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BarbershopAppointmentSystem
{
    public partial class mainPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                Response.Redirect("Login.aspx");
            }

            if (Session["username"] != null)
            {
                txtNavUsername.Text = Session["username"].ToString();
            }

            if (Session["isadmin"] != null && (bool)Session["isadmin"])
            {
                adminpanelLink.Visible = true;
            }
            else
            {
                adminpanelLink.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}