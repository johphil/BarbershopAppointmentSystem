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
        private static int selectedServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                List<Service> lps = Common.GetPopularServices();
                List<Service> las = Common.GetAllServices();

                repPopularItem.DataSource = lps;
                repPopularItem.DataBind();

                repAllItems.DataSource = las;
                repAllItems.DataBind();
            //}
        }

        protected void repPopularItem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "SelectItem":
                    {
                        int id = int.Parse(e.CommandArgument.ToString());
                        selectedServiceID = id;
                        Service s = Common.GetService(id);
                        List<Barber> lb = Common.GetServiceBarbers(id);
                        txtModalTitle.Text = s.Name;
                        txtModalPrice.Text = s.GetPrice;

                        cbModalBarbers.Items.Clear();
                        cbModalDate.Items.Clear();
                        cbModalTime.Items.Clear();

                        cbModalBarbers.Items.Add(new ListItem("Select barber", ""));
                        foreach (var item in lb)
                        {
                            cbModalBarbers.Items.Add(new ListItem(item.Name, item.BarberID.ToString()));
                        }

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "showItemModal();", true);

                        break;
                    }
                default:
                    break;
            }
        }

        protected void cbModalBarbers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(cbModalBarbers.SelectedValue))
            {
                List<DateTime> ld = Common.GetServiceBarberScheduleDates(selectedServiceID, int.Parse(cbModalBarbers.SelectedValue.ToString()));

                cbModalDate.Items.Clear();
                cbModalDate.Items.Add(new ListItem("Select date", ""));
                foreach (var item in ld)
                {
                    cbModalDate.Items.Add(new ListItem(item.Date.DateOnly2(), item.Date.DateOnly()));
                }
            }
            else
            {
                cbModalDate.Items.Clear();
                cbModalTime.Items.Clear();
            }
        }

        protected void cbModalDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(cbModalDate.SelectedValue))
            {
                List<TimeSlot> lt = Common.GetServiceBarberScheduleDateTimes(selectedServiceID, int.Parse(cbModalBarbers.SelectedValue.ToString()), DateTime.Parse(cbModalDate.SelectedValue.ToString()));

                cbModalTime.Items.Clear();
                cbModalTime.Items.Add(new ListItem("Select time", ""));
                foreach (var item in lt)
                {
                    cbModalTime.Items.Add(new ListItem(item.TimeString, item.TimeSlotID.ToString()));
                }
            }
            else
            {
                cbModalTime.Items.Clear();
            }
        }

        protected void repAllItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "SelectItem":
                    {
                        int id = int.Parse(e.CommandArgument.ToString());
                        selectedServiceID = id;
                        Service s = Common.GetService(id);
                        List<Barber> lb = Common.GetServiceBarbers(id);
                        txtModalTitle.Text = s.Name;
                        txtModalPrice.Text = s.GetPrice;

                        cbModalBarbers.Items.Clear();
                        cbModalDate.Items.Clear();
                        cbModalTime.Items.Clear();

                        cbModalBarbers.Items.Add(new ListItem("Select barber", ""));
                        foreach (var item in lb)
                        {
                            cbModalBarbers.Items.Add(new ListItem(item.Name, item.BarberID.ToString()));
                        }

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "showItemModal();", true);

                        break;
                    }
                default:
                    break;
            }
        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            if (IsValidInputs())
            {
                int accountid = int.Parse(Session["accountid"].ToString());
                int serviceid = selectedServiceID;
                int barberid = int.Parse(cbModalBarbers.SelectedValue);
                DateTime scheduledate = DateTime.Parse(cbModalDate.SelectedValue);
                int timeslotid = int.Parse(cbModalTime.SelectedValue);

                int result = Common.AddAppointment(accountid, serviceid, barberid, scheduledate, timeslotid);

                //ScriptManager.RegisterStartupScript(this, this.GetType(), "closeModal", "closeItemModal();", true);

                if (result == -69)
                {
                    Common.ShowAlert(this, "Ops!", "Meron ka na schedule nito eh, tignan mo sa appointments", "error");
                }
                else if (result == -1)
                {
                    Common.ShowAlert(this, "Ops!", "May error", "error");
                }
                else
                {
                    Common.ShowAlertWithRedirect(this, "Yey!", "Appointment scheduled!", "success", "Appointments.aspx");
                }
            }
        }

        private bool IsValidInputs()
        {
            if (string.IsNullOrEmpty(cbModalBarbers.SelectedValue))
            {
                Common.ShowAlert(this, "Ops!", "Pumili muna ng barbero", "error");
                return false;
            }
            else if (string.IsNullOrEmpty(cbModalDate.SelectedValue))
            {
                Common.ShowAlert(this, "Ops!", "Pumili muna ng petsa", "error");
                return false;
            }
            else if (string.IsNullOrEmpty(cbModalTime.SelectedValue))
            {
                Common.ShowAlert(this, "Ops!", "Pumili muna ng oras", "error");
                return false;
            }
            else if (Session["accountid"] == null)
            {
                Common.ShowAlert(this, "Ops!", "Session Invalid!", "error");
                return false;
            }

            return true;
        }
    }
}