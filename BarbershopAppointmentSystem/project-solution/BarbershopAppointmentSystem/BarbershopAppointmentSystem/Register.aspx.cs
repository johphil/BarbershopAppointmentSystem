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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (IsValidInputs())
            {
                Account account = new Account
                {
                    Username = tbUsername.Value,
                    FirstName = tbFirstName.Value,
                    LastName = tbLastName.Value,
                    Email = tbEmail.Value,
                    Password = tbPassword.Value
                };
                
                int result = Common.Register(account);

                if (result == -1)
                {
                    Common.ShowAlert(this, "Ops!", "Hindi pareho ang passwords.", "error");
                }
                else if (result == -69)
                {
                    //Common.ShowAlertWithRedirect(this, "Ops!", "Username exest.", "error", "Profile.aspx");
                    Common.ShowAlert(this, "Ops!", "Username exest.", "error");
                    tbUsername.Focus();
                }
                else if (result == -6969)
                {
                    Common.ShowAlert(this, "Ops!", "Email exest.", "error");
                    tbEmail.Focus();
                }
                else
                {
                    Common.ShowAlert(this, "Success!", "Tagumpay.", "success");
                    Response.Redirect("Profile.aspx");
                }
            }
        }

        private bool IsValidInputs()
        {
            if (tbPassword.Value != tbPasswordRepeat.Value)
            {
                Common.ShowAlert(this, "Ops!", "Hindi pareho ang passwords.", "error");
                tbPassword.Focus();
                return false;
            }

            return true;
        }
    }
}