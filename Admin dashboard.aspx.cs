using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coding_Community
{
    public partial class Admin_dashboard : System.Web.UI.Page
    {
        public static string queAsk;
        public static string queAns;
        public ArrayList finallist1;
        public ArrayList finallist2;
        public ArrayList finallist3;
      
        public static int Rid;
        protected void Page_Load(object sender, EventArgs e)
        {
            dataConnectoruser connector = new dataConnectoruser();
            dataConnectorRepuser connectors = new dataConnectorRepuser();
            datauseractivity connectors1 = new datauseractivity();
            finallist1 = connector.listProvider();
            finallist2 = connectors.listSolveProvider();
            finallist3 = connectors1.listuserProvider();
            RepeaterData();
            RepeaterskillData();

            if (IsPostBack)
            {
                
                ClientScript.RegisterHiddenField("isPostBack", "1");
            }

        }

        

        public void RepeaterData()
        {
            // Getting tags 
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd = new SqlCommand("Select * from tags Order By tagId", con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

        }
        public void RepeaterskillData()
        {
            // Getting Skills
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd = new SqlCommand("Select * from Skills Order By Id", con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            Repeater2.DataSource = ds;
            Repeater2.DataBind();

        }


        protected void Adminregister(object sender, EventArgs e)
        {
          
            /*lbaddSkill.Text = HiddenField2.Value;*/
            //Admin register
            string username = tbAdminusername.Text;
            string pass = tbAdminPass.Text;
            string cpass = tbAdminConfPass.Text;
            string fname = tbadminname.Text;
            string email = tbadminemail.Text;
            if (!username.Equals("") && !pass.Equals("") && !cpass.Equals("") && !fname.Equals("") && !email.Equals("") && pass.Equals(cpass))
            {
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
                    cmd.CommandText = "insert into userCredentials (username, fullname, password, email,identitys) values(@username,@fname, @password,@email,@identity)";

                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@fname", fname);
                    cmd.Parameters.AddWithValue("@email", email);

                    cmd.Parameters.AddWithValue("@password", pass);
                    cmd.Parameters.AddWithValue("@identity", "Admin");

                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                    tbAdminusername.Text = "";
                    tbadminname.Text = "";
                    tbAdminPass.Text = "";
                    tbadminemail.Text = "";
                    tbAdminConfPass.Text = "";
                }
            }
            else if(!pass.Equals(cpass))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "unsuccessalertpass();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "unsuccessalert();", true);
            }

        }
        protected void Button3_Click(object sender, EventArgs e)
        {

            
            /*lbaddSkill.Text = HiddenField2.Value;*/
            //insert tag
            string tagname = tbaddtag.Text;
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;

            SqlCommand cmd1 = new SqlCommand();
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();
            cmd1.CommandText = "select * from tags";
            cmd1.Connection = con;
            sda.SelectCommand = cmd1;
            sda.Fill(ds, "tags");
            if (ds.Tables[0].Rows.Count > 0)
            {
                cmd.CommandText = "insert into tags (tagName) values(@tname)";


                cmd.Parameters.AddWithValue("@tname", tagname);
                cmd.ExecuteNonQuery();
                RepeaterData();
                tbaddtag.Text = "";
            }
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
          
            /*lbaddSkill.Text = HiddenField2.Value;*/
            //update tag
            string tname = tbupdatetag.Text;
            string tId = tbupdateid.Text;
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();

            string sql;
            sql = "update tags set tagName = @tagname where tagId='" + tId + "'  ";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@tagname", tname);
            cmd.ExecuteNonQuery();
            tbupdatetag.Text = "";
            tbupdateid.Text = "";
            RepeaterData();
        }
        protected void changepassword(object sender, EventArgs e)
        {
          
            /*lbaddSkill.Text = HiddenField2.Value;*/
            string oldp = tbPassOld.Text;
            string newp = tbPassNew.Text;
            if (!oldp.Equals("") && !newp.Equals(""))
            {
                string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();

                string sql;
                sql = "update userCredentials set password = @newpass where username='" + Session["username"] + "'  ";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@newpass", tbPassNew.Text);
                cmd.ExecuteNonQuery();
                tbPassOld.Text = "";
                tbPassNew.Text = "";

            }

        }
        protected void tester_Click(object sender, EventArgs e)
        {
           
            /*lbaddSkill.Text = HiddenField2.Value;*/
            string password = tbDeactivatePass.Text;
            string sessionPass = "";
            if (Session["password"] != null)
            {
                sessionPass = Session["password"].ToString();
            }
            if (sessionPass.Equals(password))
            {
                string username = Session["username"].ToString();
                string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                SqlCommand command;
                SqlDataAdapter adapter = new SqlDataAdapter();
                string sql = "";
                sql = "delete from userCredentials where username='" + username + "'";
                command = new SqlCommand(sql, con);
                adapter.DeleteCommand = new SqlCommand(sql, con);
                adapter.DeleteCommand.ExecuteNonQuery();
                Session["username"] = null;
                Session["password"] = null;
                Response.Redirect("Title Page.aspx");
            }
            if (!sessionPass.Equals(password))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "text", "yoyo();", true);
                //Response.Write("Incorrect Password . Try using correct Password.");
            }

        }
        protected void skillAdd(object sender, EventArgs e)
        {

        
            /*lbaddSkill.Text = HiddenField2.Value;*/
            //insert skill
            string skillName = tbaddSkill.Text;
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;

            SqlCommand cmd1 = new SqlCommand();
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();
            cmd1.CommandText = "select * from Skills";
            cmd1.Connection = con;
            sda.SelectCommand = cmd1;
            sda.Fill(ds, "tags");
            if (ds.Tables[0].Rows.Count > 0)
            {
                cmd.CommandText = "insert into Skills (skillName) values(@sname)";


                cmd.Parameters.AddWithValue("@sname", skillName);
                cmd.ExecuteNonQuery();
                RepeaterskillData();
                tbaddSkill.Text = "";
            }

        }
        protected void skillUpdate(object sender, EventArgs e)
        {
           
            /*lbaddSkill.Text = HiddenField2.Value;*/
            //update skill
            string sname = tbskillupdatename.Text;
            string sId = tbskillupdateId.Text;
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();

            string sql;
            sql = "update Skills set skillName = @skillname where Id='" + sId + "'  ";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@skillname", sname);
            cmd.ExecuteNonQuery();
            tbskillupdatename.Text = "";
            tbskillupdateId.Text = "";
            RepeaterskillData();
        }
        protected void repoUpdate(object sender, EventArgs e)
        {
            // Report Solved
            string sname = "solved";

            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();

            string sql;
            sql = "update Report set status = @status where Rid='" + Rid + "'  ";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@status", sname);
            cmd.ExecuteNonQuery();
            tbskillupdatename.Text = "";
            tbskillupdateId.Text = "";
            RepeaterskillData();
        }
        //list for Report----------------
        public class dataConnectoruser
        {

            public ArrayList listProvider()
            {
                ArrayList list = new ArrayList();
                if (HttpContext.Current.Session["username"] != null)
                {
                    string status = "pending";
                    string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    string sql;
                    sql = "select * from Report  where status='" + status + "'";
                    SqlCommand command = new SqlCommand(sql, con);
                    SqlDataReader da = command.ExecuteReader();
                    while (da.Read())
                    {
                        int id = (int)da.GetValue(5);
                        string title = da.GetValue(1).ToString();
                        string message = da.GetValue(2).ToString();
                        string username = da.GetValue(0).ToString();
                        string img = da.GetValue(3).ToString();
                        dataObjectuser obj = new dataObjectuser(id, title, message, username, img);
                        list.Add(obj);
                    }

                }
                return list;
            }



            /*public ArrayList tags(int id)
            {
                ArrayList list = new ArrayList();
                *//*string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                string sql;
                sql = "select * from quesRtag where qid='"+id+"'";
                SqlCommand command = new SqlCommand(sql, con);
                SqlDataReader da = command.ExecuteReader();*//*

                ArrayList tagsString = tagArrayProvider(id);



                /*while (da.Read())
                {
                    int tagid = (int)da.GetValue(1);
                    string tagName = tagsString[tagid - 1].ToString();
                    list.Add(tagName);
                }*//*
                return list;
            }*/
            /*public ArrayList tagArrayProvider(int id)
            {
                string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                string query = "select qid, tagName from quesRtag q inner join tags t on assoTagId = tagId where qid='" + id + "'";
                SqlCommand command1 = new SqlCommand(query, con);
                SqlDataReader dataReader = command1.ExecuteReader();

                ArrayList tagNames = new ArrayList();
                while (dataReader.Read())
                {
                    string tagName = dataReader.GetValue(1).ToString();
                    tagNames.Add(tagName);
                }

                return tagNames;
            }*/
        }

        public class dataObjectuser
        {
            public int id;
            public string title;
            public string message;
            public string username;
            public string img;



            public dataObjectuser(int id, string title, string message, string username, string img)
            {
                this.id = id;
                this.title = title;
                this.message = message;
                this.username = username;
                this.img = "~/UploadImages/" + img;
            }
        }
        //--------------------------------
        public class dataConnectorRepuser
        {
            public ArrayList listSolveProvider()
            {
                ArrayList list = new ArrayList();
                if (HttpContext.Current.Session["username"] != null)
                {
                    string status = "solved";
                    string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    string sql;
                    sql = "select * from Report where status='" + status + "'  ";
                    SqlCommand command = new SqlCommand(sql, con);
                    SqlDataReader da = command.ExecuteReader();
                    while (da.Read())
                    {
                        int id = (int)da.GetValue(5);
                        string title = da.GetValue(1).ToString();
                        string message = da.GetValue(2).ToString();
                        string username = da.GetValue(0).ToString();
                        string img = da.GetValue(3).ToString();
                        dataPendinguser obj = new dataPendinguser(id, title, message, username, img);
                        list.Add(obj);
                    }

                }
                return list;
            }
        }
        public class dataPendinguser
        {
            public int id;
            public string title;
            public string message;
            public string username;
            public string img;



            public dataPendinguser(int id, string title, string message, string username, string img)
            {
                this.id = id;
                this.title = title;
                this.message = message;
                this.username = username;
                this.img = "~/UploadImages/" + img;
            }
        }





        public class datauseractivity
        {
            public ArrayList listuserProvider()
            {
                ArrayList list = new ArrayList();
                if (HttpContext.Current.Session["username"] != null)
                {

                    string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    string sql;
                    sql = "Select * from recentLogin  ";
                    SqlCommand command = new SqlCommand(sql, con);
                    SqlDataReader da = command.ExecuteReader();

                    while (da.Read())
                    {

                        string date = da.GetValue(1).ToString();

                        string username = da.GetValue(0).ToString();
                        string queans = userqueData(username);
                        string queask = userqueaskData(username);
                        datauser obj = new datauser(username, date, queask, queans);
                        list.Add(obj);
                    }

                }
                return list;
            }
            public string userqueData(string username)
            {
                string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                int i = 0;
                SqlCommand cmd = con.CreateCommand();
                cmd = new SqlCommand("Select ans_body from answerTable  where username='" + username + "'", con);
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    i++;

                }
                con.Close();
                string ans = i.ToString();
                return ans;
            }
            public string userqueaskData(string username)
            {
                string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                int i = 0;
                SqlCommand cmd = con.CreateCommand();
                cmd = new SqlCommand("Select body from realQuestion  where uname='" + username + "'", con);
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    i++;

                }
                con.Close();
                string ask = i.ToString();

                return ask;

            }
        }
        public class datauser
        {

            public string date;

            public string username;
            public string queask;
            public string queans;



            public datauser(string username, string date, string queask, string queans)
            {


                this.date = date;
                this.username = username;
                this.queask = queask;
                this.queans = queans;

            }
        }
    }
}