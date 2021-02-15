using BarbershopAppointmentSystem.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BarbershopAppointmentSystem
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string email = Request.QueryString["email"];
                if (!string.IsNullOrEmpty(email))
                {
                    tbEmail.Value = Request.QueryString["email"];
                    tbPassword.Focus();
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int result = Common.GetAccountID(tbEmail.Value, tbPassword.Value);
            if (result < 0)
            {
                Common.ShowAlert(this, "Ops!", "Di kapa registered eh.", "error");
                tbEmail.Focus();
            }
            else
            {
                Session["accountid"] = result;
                Common.ShowAlertWithRedirect(this, "Success!", "Login na kita.", "success", "Profile.aspx");
            }
        }
    }
}