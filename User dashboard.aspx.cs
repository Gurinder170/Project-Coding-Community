using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coding_Community
{
    public partial class User_dashboard : System.Web.UI.Page
    {
        public static object Ab;
        public static string hi;
        public static string Reportimage;

        public ArrayList finallist;
        public ArrayList finallist1;
        public ArrayList finallist4;

        public ArrayList userskills;
        public static string queryStringUserName;
        protected void Page_Load(object sender, EventArgs e)
        {
            queryStringUserName = Request.QueryString["uname"].ToString();
            dataConnectoruser connector = new dataConnectoruser();
            dataConnectorans connectorans = new dataConnectorans();
            dataReportuser connectorReport = new dataReportuser();
            finallist = connector.listProvider();
            finallist1 = connectorans.listProvider();
            finallist4 = connectorReport.listrepoProvider();
            viewuserprofile();
            Ab = Session["username"];
            string username = "";
            if (Session["username"] != null)
            {
                 username = Session["username"].ToString();
            }
            userskills = selectPreviousSkills(queryStringUserName);
            


        }
        public ArrayList selectPreviousSkills(string username)
        {
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select skillName from userRskill a inner join Skills b on a.skillId=b.Id where a.username='" + username + "'";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            ArrayList list = new ArrayList();
            while (da.Read())
            {
                list.Add(da.GetValue(0).ToString());
            }
            return list;
        }

        /*protected void btnUpload_Click(object sender, EventArgs e)
        {
            // Upload Original Image Here  
            string uploadFileName = "";
            string uploadFilePath = "";
            if (FU1.HasFile)
            {
                string ext = Path.GetExtension(FU1.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
                {
                    uploadFileName = Guid.NewGuid().ToString() + ext;
                    uploadFilePath = Path.Combine(Server.MapPath("~/UploadImages"), uploadFileName);

                    FU1.SaveAs(uploadFilePath);

                    Image1.ImageUrl = "";

                    imgUpload.ImageUrl = "~/UploadImages/" + uploadFileName;
                    panCrop.Visible = true;

                }
                else
                {
                    lblMsg.Text = "Selected file type not allowed!";
                }
            }
            else
            {
                lblMsg.Text = "Please select file first!";
            }
        }
       
        protected void cropclick(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(imgUpload.ImageUrl);
            string filePath = Path.Combine(Server.MapPath("~/UploadImages"), fileName);
            string cropFileName = "";
            string cropFilePath = "";
            if (File.Exists(filePath))
            {
                System.Drawing.Image orgImg = System.Drawing.Image.FromFile(filePath);
                Rectangle CropArea = new Rectangle(Convert.ToInt32(X.Value), Convert.ToInt32(Y.Value), Convert.ToInt32(W.Value), Convert.ToInt32(H.Value));
                try
                {
                    Bitmap bitMap = new Bitmap(CropArea.Width, CropArea.Height);
                    using (Graphics g = Graphics.FromImage(bitMap))
                    {
                        g.DrawImage(orgImg, new Rectangle(0, 0, bitMap.Width, bitMap.Height), CropArea, GraphicsUnit.Pixel);
                    }
                    cropFileName = "crop_" + fileName;
                    cropFilePath = Path.Combine(Server.MapPath("~/UploadImages"), cropFileName);
                    bitMap.Save(cropFilePath);
                    panCrop.Visible = false;
                  
                    imgFileUpload.Src= "~/UploadImages/" + cropFileName;

                }
                catch (Exception b)
                {
                    throw;
                }
            }
        }*/
        
        protected void SendToUserProfile(object sender, EventArgs e)
        {
            Response.Redirect("userProfilePage.aspx");
        }
        protected void viewuserprofile()
        {
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select * from userCredentials where username='" + queryStringUserName + "'";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            while (da.Read())
            {

                Lbname.Text = da.GetValue(1).ToString();
                tbemail.Text = da.GetValue(2).ToString();
                tbdob.Text = da.GetValue(4).ToString();
                tbgithub.Text = da.GetValue(9).ToString();
                tblinked.Text = da.GetValue(10).ToString();
                tbbio.Text = da.GetValue(14).ToString();
                imgFileUpload.Src = "~/UploadImages/" + da.GetValue(16).ToString();


            }


        }

        protected void changepassword(object sender, EventArgs e)
        {
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
        protected void logout_click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["username"] = null;
                Response.Redirect("Title Page.aspx");
            }
        }
        protected void tester_Click(object sender, EventArgs e)
        {
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


        protected void Reportprob(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            string title = tbprob.Text;
            string msg = tbmsg.Text;
            string img;
            if (Reportimage != null)
            {
                img = Reportimage;
            }
            else
            {
                img = "";
            }



            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;

            SqlCommand cmd1 = new SqlCommand();
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();
            cmd1.CommandText = "select * from Report";
            cmd1.Connection = con;
            sda.SelectCommand = cmd1;
            sda.Fill(ds, "Report");
            if (ds.Tables[0].Rows.Count > 0)
            {
                cmd.CommandText = "insert into Report (username, title,message,img,status) values(@username, @title, @msg, @image,@status)";

                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@title", tbprob.Text);
                cmd.Parameters.AddWithValue("@msg", tbmsg.Text);
                cmd.Parameters.AddWithValue("@image", img);
                cmd.Parameters.AddWithValue("@status", "pending");


                cmd.ExecuteNonQuery();

                tbprob.Text = "";
                tbmsg.Text = "";


            }
        }
        protected void uploadImage(object sender, EventArgs e)
        {
            string uploadFileName = "";
            string uploadFilePath = "";
            if (FileUpload1.HasFile)
            {
                string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
                {
                    uploadFileName = Guid.NewGuid().ToString() + ext;
                    uploadFilePath = Path.Combine(Server.MapPath("~/UploadImages"), uploadFileName);

                    FileUpload1.SaveAs(uploadFilePath);
                    Reportimage = uploadFileName;
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                }

            }
        }




        public class dataConnectoruser
        {

            public ArrayList listProvider()
            {
                ArrayList list = new ArrayList();
                string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                string sql;
                sql = "select * from realQuestion where uname='" + queryStringUserName + "'  ";
                SqlCommand command = new SqlCommand(sql, con);
                SqlDataReader da = command.ExecuteReader();
                while (da.Read())
                {
                    int id = (int)da.GetValue(0);
                    string title = da.GetValue(1).ToString();
                    string date = da.GetValue(4).ToString();
                    dataObjectuser obj = new dataObjectuser(id, title, date);
                    list.Add(obj);
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
            public ArrayList tagArrayProvider(int id)
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
            }
        }

        public class dataObjectuser
        {
            public int id;
            public string title;
            public string date;



            public dataObjectuser(int id, string title, string date)
            {
                this.id = id;
                this.title = title;
                this.date = date;
            }
        }

        public class dataConnectorans
        {

            public ArrayList listProvider()
            {
                ArrayList list = new ArrayList();
                string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                string sql;
                sql = "select id, qtitle,q.date from realQuestion q  inner join answerTable t  on Id = ques_id where t.username='" + queryStringUserName + "'";
                SqlCommand command = new SqlCommand(sql, con);
                SqlDataReader da = command.ExecuteReader();
                while (da.Read())
                {
                    int id = (int)da.GetValue(0);
                    string title = da.GetValue(1).ToString();
                    string date = da.GetValue(2).ToString();
                    dataObjectans obj = new dataObjectans(id, title, date);
                    list.Add(obj);
                }
                return list;
            }


            public ArrayList tagArrayProvider(int id)
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
            }
        }

        public class dataObjectans
        {
            public int id;
            public string title;
            public string date;



            public dataObjectans(int id, string title, string date)
            {
                this.id = id;
                this.title = title;
                this.date = date;
            }
        }

        public class dataReportuser
        {

            public ArrayList listrepoProvider()
            {
                ArrayList list = new ArrayList();
                if (HttpContext.Current.Session["username"] != null)
                {

                    string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    string sql;
                    sql = "select * from Report   where username='" + HttpContext.Current.Session["username"] + "' ";
                    SqlCommand command = new SqlCommand(sql, con);
                    SqlDataReader da = command.ExecuteReader();
                    while (da.Read())
                    {
                        int id = (int)da.GetValue(5);
                        string title = da.GetValue(1).ToString();
                        string message = da.GetValue(2).ToString();
                        string username = da.GetValue(0).ToString();
                        string img = da.GetValue(3).ToString();
                        string status = da.GetValue(4).ToString();
                        dataObjectReportuser obj = new dataObjectReportuser(id, title, message, username, img, status);
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

        public class dataObjectReportuser
        {
            public int id;
            public string title;
            public string message;
            public string username;
            public string img;
            public string status;



            public dataObjectReportuser(int id, string title, string message, string username, string img, string status)
            {
                this.id = id;
                this.title = title;
                this.message = message;
                this.status = status;
                this.username = username;
                this.img = "~/UploadImages/" + img;
            }
        }
    }
}