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

        public static void ShowAlert(Page p, string title, string message, string type)
        {
            p.ClientScript.RegisterStartupScript(p.GetType(), "SweetAlert", string.Format("swal('{0}', '{1}', '{2}');", title, message, type), true);
        }
        public static void ShowAlertWithRedirect(Page p, string title, string message, string type, string redirect)
        {
            p.ClientScript.RegisterStartupScript(p.GetType(), "SweetAlert2", string.Format("swal('{0}', '{1}', '{2}').then((value) => { window.location = '{3}'; });", title, message, type, redirect), true);
        }

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
    }
}