using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarbershopAppointmentSystem.Models
{
    public class TimeSlot
    {
        public int TimeSlotID { get; set; }
        public string TimeString { get; set; }
        public TimeSpan Time { get; set; }
    }
}