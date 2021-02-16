using BarbershopAppointmentSystem.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarbershopAppointmentSystem.Models
{
    public class Schedule
    {
        public int ScheduleID { get; set; }
        public Service Service { get; set; }
        public Barber Barber { get; set; }
        public DateTime ScheduleDate { get; set; }
        public TimeSlot TimeSlot { get; set; }

        public string GetDate
        {
            get
            {
                return ScheduleDate.DateOnly2();
            }
        }
    }
}