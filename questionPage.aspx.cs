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
    public partial class questionPage : System.Web.UI.Page
    {
        public ArrayList tagList;
        public ArrayList ansList;
        public ArrayList questionPageLeaderBoard;
        public ArrayList hottagforqPage;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string id = Request.QueryString["id"];
            SqlDataReader dataReader = questionReturn(id);
            while (dataReader.Read())
            {
                string temp;
                temp = dataReader.GetValue(1).ToString();
                heading.InnerText = temp;
                lblAsked.Text = dataReader.GetValue(4).ToString();
                temp = dataReader.GetValue(2).ToString();
                Qbody.InnerHtml = temp;
                temp = dataReader.GetValue(3).ToString();
                askedBy.InnerText = temp;
                askedByLink.HRef = "User dashboard.aspx?uname=" + temp;
                
            }
            tagList = tagArrayProvider(id);
            answerDataConnector x = new answerDataConnector();
            ansList = x.ansProvider(id);
            dataConnector c = new dataConnector();
            questionPageLeaderBoard = c.leaderBoardListProvider();
            hottagforqPage = hottagforqPageProvider();
        }
        public ArrayList hottagforqPageProvider()
        {
            ArrayList list = new ArrayList();
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select  tagName ,count(tagName) from quesRtag q inner join tags t on assoTagId = tagId group by tagName order by count(tagName) DESC; ";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            while (da.Read())
            {
                string tagName = da.GetValue(0).ToString();
                int tagCount = Convert.ToInt32(da.GetValue(1));
                hotTagDataObject obj = new hotTagDataObject(tagName, tagCount);
                list.Add(obj);
            }
            con.Close();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write(Request.QueryString["id"]);
        }

        protected void toUserDashBoard(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Response.Redirect("User dashboard.aspx?uname=" + Session["username"]);
            }

        }
        public SqlDataReader questionReturn(string id)
        {
            
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select * from realQuestion where id='"+id+"'";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            
            return da;
            con.Close();
        }

        protected void askbtn(object sender, EventArgs e)
        {
            Response.Redirect("AskQuestionPage.aspx?qid=0");
        }
        public ArrayList tagArrayProvider(string id)
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
            con.Close();
            return tagNames;
            
        }

        protected void post(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            
            string id = Request.QueryString["id"].ToString();
            /*string anscontent = yourAnswer.InnerHtml;*/
            string username="";
            if (Session["username"] != null)
            {
                username = Session["username"].ToString();
            }
            string date = DateTime.Now.ToString("dd-MMM-yyyy hh:mm tt");
            string query = "insert into answerTable(ans_body,ques_id,username,date_time) values(@ansBody,@qid,@uName,@Date)";
            
            SqlCommand cmd = new SqlCommand(query,con);
            cmd.Parameters.AddWithValue("@ansBody", yourAnswer.InnerText);
            cmd.Parameters.AddWithValue("@qid", id);
            cmd.Parameters.AddWithValue("@uName", username);
            cmd.Parameters.AddWithValue("@Date", date);
            /*cmd.CommandType = CommandType.Text;*/
            cmd.ExecuteNonQuery();
            yourAnswer.InnerHtml = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "afterAnsSubmit();", true);
            con.Close();
            
        }

        protected void loginbtn(object sender, EventArgs e)
        {
            string username = TextBox1.Text;
            string password = TextBox2.Text;
            if (!username.Equals("") && !password.Equals(""))
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                cmd.CommandText = "select * from userCredentials where username='" + username + "' and password = '" + password + "'";
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                sda.Fill(ds, "userCredentials");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["username"] = username;
                    Session["password"] = password;
                    Session["image"] = ds.Tables[0].Rows[0]["userimage"];
                    enterIntoRecentLogin(username);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "text", "yoyo();", true);
                    /*incorrect.Visible = true;*/
                }
                con.Close();
            }
        }

        public void enterIntoRecentLogin(string username)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            if (!AlreadyInRecentLogin(username, con))
            {
                firstTimeLogin(username, con);
            }
            else
            {
                updateRecentLogin(username, con);
            }
        }

        public bool AlreadyInRecentLogin(string username, SqlConnection con)
        {
            con.Open();
            string sqlQuery = "select * from recentLogin where username='" + username + "'";
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
        public void firstTimeLogin(string username, SqlConnection con)
        {
            con.Open();
            string date = DateTime.Now.ToString("dd-MM-yyyy");
            string sqlQuery = "insert into recentLogin values(@uname,@date)";
            SqlCommand cmd = new SqlCommand(sqlQuery, con);
            cmd.Parameters.AddWithValue("@uname", username);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void updateRecentLogin(string username, SqlConnection con)
        {
            con.Open();
            string date = DateTime.Now.ToString("dd-MM-yyyy");
            string sqlQuery = "update recentLogin set logindate='" + date + "' where username='" + username + "'";
            SqlCommand cmd = new SqlCommand(sqlQuery, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

    }

    public class answerDataConnector
    {
        public ArrayList ansProvider(string id)
        {
            ArrayList list = new ArrayList();
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql = "select * from answerTable where ques_id='"+id+"'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader da = cmd.ExecuteReader() ;
            while (da.Read())
            {
                string ansBody = da.GetValue(1).ToString();
                string username = da.GetValue(3).ToString();
                string date = da.GetValue(4).ToString();
                answerDataObject obj = new answerDataObject(ansBody,username,date);
                list.Add(obj);
            }
            con.Close();
            return list;
            
        }
    }
    public class answerDataObject
    {
        public string ansContent;
        public string username;
        public string dateTime;
        public answerDataObject()
        {

        }
        public answerDataObject(string ansContent,string username,string dateTime)
        {
            this.ansContent = ansContent;
            this.username = username;
            this.dateTime = dateTime;
        }
    }
}