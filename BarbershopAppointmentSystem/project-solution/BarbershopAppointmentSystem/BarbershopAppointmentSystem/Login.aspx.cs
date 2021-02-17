using BarbershopAppointmentSystem.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BarbershopAppointmentSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["email"] != null)
                {
                    tbEmail.Value = Request.Cookies["email"].Value;
                    chkRememberMe.Checked = true;
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
                if (chkRememberMe.Checked)
                {
                    Response.Cookies["email"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["email"].Value = tbEmail.Value.ToString();
                }
                else
                {
                    Response.Cookies["email"].Value = null;
                }

                Session.Clear();

                Session["isadmin"] = Common.IsAdmin(result);
                Session["username"] = Common.GetUsername(result);
                Session["accountid"] = result;
                Common.ShowAlertWithRedirect(this, "Success!", "Login na kita.", "success", "Index.aspx");
            }
        }
    }
}