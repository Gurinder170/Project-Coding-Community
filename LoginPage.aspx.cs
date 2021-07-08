using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coding_Community
{
    public partial class LoginPage : System.Web.UI.Page
    {
        public static string otp;
        public static string a;
        public static string c;
        public static string p;
        public static string e;

        public static string gid;
        public static string gname;
        public static string gemail;
        public static string gphoto;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            string name = username.Text;
            string pass = password.Text;


            if (!name.Equals("") && !pass.Equals(""))
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                cmd.CommandText = "select * from userCredentials where username='" + name + "' and password = '" + pass + "' and identitys ='" + Session["uname"] + "'";
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                sda.Fill(ds, "userCredentials");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["username"] = name;
                    Session["password"] = pass;
                    Session["image"] =   ds.Tables[0].Rows[0]["userimage"];
                    enterIntoRecentLogin(name);
                    if (Session["uname"].ToString() == "Admin")
                    {
                        Session["username"] = name;
                        Response.Redirect("Admin dashboard.aspx");
                    }
                    if (Session["uname"].ToString() == "user")
                    {
                        Session["username"] = name;
                        Response.Redirect("Title Page.aspx");
                    }

                }
                else
                {
                    /*ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " deletemodal();", true);*/
                    Label1.Visible = true;
                }
                con.Close();
            }
            else
            {
                username.Text = "";
                password.Text = "";
            }

        }

        public void enterIntoRecentLogin(string username)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            if (!AlreadyInRecentLogin(username,con))
            {
                firstTimeLogin(username,con);
            }
            else
            {
                updateRecentLogin(username,con);
            }
        }

        public bool AlreadyInRecentLogin(string username,SqlConnection con)
        {
            con.Open();
            string sqlQuery = "select * from recentLogin where username='"+username+"'";
            SqlCommand cmd = new SqlCommand(sqlQuery, con);
            SqlDataReader da = cmd.ExecuteReader();
            if (!da.Read())
            {
                
                con.Close();
                return false;
            }
            con.Close();
            
            return true;
        }
        public void firstTimeLogin(string username,SqlConnection con)
        {
            con.Open();
            string date = DateTime.Now.ToString("dd-MM-yyyy");
            string sqlQuery = "insert into recentLogin values(@uname,@date)";
            SqlCommand cmd = new SqlCommand(sqlQuery,con);
            cmd.Parameters.AddWithValue("@uname", username);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void updateRecentLogin(string username, SqlConnection con)
        {
            con.Open();
            string date = DateTime.Now.ToString("dd-MM-yyyy");
            string sqlQuery = "update recentLogin set logindate='"+date+"' where username='"+username+"'";
            SqlCommand cmd = new SqlCommand(sqlQuery, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected string GenerateRandomOTP()

        {
            string[] Characters = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
            string sOTP = string.Empty;

            string sTempChars = string.Empty;

            Random rand = new Random();

            for (int i = 0; i < 6; i++)

            {

                int p = rand.Next(0, Characters.Length);

                sTempChars = Characters[rand.Next(0, Characters.Length)];

                sOTP += sTempChars;

            }

            return sOTP;
        }
        public string Verification(string a)
        {
            c = "";
            if (!a.Equals(""))
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                con.Open();
                string sql;
                sql = "select * from userCredentials where email='" + a + "'";
                SqlCommand command = new SqlCommand(sql, con);
                SqlDataReader da = command.ExecuteReader();
                while (da.Read())
                {
                    if (a == da.GetValue(2).ToString())
                    {
                        p = da.GetValue(3).ToString();
                        c = "True";
                        e = da.GetValue(1).ToString();
                    }

                    else
                    {
                        c = "False";
                    }
                }
                con.Close();
            }

            return c;


        }
        public void mailotporpass(string sender, string c)
        {
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.UseDefaultCredentials = false;
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("codingcommunity20@gmail.com", "coding@20");
            MailAddress from = new MailAddress("codingcommunity20@gmail.com");
            MailAddress to = new MailAddress(sender);
            MailMessage message = new MailMessage(from, to);
            if (c == "otp")
            {
                message.Body = "hello " + e + "This is your" + c + otp;
            }
            else if (c == "password")
            {
                message.Body = "hello " + e + "This is your" + c + p;
            }
            message.Subject = "Verification";
            client.Send(message);
            message.Dispose();



        }
        public void SendPassword(object sender, EventArgs e)
        {
            if (TextBox2.Text == otp)
            {

                mailotporpass(a, "password");
                /*ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " deletemodal();", true);*/
                vemail.Value = "";
                TextBox2.Text = "";
                Lbemailv.Visible = true;
                Lbotp.Visible = false;
                Button2.Visible = true;
                Button3.Visible = false;
            }
            else
            {
                lberror.Visible = true;
            }
        }
        public void SendOTP(object sender, EventArgs e)
        {
            a = vemail.Value;
            string d = Verification(a);
            otp = GenerateRandomOTP();
            if (d == "True" && !d.Equals(""))
            {
                Lbemailv.Visible = false;
                Lbotp.Visible = true;
                TextBox2.Visible = true;
                vemail.Visible = false;
                mailotporpass(a, "otp");
                Button2.Visible = false;
                Button3.Visible = true;
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " showmodal();", true);
                lberror.Visible = false;
            }

            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " showmodal();", true);
                lberror.Visible = true;

            }

        }

        protected void username_TextChanged(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select * from userCredentials where username='" + username.Text + "'";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();

            while (da.Read())
            {
                if (da.GetValue(0).ToString() == username.Text && da.GetValue(15).ToString() == "Admin")
                {
                    Session["uname"] = "Admin";

                }
                else if (da.GetValue(0).ToString() == username.Text && da.GetValue(15).ToString() == "user")
                {
                    Session["uname"] = "user";
                }
            }
        }
    }
}