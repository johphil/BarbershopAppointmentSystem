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
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["accountid"] != null)
            {
                int accountid = int.Parse(Session["accountid"].ToString());
                List<Appointment> la = Common.GetAppointments(accountid);

                if (!IsPostBack)
                {
                    repAppointments.DataSource = la;
                    repAppointments.DataBind();

                    for (int i = 0; i < la.Count; i++)
                    {
                        if (la[i].IsDone)
                        {
                            ((Label)repAppointments.Items[i].FindControl("txtFinished")).Visible = true;
                            ((Button)repAppointments.Items[i].FindControl("btnCancelSchedule")).Enabled = false;
                            ((Button)repAppointments.Items[i].FindControl("btnCancelSchedule")).Visible = false;
                        }
                        else if (la[i].IsCancelled)
                        {
                            ((Label)repAppointments.Items[i].FindControl("txtCancelled")).Visible = true;
                            ((Button)repAppointments.Items[i].FindControl("btnCancelSchedule")).Enabled = false;
                            ((Button)repAppointments.Items[i].FindControl("btnCancelSchedule")).Visible = false;
                        }
                        else
                        {
                            ((Label)repAppointments.Items[i].FindControl("txtPending")).Visible = true;
                        }
                    }
                }
            }
        }

        protected void repUpcomingAppointments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Cancel":
                    {
                        int id = int.Parse(e.CommandArgument.ToString());
                        int result = Common.CancelAppointment(id);
                        if (result > 0)
                        {
                            Common.ShowAlertWithRedirect(this, "Yey!", "Appointment cancelled!", "success", "Appointments.aspx");
                        }

                        break;
                    }
                default:
                    break;
            }
        }
    }
}