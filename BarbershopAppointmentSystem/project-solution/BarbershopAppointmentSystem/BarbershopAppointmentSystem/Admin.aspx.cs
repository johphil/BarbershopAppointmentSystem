using BarbershopAppointmentSystem.Classes;
using BarbershopAppointmentSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BarbershopAppointmentSystem
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Barber> lb = Common.GetBarbers();
            List<Service> ls = Common.GetServices();
            List<TimeSlot> lts = Common.GetTimeSlots();
            List<Schedule> lss = Common.GetSchedules();

            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = Session["selTab"] == null ? 0 : int.Parse(Session["selTab"].ToString());
                //Schedules
                foreach (var item in ls)
                {
                    cbService.Items.Add(new ListItem(item.Name, item.ServiceID.ToString()));
                }
                foreach (var item in lb)
                {
                    cbBarber.Items.Add(new ListItem(item.Name, item.BarberID.ToString()));
                }
                foreach (var item in lts)
                {
                    cbTimeSlot.Items.Add(new ListItem(item.TimeString, item.TimeSlotID.ToString()));
                }

                //Services
                repService.DataSource = ls;
                repService.DataBind();

                //Barbers
                repBarbers.DataSource = lb;
                repBarbers.DataBind();

                //Schedules
                repSchedule.DataSource = lss;
                repSchedule.DataBind();
            }
        }

        private bool IsValidInputs_Schedule()
        {
            if (cbService.SelectedValue == null || string.IsNullOrEmpty(cbService.SelectedValue))
            {
                Common.ShowAlert(this, "Wait!", "Select a service.", "error");
                return false;
            }
            else if (cbBarber.SelectedValue == null || string.IsNullOrEmpty(cbBarber.SelectedValue))
            { 
                Common.ShowAlert(this, "Wait!", "Select a barver.", "error");
                return false;
            }
            else if (cbTimeSlot.SelectedValue == null || string.IsNullOrEmpty(cbTimeSlot.SelectedValue))
            {   
                Common.ShowAlert(this, "Wait!", "Select a timeslot.", "error");
                return false;
            }
            else if (string.IsNullOrEmpty(dpScheduleDate.Text))
            { 
                Common.ShowAlert(this, "Wait!", "Select a date.", "error");
                return false;
            }

            return true;
        }

        protected void btnAddBarber_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(tbBarberName.Value))
            {
                if (Common.AddBarber(tbBarberName.Value.ToString().Trim()) > 0)
                {
                    Common.ShowAlertWithRedirect(this, "Yey!", "Nadagdag na po ang barber.", "success", "Admin.aspx");
                    Session["selTab"] = 3;
                }
            }
        }

        protected void repBarbers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Remove":
                    {
                        int id = int.Parse(e.CommandArgument.ToString());

                        if (Common.DeleteBarber(id) > 0)
                        {
                            Common.ShowAlertWithRedirect(this, "Yey!", "Ok na, natanggal na.", "success", "Admin.aspx");
                            Session["selTab"] = 3;
                        }
                        else
                        {
                            Common.ShowAlert(this, "Hindi madelete!", "ito ay maaaring ginagamit kaya hindi pwede madelete.", "info");
                        }

                        break;
                    }
                default:
                    break;
            }
        }

        protected void btnAddService_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(tbServiceName.Value))
            {
                if (Common.AddService(tbServiceName.Value.ToString().Trim(), decimal.Parse(tbPrice.Text)) > 0)
                {
                    Common.ShowAlertWithRedirect(this, "Yey!", "Nadagdag na po ang service.", "success", "Admin.aspx");
                    Session["selTab"] = 2;
                }
            }
        }

        protected void repService_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Remove":
                    {
                        int id = int.Parse(e.CommandArgument.ToString());

                        if (Common.DeleteService(id) > 0)
                        {
                            Common.ShowAlertWithRedirect(this, "Yey!", "Ok na, natanggal na.", "success", "Admin.aspx");
                            Session["selTab"] = 2;
                        }
                        else
                        {
                            Common.ShowAlert(this, "Hindi madelete!", "ito ay maaaring ginagamit kaya hindi pwede madelete.", "info");
                        }

                        break;
                    }
                default:
                    break;
            }
        }

        protected void btnAddSchedule_Click(object sender, EventArgs e)
        {
            if (IsValidInputs_Schedule())
            {
                int serviceid = int.Parse(cbService.SelectedValue);
                int barberid = int.Parse(cbBarber.SelectedValue);
                DateTime scheduledate = DateTime.Parse(dpScheduleDate.Text);
                int timeslotid = int.Parse(cbTimeSlot.SelectedValue);

                int result = Common.AddSchedule(serviceid, barberid, scheduledate, timeslotid);
                if (result == -69)
                {
                    Common.ShowAlert(this, "Wait!", "This schedule is already available.", "info");
                }
                else if (result == -1)
                {
                    Common.ShowAlert(this, "Ops!", "May error. Try ulit.", "error");
                }
                else
                {
                    Common.ShowAlertWithRedirect(this, "Yey!", "Schedule added.", "success", "Admin.aspx");
                    Session["selTab"] = 1;
                }
            }
        }

        protected void repSchedule_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Remove":
                    {
                        int id = int.Parse(e.CommandArgument.ToString());

                        if (Common.DeleteSchedule(id) > 0)
                        {
                            Common.ShowAlertWithRedirect(this, "Yey!", "Ok na, natanggal na.", "success", "Admin.aspx");
                            Session["selTab"] = 1;
                        }
                        else
                        {
                            Common.ShowAlert(this, "Hindi madelete!", "ito ay maaaring ginagamit kaya hindi pwede madelete.", "info");
                        }

                        break;
                    }
                default:
                    break;
            }
        }

        protected void btnView1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            Session["selTab"] = 0;
        }

        protected void btnView2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            Session["selTab"] = 1;
        }

        protected void btnView3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            Session["selTab"] = 2;
        }

        protected void btnView4_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
            Session["selTab"] = 3;
        }
    }
}