using BarbershopAppointmentSystem.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;

namespace BarbershopAppointmentSystem.Classes
{
    public static class Common
    {
        #region SqlConnectionString
        public static string ConString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["DAATASBE"]?.ConnectionString;
            }
        }
        #endregion

        #region MD5Hash
        private static string key = ".pls.donotchange.";
        public static string MD5Hash(string text)
        {
            using (var md5 = new MD5CryptoServiceProvider())
            {
                using (var tdes = new TripleDESCryptoServiceProvider())
                {
                    tdes.Key = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                    tdes.Mode = CipherMode.ECB;
                    tdes.Padding = PaddingMode.PKCS7;

                    using (var transform = tdes.CreateEncryptor())
                    {
                        byte[] textBytes = UTF8Encoding.UTF8.GetBytes(text.ToLower());
                        byte[] bytes = transform.TransformFinalBlock(textBytes, 0, textBytes.Length);
                        return Convert.ToBase64String(bytes, 0, bytes.Length);
                    }
                }
            }
        }
        public static string MD5HashDecrypt(string cipher)
        {
            using (var md5 = new MD5CryptoServiceProvider())
            {
                using (var tdes = new TripleDESCryptoServiceProvider())
                {
                    tdes.Key = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                    tdes.Mode = CipherMode.ECB;
                    tdes.Padding = PaddingMode.PKCS7;

                    using (var transform = tdes.CreateDecryptor())
                    {
                        byte[] cipherBytes = Convert.FromBase64String(cipher);
                        byte[] bytes = transform.TransformFinalBlock(cipherBytes, 0, cipherBytes.Length);
                        return UTF8Encoding.UTF8.GetString(bytes);
                    }
                }
            }
        }
        #endregion

        #region Alerts
        public static void ShowAlert(Page p, string title, string message, string type)
        {
            ScriptManager.RegisterClientScriptBlock(p, p.GetType(), "SweetAlert", string.Format("Swal.fire('{0}', '{1}', '{2}');", title, message, type), true);
            //p.ClientScript.RegisterStartupScript(p.GetType(), "SweetAlert", string.Format("Swal.fire('{0}', '{1}', '{2}');", title, message, type), true);
        }
        public static void ShowAlertWithRedirect(Page p, string title, string message, string type, string redirect)
        {
            string script = string.Format("Swal.fire('{0}', '{1}', '{2}').then(function() {{ window.location = '{3}'; }});", title, message, type, redirect);
            ScriptManager.RegisterClientScriptBlock(p, p.GetType(), "SweetAlert2", script, true);
            //p.ClientScript.RegisterStartupScript(p.GetType(), "SweetAlert2", script, true);
        }
        #endregion

        #region RegisterLogin
        public static int Register(Account account)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spRegister", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("username", SqlDbType.VarChar, 20).Value = account.Username;
                        command.Parameters.Add("firstname", SqlDbType.VarChar, 50).Value = account.FirstName;
                        command.Parameters.Add("lastname", SqlDbType.VarChar, 50).Value = account.LastName;
                        command.Parameters.Add("email", SqlDbType.VarChar, 50).Value = account.Email;
                        command.Parameters.Add("password", SqlDbType.VarChar, 32).Value = MD5Hash(account.Password);

                        connection.Open();
                        return (int)command.ExecuteScalar();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        public static int GetAccountID(string email, string password)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spLogin", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("email", SqlDbType.VarChar, 50).Value = email;
                        command.Parameters.Add("password", SqlDbType.VarChar, 32).Value = MD5Hash(password);

                        connection.Open();
                        return (int)command.ExecuteScalar();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        #endregion

        #region Account
        public static Account GetAccountDetails(int accountid)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetAccountDetails", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("accountid", SqlDbType.Int).Value = accountid;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                return new Account
                                {
                                    AccountID = reader.GetInt32(0),
                                    Username = reader.GetString(1),
                                    bAdmin = reader.GetBoolean(2),
                                    DateRegistration = reader.GetDateTime(3),
                                    DateLastLogin = DBConvert.To<DateTime>(reader[4]),
                                    DateLastPasswordReset = DBConvert.To<DateTime>(reader[5]),
                                    FirstName = reader.GetString(6),
                                    LastName = reader.GetString(7),
                                    Email = reader.GetString(8),
                                    Gender = DBConvert.To<char>(reader[9]),
                                    Birthday = DBConvert.To<DateTime>(reader[10]),
                                    Address = DBConvert.To<string>(reader[11]),
                                    ContactNo = DBConvert.To<string>(reader[12]),
                                    Introduction = DBConvert.To<string>(reader[13])
                                };
                            }

                            return null;
                        }
                    }
                }
            }
            catch
            {
                return null;
            }
        }
        public static int SaveAccountDetails(Account account)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spSaveUserSettings", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("accountid", SqlDbType.Int).Value = account.AccountID;
                        command.Parameters.Add("firstname", SqlDbType.VarChar, 50).Value = account.FirstName;
                        command.Parameters.Add("lastname", SqlDbType.VarChar, 50).Value = account.LastName;
                        command.Parameters.Add("gender", SqlDbType.Char).Value = account.Gender;
                        command.Parameters.Add("birthday", SqlDbType.Date).Value = account.Birthday;

                        connection.Open();
                        return command.ExecuteNonQuery();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        public static int SaveAccountIntroduction(int accountid, string introduction)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spSaveUserIntroduction", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("accountid", SqlDbType.Int).Value = accountid;
                        command.Parameters.Add("introduction", SqlDbType.VarChar, 200).Value = introduction;

                        connection.Open();
                        return command.ExecuteNonQuery();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        public static int SaveAccountContactSettings(int accountid, string address, string contactno)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spSaveUserContactSettings", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("accountid", SqlDbType.Int).Value = accountid;
                        command.Parameters.Add("address", SqlDbType.VarChar).Value = address;
                        command.Parameters.Add("contactno", SqlDbType.VarChar).Value = contactno;

                        connection.Open();
                        return command.ExecuteNonQuery();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        public static string GetUsername(int accountid)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetUsername", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("accountid", SqlDbType.Int).Value = accountid;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                return reader.GetString(0);
                            }

                            return null;
                        }
                    }
                }
            }
            catch
            {
                return null;
            }
        }
        #endregion

        #region Admin
        public static bool IsAdmin(int accountid)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spIsAdmin", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("accountid", SqlDbType.Int).Value = accountid;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                return reader.GetBoolean(0);
                            }
                            return false;
                        }
                    }
                }
            }
            catch
            {
                return false;
            }
        }
        public static int AddBarber(string name)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spAddBarber", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("name", SqlDbType.VarChar, 50).Value = name;

                        connection.Open();
                        return command.ExecuteNonQuery();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        public static List<Barber> GetBarbers()
        {
            try
            {
                List<Barber> collection = new List<Barber>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetBarbers", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(new Barber
                                {
                                    BarberID = reader.GetInt32(0),
                                    Name = reader.GetString(1)
                                });
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static int DeleteBarber(int barberid)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spDeleteBarber", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("barberid", SqlDbType.Int).Value = barberid;

                        connection.Open();
                        return command.ExecuteNonQuery();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        public static int AddService(string name, decimal price)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spAddService", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("name", SqlDbType.VarChar, 100).Value = name;
                        command.Parameters.Add("price", SqlDbType.Money).Value = price;

                        connection.Open();
                        return command.ExecuteNonQuery();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        public static List<Service> GetServices()
        {
            try
            {
                List<Service> collection = new List<Service>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetServices", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(new Service
                                {
                                    ServiceID = reader.GetInt32(0),
                                    Name = reader.GetString(1),
                                    Price = reader.GetDecimal(2)
                                });
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static int DeleteService(int serviceid)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spDeleteService", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("serviceid", SqlDbType.Int).Value = serviceid;

                        connection.Open();
                        return command.ExecuteNonQuery();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        public static List<TimeSlot> GetTimeSlots()
        {
            try
            {
                List<TimeSlot> collection = new List<TimeSlot>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetTimeSlots", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(new TimeSlot
                                {
                                    TimeSlotID = reader.GetInt32(0),
                                    TimeString = reader.GetString(1),
                                    Time = reader.GetTimeSpan(2)
                                });
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static int AddSchedule(int serviceid, int barberid, DateTime scheduledate, int timeslotid)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spAddSchedule", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("serviceid", SqlDbType.Int).Value = serviceid;
                        command.Parameters.Add("barberid", SqlDbType.Int).Value = barberid;
                        command.Parameters.Add("scheduledate", SqlDbType.Date).Value = scheduledate;
                        command.Parameters.Add("timeslotid", SqlDbType.Int).Value = timeslotid;

                        connection.Open();
                        return (int)command.ExecuteScalar();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        public static int DeleteSchedule(int scheduleid)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spDeleteSchedule", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("scheduleid", SqlDbType.Int).Value = scheduleid;

                        connection.Open();
                        return command.ExecuteNonQuery();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        public static List<Schedule> GetSchedules() 
        {
            try
            {
                List<Schedule> collection = new List<Schedule>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetSchedules", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(new Schedule
                                {
                                    ScheduleID = reader.GetInt32(0),
                                    Service = new Service
                                    {
                                        ServiceID = reader.GetInt32(1),
                                        Name = reader.GetString(2)
                                    },
                                    Barber = new Barber
                                    {
                                        BarberID = reader.GetInt32(3),
                                        Name = reader.GetString(4)
                                    },
                                    ScheduleDate = reader.GetDateTime(5),
                                    TimeSlot = new TimeSlot
                                    {
                                        TimeSlotID = reader.GetInt32(6),
                                        TimeString = reader.GetString(7),
                                        Time = reader.GetTimeSpan(8)
                                    }
                                });
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static List<Appointment> GetAppointments()
        {
            try
            {
                List<Appointment> collection = new List<Appointment>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetAppointments", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(new Appointment
                                {
                                    AppointmentID = reader.GetInt32(0),
                                    Account = new Account
                                    {
                                        AccountID = reader.GetInt32(1),
                                        Username = reader.GetString(2)
                                    },
                                    Schedule = new Schedule
                                    {
                                        ScheduleID = reader.GetInt32(3),
                                        Service = new Service
                                        {
                                            ServiceID = reader.GetInt32(4),
                                            Name = reader.GetString(5),
                                            Price = reader.GetDecimal(6)
                                        },
                                        Barber = new Barber
                                        {
                                            BarberID = reader.GetInt32(7),
                                            Name = reader.GetString(8)
                                        },
                                        ScheduleDate = reader.GetDateTime(9),
                                        TimeSlot = new TimeSlot
                                        {
                                            TimeSlotID = reader.GetInt32(10),
                                            TimeString = reader.GetString(11),
                                            Time = reader.GetTimeSpan(12)
                                        }
                                    },
                                    DateClicked = reader.GetDateTime(13),
                                    IsDone = reader.GetBoolean(14),
                                    IsCancelled = reader.GetBoolean(15)
                                });
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static List<Appointment> GetRecentAppointments()
        {
            try
            {
                List<Appointment> collection = new List<Appointment>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetRecentAppointments", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(new Appointment
                                {
                                    AppointmentID = reader.GetInt32(0),
                                    Account = new Account
                                    {
                                        AccountID = reader.GetInt32(1),
                                        Username = reader.GetString(2)
                                    },
                                    Schedule = new Schedule
                                    {
                                        ScheduleID = reader.GetInt32(3),
                                        Service = new Service
                                        {
                                            ServiceID = reader.GetInt32(4),
                                            Name = reader.GetString(5),
                                            Price = reader.GetDecimal(6)
                                        },
                                        Barber = new Barber
                                        {
                                            BarberID = reader.GetInt32(7),
                                            Name = reader.GetString(8)
                                        },
                                        ScheduleDate = reader.GetDateTime(9),
                                        TimeSlot = new TimeSlot
                                        {
                                            TimeSlotID = reader.GetInt32(10),
                                            TimeString = reader.GetString(11),
                                            Time = reader.GetTimeSpan(12)
                                        }
                                    },
                                    DateClicked = reader.GetDateTime(13),
                                    IsDone = reader.GetBoolean(14),
                                    IsCancelled = reader.GetBoolean(15),
                                    DateUpdated = DBConvert.To<DateTime>(reader[16])
                                });
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static int FinishAppointment(int appointmentid)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spFinishAppointment", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("appointmentid", SqlDbType.Int).Value = appointmentid;

                        connection.Open();
                        return (int)command.ExecuteScalar();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        #endregion

        #region Index
        public static List<Service> GetPopularServices()
        {
            try
            {
                List<Service> collection = new List<Service>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetPopularServices", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(new Service
                                {
                                    ServiceID = reader.GetInt32(0),
                                    Name = reader.GetString(1),
                                    Price = reader.GetDecimal(2),
                                    Bookings = reader.GetInt32(3)
                                });
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static List<Service> GetAllServices()
        {
            try
            {
                List<Service> collection = new List<Service>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetAllServices", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(new Service
                                {
                                    ServiceID = reader.GetInt32(0),
                                    Name = reader.GetString(1),
                                    Price = reader.GetDecimal(2),
                                    Bookings = DBConvert.To<int>(reader[3])
                                });
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static Service GetService(int serviceid)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetService", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("serviceid", SqlDbType.Int).Value = serviceid;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                return new Service
                                {
                                    ServiceID = reader.GetInt32(0),
                                    Name = reader.GetString(1),
                                    Price = reader.GetDecimal(2)
                                };
                            }

                            return null;
                        }
                    }
                }
            }
            catch
            {
                return null;
            }
        }
        public static List<Barber> GetServiceBarbers(int serviceid)
        {
            try
            {
                List<Barber> collection = new List<Barber>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetServiceBarbers", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("serviceid", SqlDbType.Int).Value = serviceid;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(new Barber
                                {
                                    BarberID = reader.GetInt32(0),
                                    Name = reader.GetString(1)
                                });
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static List<DateTime> GetServiceBarberScheduleDates(int serviceid, int barberid)
        {
            try
            {
                List<DateTime> collection = new List<DateTime>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetServiceBarberScheduleDates", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("serviceid", SqlDbType.Int).Value = serviceid;
                        command.Parameters.Add("barberid", SqlDbType.Int).Value = barberid;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(reader.GetDateTime(0));
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static List<TimeSlot> GetServiceBarberScheduleDateTimes(int serviceid, int barberid, DateTime scheduledate)
        {
            try
            {
                List<TimeSlot> collection = new List<TimeSlot>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetServiceBarberScheduleDateTimes", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("serviceid", SqlDbType.Int).Value = serviceid;
                        command.Parameters.Add("barberid", SqlDbType.Int).Value = barberid;
                        command.Parameters.Add("scheduledate", SqlDbType.Date).Value = scheduledate;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(new TimeSlot
                                {
                                    TimeSlotID = reader.GetInt32(0),
                                    TimeString = reader.GetString(1),
                                    Time = reader.GetTimeSpan(2)
                                });
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static int AddAppointment(int accountid, int serviceid, int barberid, DateTime scheduledate, int timeslotid)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spAddAppointment", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("accountid", SqlDbType.Int).Value = accountid;
                        command.Parameters.Add("serviceid", SqlDbType.Int).Value = serviceid;
                        command.Parameters.Add("barberid", SqlDbType.Int).Value = barberid;
                        command.Parameters.Add("scheduledate", SqlDbType.Date).Value = scheduledate;
                        command.Parameters.Add("timeslotid", SqlDbType.Int).Value = timeslotid;

                        connection.Open();
                        return (int)command.ExecuteScalar();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        #endregion

        #region Appointments
        public static List<Appointment> GetAppointments(int accountid)
        {
            try
            {
                List<Appointment> collection = new List<Appointment>();
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spGetAppointments", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("accountid", SqlDbType.Int).Value = accountid;

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                collection.Add(new Appointment
                                {
                                    AppointmentID = reader.GetInt32(0),
                                    Schedule = new Schedule
                                    {
                                        ScheduleID = reader.GetInt32(1),
                                        Service = new Service
                                        {
                                            ServiceID = reader.GetInt32(2),
                                            Name = reader.GetString(3),
                                            Price = reader.GetDecimal(4)
                                        },
                                        Barber = new Barber
                                        {
                                            BarberID = reader.GetInt32(5),
                                            Name = reader.GetString(6)
                                        },
                                        ScheduleDate = reader.GetDateTime(7),
                                        TimeSlot = new TimeSlot
                                        {
                                            TimeSlotID = reader.GetInt32(8),
                                            TimeString = reader.GetString(9),
                                            Time = reader.GetTimeSpan(10)
                                        }
                                    },
                                    DateClicked = reader.GetDateTime(11),
                                    IsDone = reader.GetBoolean(12),
                                    IsCancelled = reader.GetBoolean(13)
                                });
                            }
                        }
                    }
                }
                return collection;
            }
            catch
            {
                return null;
            }
        }
        public static int CancelAppointment(int appointmentid)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConString))
                {
                    using (SqlCommand command = new SqlCommand("spCancelAppointment", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("appointmentid", SqlDbType.Int).Value = appointmentid;

                        connection.Open();
                        return (int)command.ExecuteScalar();
                    }
                }
            }
            catch
            {
                return -1;
            }
        }
        #endregion
    }
}