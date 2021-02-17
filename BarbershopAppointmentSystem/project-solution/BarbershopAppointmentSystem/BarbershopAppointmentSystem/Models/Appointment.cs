using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarbershopAppointmentSystem.Models
{
    public class Appointment
    {
        public int AppointmentID { get; set; }
        public Schedule Schedule { get; set; }
        public Account Account { get; set; }
        public DateTime DateClicked { get; set; }
        public bool IsDone { get; set; }
        public bool IsCancelled { get; set; }
        public DateTime DateUpdated { get; set; }

        public string GetStatus
        {
            get
            {
                if (IsDone)
                    return "Finished";
                else if (IsCancelled)
                    return "Cancelled";
                else
                    return "Pending";
            }
        }
        public string GetTimeSpan
        {
            get
            {
                TimeSpan span = (DateTime.Now - DateClicked);
                if (span.Seconds > 0 && span.Minutes == 0)
                    return string.Format("{0} secs ago", span.Seconds);
                else if (span.Minutes > 0 && span.Hours == 0)
                    return string.Format("{0} mins ago", span.Minutes);
                else if (span.Hours > 0 && span.Days == 0)
                    return string.Format("{0} hrs ago", span.Hours);
                else if (span.Days > 0)
                    return string.Format("{0} days ago", span.Days);
                else
                    return "";
            }
        }
    }
}