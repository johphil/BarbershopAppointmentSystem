using BarbershopAppointmentSystem.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarbershopAppointmentSystem.Models
{
    public class Service
    {
        public int ServiceID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Bookings { get; set; }

        public string GetPrice
        {
            get
            {
                return Price.ToPeso();
            }
        }
        public string GetBookings
        {
            get
            {
                return string.Format("{0} Bookings", Bookings);
            }
        }
    }
}