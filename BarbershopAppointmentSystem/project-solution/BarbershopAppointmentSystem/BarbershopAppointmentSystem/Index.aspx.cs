using BarbershopAppointmentSystem.Classes;
using BarbershopAppointmentSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BarbershopAppointmentSystem
{
    public partial class Index : System.Web.UI.Page
    {
        Account account;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["accountid"] != null)
                {
                    Common.InitAdminLink(this, (bool)Session["isadmin"]);
                }
                else
                    Response.Redirect("Login.aspx");
            }
        }
    }
}