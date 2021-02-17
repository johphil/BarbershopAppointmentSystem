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
    public partial class Profile : System.Web.UI.Page
    {
        Account account;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["accountid"] != null)
                {
                    account = Common.GetAccountDetails(int.Parse(Session["accountid"].ToString()));

                    if (account != null)
                    {
                        tbUsername.Value = account.Username;
                        tbEmail.Value = account.Email;
                        tbFirstName.Value = account.FirstName;
                        tbLastName.Value = account.LastName;
                        rbGender.SelectedValue = account.Gender.ToString();
                        dpBirthday.Text = account.Birthday.Value.DateOnly();
                        tbIntroduction.Value = account.Introduction;
                        tbAddress.Value = account.Address;
                        tbContatNumber.Value = account.ContactNo;
                    }
                    else
                        Response.Redirect("404.aspx");
                }
                else
                    Response.Redirect("Login.aspx");
            }
        }

        protected void btnSaveUserSettings_Click(object sender, EventArgs e)
        {
            DateTime? bday = null;
            char? gender = null;

            if (!string.IsNullOrEmpty(dpBirthday.Text))
            {
                bday = DateTime.Parse(dpBirthday.Text);
            }

            if (!string.IsNullOrEmpty(rbGender.SelectedValue))
            {
                gender = char.Parse(rbGender.SelectedValue);
            }

            Account account = new Account
            {
                AccountID = int.Parse(Session["accountid"].ToString()),
                FirstName = tbFirstName.Value.ToString(),
                LastName = tbLastName.Value.ToString(),
                Gender = gender,
                Birthday = bday
            };

            if (Common.SaveAccountDetails(account) > 0)
                Common.ShowAlert(this, "Success!", "User Details sevad!", "success");
            else
                Common.ShowAlert(this, "Ops!", "Error saving data.", "error");
        }

        protected void btnSaveIntroduction_Click(object sender, EventArgs e)
        {
            if (Common.SaveAccountIntroduction(int.Parse(Session["accountid"].ToString()), tbIntroduction.Value.ToString()) > 0)
                Common.ShowAlert(this, "Success!", "User Details sevad!", "success");
            else
                Common.ShowAlert(this, "Ops!", "Error saving data.", "error");
        }

        protected void btnSaveContactSettings_Click(object sender, EventArgs e)
        {
            if (Common.SaveAccountContactSettings(int.Parse(Session["accountid"].ToString()), tbAddress.Value.ToString(), tbContatNumber.Value.ToString()) > 0)
                Common.ShowAlert(this, "Success!", "User Details sevad!", "success");
            else
                Common.ShowAlert(this, "Ops!", "Error saving data.", "error");
        }
    }
}