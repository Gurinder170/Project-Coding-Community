using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;

namespace Coding_Community
{
    public partial class userProfilePage : System.Web.UI.Page
    {
        string email;
        public static string cropimageName;
        public static int questionsAsked;
        public static int answerAsked;
        protected void Page_Load(object sender, EventArgs e)
        {

            questionsAsked = returnQuestionNumber();
            lblNoOfQuestions.Text = questionsAsked.ToString();
            answerAsked = returnAnswerNumber();
            lblNoOfAnswers.Text = answerAsked.ToString();

            if (!Page.IsPostBack)
            {
                
                string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                string query = "select * from Skills";
                SqlDataAdapter adapter = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                adapter.Fill(data);
                ListBox1.DataSource = data;
                ListBox1.DataTextField = "skillName";
                ListBox1.DataValueField = "Id";
                ListBox1.DataBind();
                btn_btn();
            }
            

        }

        public int returnQuestionNumber()
        {
            int count = 0;
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string username = Session["username"].ToString();
            string sql = "select count(*) from realQuestion where uname='" + username + "'";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            if (da.Read())
            {
                count = Convert.ToInt32(da.GetValue(0));
            }
            return count;
        }

        public int returnAnswerNumber()
        {
            int count = 0;
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string username = Session["username"].ToString();
            string sql = "select count(*) from answerTable where username='" + username + "'";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            if (da.Read())
            {
                count = Convert.ToInt32(da.GetValue(0));
            }
            return count;
        }

        protected void btn_btn()
        {
            if (Session["username"] != null)
            {
                string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                string sql;
                string username = Session["username"].ToString();
                sql = "select * from userCredentials where username='" + username + "'";
                SqlCommand command = new SqlCommand(sql, con);
                SqlDataReader da = command.ExecuteReader();
                while (da.Read())
                {
                    tbProfileName.Text = da.GetValue(1).ToString();
                    lblFullNameProfile.Text = da.GetValue(1).ToString();
                    tbProfileEmail.Text = da.GetValue(2).ToString();
                    email = da.GetValue(2).ToString();
                    tbProfileDOB.Text = da.GetValue(4).ToString();
                    tbProfileMobile.Text = da.GetValue(5).ToString();
                    tbProfileState.Text = da.GetValue(6).ToString();
                    tbProfileCity.Text = da.GetValue(7).ToString();
                    tbProfilePinCode.Text = da.GetValue(8).ToString();
                    tbProfileGithub.Text = da.GetValue(9).ToString();
                    tbProfileLinkedIn.Text = da.GetValue(10).ToString();
                    tbProfileInstitution.Text = da.GetValue(11).ToString();
                    tbProfileYearOfPassing.Text = da.GetValue(12).ToString();
                    tbProfileQualification.Text = da.GetValue(13).ToString();
                    tbProfileBio.Text = da.GetValue(14).ToString();
                    Lbbio.Text = da.GetValue(14).ToString();
                    imgFileUpload.Src = "~/UploadImages/" + da.GetValue(16).ToString();

                    /* Image1.ImageUrl = "~/UploadImages/" + da.GetValue(16).ToString();*/




                }
                ArrayList previousSkillsList = selectPreviousSkills(username);
                
                foreach(ListItem li in ListBox1.Items)
                {
                    if (previousSkillsList.Contains(li.Value))
                    {
                        li.Selected = true;
                    }
                }
            }
        }

        public ArrayList selectPreviousSkills(string username)
        {
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select * from userRskill where username='" + username + "'";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            ArrayList list = new ArrayList();
            while (da.Read())
            {
                list.Add(da.GetValue(1).ToString());
            }
            return list;
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
            string password = TextBox1.Text;
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = "";


            if (Session["username"] != null)
            {
                {
                    username = Session["username"].ToString();
                    string dateOfBirth = tbProfileDOB.Text;
                    string name = tbProfileName.Text;
                    string email = tbProfileEmail.Text;
                    string mobile = tbProfileMobile.Text;
                    string state = tbProfileState.Text;
                    string city = tbProfileCity.Text;
                    string pincode = tbProfilePinCode.Text;
                    string github = tbProfileGithub.Text;
                    string linkedin = tbProfileLinkedIn.Text;
                    string institution = tbProfileInstitution.Text;
                    string yearofpassing = tbProfileYearOfPassing.Text;
                    string qual = tbProfileQualification.Text;
                    string bio = tbProfileBio.Text;

                    string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();


                    string sql;
                    sql = "update userCredentials set dob='" + dateOfBirth + "',fullName='" + name + "',email='" + email + "',phone='" + mobile + "',state='" + state + "',city='" + city + "',pincode='" + pincode + "',github='" + github + "',linkedin='" + linkedin + "',institution='" + institution + "',yearofpassing='" + yearofpassing + "',qualification='" + qual + "',bio='" + bio + "'  where username='" + username + "'";

                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.ExecuteNonQuery();
                    SqlCommand cmd1 = con.CreateCommand();
                    cmd1.CommandType = CommandType.Text;
                    foreach (ListItem li in ListBox1.Items)
                    {
                        if (li.Selected)
                        {
                            cmd1.CommandText = "insert into userRskill(username,skillId) values('" + username + "','" + li.Value + "')";


                            try
                            {
                                cmd1.ExecuteNonQuery();
                            }
                            catch
                            {

                            }
                            
                        }
                    }
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                    btn_btn();
                    con.Close();
                }


            }

        }
        protected void imageload(object sender, EventArgs e)
        {
            panCrop.Visible = true;
        }

        protected void imageunload(object sender, EventArgs e)
        {
            panCrop.Visible = false;
            imgUpload.Visible = false;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
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
                    imgUpload.Visible = true;


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
                    cropimageName = cropFileName;
                    string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    string sql = "update userCredentials set userimage='"+cropFileName+"' where username = '" + Session["username"] + "'";

                    SqlCommand cmd = new SqlCommand(sql, con);
                    
                    cmd.ExecuteNonQuery();
                    btn_btn();
                    imgUpload.Visible = false;
                    /*string base64 = Request.Form["imgCropped"];
                    byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);
                    using (FileStream stream = new FileStream(Server.MapPath("~/Images/Cropped.png"), FileMode.Create))
                    {
                        stream.Write(bytes, 0, bytes.Length);
                        stream.Flush();
                    }*/


                    /*FileStream stream = new FileStream(cropFilePath, FileMode.Create);
                    BinaryReader reader = new BinaryReader(stream);
                    byte[] bytes = reader.ReadBytes((int)stream.Length);


                    string strBase64 = Convert.ToBase64String(bytes);
                    Response.Write(strBase64);
                    Image1.ImageUrl = "data:Image/png;base64," + strBase64;*/

                    /*cropimageName = cropFileName;
                    Response.Write(cropimageName);
                    imgFileUpload.Src = "~/UploadImages/" + cropFileName;
                   
                    con.Close();*/
                }


                catch (Exception b)
                {
                    throw;
                }
            }
        }

        
    }
}