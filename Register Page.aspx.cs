using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.ComponentModel;
using System.Net.Mail;

namespace Coding_Community
{
    public partial class Register_Page : System.Web.UI.Page
    {
        public static string otp;
        public static string password;
        protected void Page_Load(object sender, EventArgs e)
        {
            userTaken.Visible = false;
            emailTaken.Visible = false;
        }

        public void btSignup_Click(object sender, EventArgs e)
        {
            

            if ((TextBox1.Text).Equals(otp))
            {
                string username = tbUserName.Text;
                string fullname = tbFullName.Text;
                string email = tbEmail.Text;


                
                string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;

                SqlCommand cmd1 = new SqlCommand();
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                cmd1.CommandText = "select * from userCredentials where username='" + username + "' ";
                cmd1.Connection = con;
                sda.SelectCommand = cmd1;
                sda.Fill(ds, "userCredentials");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    cmd.CommandText = "insert into userCredentials (username, fullName, email, password,identitys,userimage) values(@username, @fName, @email, @password,@identitys,@imga)";

                    cmd.Parameters.AddWithValue("@username", tbUserName.Text);
                    cmd.Parameters.AddWithValue("@fName", tbFullName.Text);
                    cmd.Parameters.AddWithValue("@email", tbEmail.Text);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@identitys", "user");
                    cmd.Parameters.AddWithValue("@imga", "defaultIcon.jpeg");

                    cmd.ExecuteNonQuery();

                    tbUserName.Text = "";
                    tbFullName.Text = "";
                    tbEmail.Text = "";
                    tbPassword.Text = "";
                    tbConfPassword.Text = "";


                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                }
                
                



                //Response.Redirect("LoginPage.aspx");

                con.Close();

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "openModal();", true);
                msgotp.Visible = true;

            }

        }
        public bool mailSent = false;

        public void SendCompletedCallback(object sender, AsyncCompletedEventArgs e)
        {
            // Get the unique identifier for this asynchronous operation.
            String token = (string)e.UserState;

            if (e.Cancelled)
            {
                Console.WriteLine("[{0}] Send canceled.", token);
            }
            if (e.Error != null)
            {
                Console.WriteLine("[{0}] {1}", token, e.Error.ToString());
            }
            else
            {
                Console.WriteLine("Message sent.");
            }
            mailSent = true;
        }
        public void SendCompletedCallback(object sender, EventArgs e)
        {
            // Get the unique identifier for this asynchronous operation.

            mailSent = true;
        }
        protected string GenerateRandomOTP(int iOTPLength, string[] Characters)

        {

            string sOTP = string.Empty;

            string sTempChars = string.Empty;

            Random rand = new Random();

            for (int i = 0; i < iOTPLength; i++)

            {

                int p = rand.Next(0, Characters.Length);

                sTempChars = Characters[rand.Next(0, Characters.Length)];

                sOTP += sTempChars;

            }

            return sOTP;
        }

        public void SendOTP(object sender, EventArgs e)
        {
            string username = tbUserName.Text;
            string fullname = tbUserName.Text;
            string email = tbEmail.Text;
            string temppassword = tbPassword.Text;
            string confPassword = tbConfPassword.Text;
            if (!username.Equals("") && !fullname.Equals("") && !email.Equals("") && !temppassword.Equals("") && !confPassword.Equals("") && temppassword.Equals(confPassword)&& RegularExpressionValidator1.IsValid)
            {
                if (!isUserTaken(username))
                {
                    if (!isEmailTaken(email))
                    {
                        password = tbPassword.Text;
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "openModal();", true);

                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                        client.UseDefaultCredentials = false;
                        client.EnableSsl = true;

                        string[] Characters = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
                        otp = GenerateRandomOTP(8, Characters);

                        // Specify the email sender.
                        // Create a mailing address that includes a UTF8 character
                        client.Credentials = new System.Net.NetworkCredential("codingcommunity20@gmail.com", "coding@20");
                        // in the display name.
                        MailAddress from = new MailAddress("codingcommunity20@gmail.com");
                        // Set destinations for the email message.
                        
                        string a = tbEmail.Text;
                        MailAddress to = new MailAddress(a);
                        // Specify the message content.
                        MailMessage message = new MailMessage(from, to);
                        message.Body = "hello " + tbUserName.Text + "This is your otp:" + otp;
                        message.CC.Add = "";



                        message.Subject = "Verification";

                        // Set the method that is called back when the send operation ends.

                        // The userState can be any object that allows your callback
                        // method to identify this send operation.
                        // For this example, the userToken is a string constant.

                        client.Send(message);


                        // If the user canceled the send, and mail hasn't been sent yet,
                        // then cancel the pending operation.



                        // Clean up.
                        message.Dispose();
                    }
                    else
                    {
                        emailTaken.Visible = true;
                    }
                }
                else
                {
                    userTaken.Visible = true;
                }
            }
        }
        public bool isUserTaken(string username)
        {
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            SqlCommand cmd1 = new SqlCommand();
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();
            cmd1.CommandText = "select * from userCredentials where username='" + username + "' ";
            cmd1.Connection = con;
            sda.SelectCommand = cmd1;
            sda.Fill(ds, "userCredentials");
            if (ds.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            return true;
        }
        public bool isEmailTaken(string email)
        {
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            SqlCommand cmd1 = new SqlCommand();
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();
            cmd1.CommandText = "select * from userCredentials where email='" + email + "' ";
            cmd1.Connection = con;
            sda.SelectCommand = cmd1;
            sda.Fill(ds, "userCredentials");
            if (ds.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            return true;
        }
    }
}