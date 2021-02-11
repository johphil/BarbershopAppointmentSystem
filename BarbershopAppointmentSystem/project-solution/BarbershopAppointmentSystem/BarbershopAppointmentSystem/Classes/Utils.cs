using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BarbershopAppointmentSystem.Classes
{
    public static class Utils
    {
        public static object ToDbParameter<T>(this T? value)
        where T : struct
        {
            object dbValue = value;
            if (dbValue == null)
            {
                dbValue = DBNull.Value;
            }
            return dbValue;
        }
        public static object ToDbParameter(this object value)
        {
            try
            {
                object dbValue = value;
                if (dbValue == null)
                {
                    dbValue = DBNull.Value;
                }
                else if (value is DateTime)
                {
                    if ((DateTime)value == DateTime.MinValue)
                        dbValue = DBNull.Value;
                }
                else if (value is string)
                {
                    if (string.IsNullOrWhiteSpace((string)value))
                        dbValue = DBNull.Value;
                }
                return dbValue;
            }
            catch
            {
                return DBNull.Value;
            }
        }
        public static string DateWithTime(this DateTime value)
        {
            return value == DateTime.MinValue ? "" : value.ToString("MMMM dd, yyyy hh:mm tt");
        }
        public static string DateWithDayAndTime(this DateTime value)
        {
            return value == DateTime.MinValue ? "" : value.ToString("dddd, MMMM dd, yyyy hh:mm tt");
        }
        public static string DateOnly(this DateTime value)
        {
            return value == DateTime.MinValue ? "" : value.ToString("MMMM dd, yyyy");
        }
        public static string TimeOnly(this DateTime value)
        {
            return value == DateTime.MinValue ? "" : value.ToString("hh:mm tt");
        }
        public static string FullTime(this DateTime value)
        {
            return value == DateTime.MinValue ? "" : value.ToString("hh:mm:ss tt");
        }
        public static string DateOnly2(this DateTime value)
        {
            return value == DateTime.MinValue ? "" : value.ToString("MMM dd, yyyy");
        }
        public static string DateWithDay(this DateTime value)
        {
            return value == DateTime.MinValue ? "" : value.ToString("dddd, MMMM dd, yyyy");
        }
        public static string ToPeso(this decimal value)
        {
            return string.Format("{0}₱{1:N2}", value < 0 ? "-" : "", Math.Abs(value));
        }
        public static IEnumerable<string> Split(string str, int chunkSize)
        {
            return Enumerable.Range(0, str.Length / chunkSize)
                .Select(i => str.Substring(i * chunkSize, chunkSize));
        }
    }

    public static class DBConvert
    {
        /// <summary>
        /// Handles reading DBNull values from database in a generic fashion
        /// </summary>
        /// <typeparam name="T">The type of the value to read</typeparam>
        /// <param name="value">The input value to convert</param>
        /// <returns>A strongly typed result, null if the input value is DBNull</returns>
        public static T To<T>(object value)
        {
            if (value is DBNull)
                return default(T);
            else
                return (T)changeType(value, typeof(T));
        }

        /// <summary>
        /// Handles reading DBNull values from database in a generic fashion, simplifies frontend databinding
        /// </summary>
        /// <typeparam name="T">The type of the value to read</typeparam>
        /// <param name="ri">The Container item in a databinding operation</param>
        /// <param name="column">The dataitem to read</param>
        /// <returns>A strongly typed result, null if the input value is DBNull</returns>
        public static T To<T>(RepeaterItem ri, string column)
        {
            if (DataBinder.Eval(ri.DataItem, column) is DBNull)
                return default(T);
            else
                return (T)changeType(DataBinder.Eval(ri.DataItem, column), typeof(T));
        }

        /// <summary>
        /// Internal method that wraps Convert.ChangeType() so it handles Nullable<> types
        /// </summary>
        /// <param name="value">The value to convert</param>
        /// <param name="conversionType">The type to convert into</param>
        /// <returns>The input value converted to type conversionType</returns>
        private static object changeType(object value, Type conversionType)
        {
            if (conversionType.IsGenericType && conversionType.GetGenericTypeDefinition().Equals(typeof(Nullable<>)))
            {
                if (value == null)
                    return null;

                conversionType = Nullable.GetUnderlyingType(conversionType);
            }

            return Convert.ChangeType(value, conversionType);
        }

        /// <summary>
        /// Simplifies setting SqlParameter values by handling null issues
        /// </summary>
        /// <param name="value">The value to return</param>
        /// <returns>DBNull if value == null, otherwise we pass through value</returns>
        public static object From(object value)
        {
            if (value == null)
                return DBNull.Value;
            else
                return value;
        }
    }
}