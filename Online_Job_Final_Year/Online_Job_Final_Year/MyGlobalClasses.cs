using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI.WebControls;

namespace Online_Job_Final_Year
{
    public class MyGlobalClasses
    {
        public void bindLocation(DropDownList drp)
        {
            try
            {
                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                string find = "select * from Location ";
                con.Open();
                SqlCommand cmd = new SqlCommand(find, con);



                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                DataSet ds = new DataSet();

                da.Fill(ds);
                drp.DataSource = ds;
                drp.DataTextField = "LocationName";
                drp.DataValueField = "CountryID";
                drp.DataBind();
                drp.Items.Insert(0, new ListItem("- Select -", "0"));


                con.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }


        }
        public void bindSpecialization(DropDownList drp)
        {

            var con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

            string find = "select * from Specialization";
            con.Open();
            SqlCommand cmd = new SqlCommand(find, con);



            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();

            da.Fill(ds);
            drp.DataSource = ds;
            drp.DataTextField = "SpecialityName";
            drp.DataValueField = "SpecialID";
            drp.DataBind();
            drp.Items.Insert(0, new ListItem("- Select -", "0"));


            con.Close();
        }

        public string Encrypt(string plainText)
        {
            var EncryptionKey = "MAKV2SPBNI99212";
            var clearBytes = Encoding.Unicode.GetBytes(plainText);
            using (var encryptor = Aes.Create())
            {

                var pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                if (encryptor != null)
                {
                    encryptor.Key = pdb.GetBytes(32);
                    encryptor.IV = pdb.GetBytes(16);


                    using (var ms = new MemoryStream())
                    {
                        using (var cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                        {
                            cs.Write(clearBytes, 0, clearBytes.Length);
                            cs.Close();
                        }
                        plainText = Convert.ToBase64String(ms.ToArray());
                    }
                }
            }
            return plainText;
        }

        public string Decrypt(string EncryptText)
        {
            var EncryptionKey = "MAKV2SPBNI99212";
            //var EncryptionKey = "MAKV2SPBNI99213";
            var cipherBytes = Convert.FromBase64String(EncryptText);
            using (var encryptor = Aes.Create())
            {
                var pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (var ms = new MemoryStream())
                {
                    using (var cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    EncryptText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return EncryptText;
        }
    }
}