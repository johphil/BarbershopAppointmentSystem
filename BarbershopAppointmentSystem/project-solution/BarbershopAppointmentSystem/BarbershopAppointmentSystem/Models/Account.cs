using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarbershopAppointmentSystem.Models
{
    public class Account
    {
        //Account
        public int AccountID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public bool bAdmin { get; set; }
        public DateTime? DateRegistration { get; set; }
        public DateTime? DateLastLogin { get; set; }
        public DateTime? DateLastPasswordReset { get; set; }

        //Account Details
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public char? Gender { get; set; }
        public DateTime? Birthday { get; set; }
        public string Address { get; set; }
        public string ContactNo { get; set; }
        public string Introduction { get; set; }
    }
}