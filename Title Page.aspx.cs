using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Coding_Community
{
    public partial class Home_Page : System.Web.UI.Page
    {
        public static string searching;
        public ArrayList finallist3;
        public ArrayList finallist;
        public ArrayList hotTagList;
        public ArrayList leaderBoardContent;
        protected void Page_Load(object sender, EventArgs e)
        {
            dataConnector connector = new dataConnector();
            finallist = connector.listProvider();


            string totalQuestions = getTotalQuestions().ToString();
            Label1.Text = totalQuestions;

            hotTagList = hotTagListProvider();

            leaderBoardContent = connector.leaderBoardListProvider();
            
            /*DataSet ds = getque();
            Repeater1.DataSource = ds;
            Repeater1.DataBind();*/
        }

        public ArrayList hotTagListProvider()
        {
            ArrayList list = new ArrayList();
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select  tagName ,count(tagName) from quesRtag q inner join tags t on assoTagId = tagId group by tagName order by count(tagName) DESC; ";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            while (da.Read() )
            {
                string tagName = da.GetValue(0).ToString();
                int tagCount = Convert.ToInt32(da.GetValue(1));
                hotTagDataObject obj = new hotTagDataObject(tagName, tagCount);
                list.Add(obj);
            }
            con.Close();
            return list;
            
        }

        public int getTotalQuestions()
        {
            int count = 0;
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select count(*) from realQuestion";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            if (da.Read() != false)
            {
                count = Convert.ToInt32(da.GetValue(0));
            }
            return count;
        }

        

        protected void logout_click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["username"] = null;
            }

        }

        protected void toUserDashBoard(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Response.Redirect("User dashboard.aspx?uname="+Session["username"]);
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void ask_QuestionButton(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                /*Response.Redirect("~/LoginPage.aspx");*/
            }
            else
            {
                Response.Redirect("~/AskQuestionPage.aspx?qid=0");
            }
            
        }
        protected void btnsearch(object sender, EventArgs e)
        {

            searching = tbsearch.Text;

            if (!searching.Equals(""))
            {
                dataConnectoruser connectors = new dataConnectoruser();
                finallist3 = connectors.listProvider();
                Panel1.Visible = true;
            }
            else
            {
                tbsearch.Focus();
            }




        }

        protected void btncancel(object sender, EventArgs e)
        {


            Panel1.Visible = false;
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

                sql = "select qtitle,uname,Id from realQuestion where (qtitle like '%" + searching + "%') or (uname like '%" + searching + "%') ";
                SqlCommand cmd = new SqlCommand(sql, con);

                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    int id = (int)da.GetValue(2);
                    string title = da.GetValue(0).ToString();

                    string username = da.GetValue(1).ToString();
                    dataObjectuser obj = new dataObjectuser(id, title, username);
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

        public class dataObjectuser
        {
            public int id;
            public string title;

            public string username;



            public dataObjectuser(int id, string title, string username)
            {

                this.id = id;
                this.title = title;

                this.username = username;
            }
        }
    }


    public class dataConnector
    {

        public ArrayList listProvider()
        {
            ArrayList list = new ArrayList();
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select * from realQuestion order by Id DESC";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            while (da.Read())
            {
                int id = (int)da.GetValue(0);
                string count = getAnswerCount(id).ToString();
                string title = da.GetValue(1).ToString();
                string date = da.GetValue(4).ToString();
                string body = da.GetValue(2).ToString();
                string userName = da.GetValue(3).ToString();
                dataObject obj = new dataObject(id,title,date,body,userName,count);
                list.Add(obj);
            }
            con.Close();
            return list;
         
        }

        public int getAnswerCount(int qid)
        {
            int count = 0;
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select count(*) from answerTable where ques_id = '"+qid+"'";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            if (da.Read() != false)
            {
                count = Convert.ToInt32(da.GetValue(0));
            }
            con.Close();
            return count;
            
        }
        public ArrayList tagArrayProvider(int id)
        {
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string query = "select qid, tagName from quesRtag q inner join tags t on assoTagId = tagId where qid='"+id+"'";
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

        public ArrayList leaderBoardListProvider()
        {
            ArrayList list = new ArrayList();
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string query = "select username,count(username) from answerTable group by username order by count(username) desc";
            SqlCommand command1 = new SqlCommand(query, con);
            SqlDataReader dataReader = command1.ExecuteReader();
            while (dataReader.Read())
            {
                string usrname = dataReader.GetValue(0).ToString();
                int questionAnswered = Convert.ToInt32(dataReader.GetValue(1));
                leaderboard row = new leaderboard(usrname, questionAnswered);
                list.Add(row);
            }
            con.Close();
            return list;
        }
    }
    public class hotTagDataObject
    {
        public string tagName;
        public int tagCount;
        public hotTagDataObject()
        {

        }
        public hotTagDataObject(string tagName,int tagCount)
        {
            
            this.tagName = tagName;
            this.tagCount = tagCount;
        }
    }
    public class leaderboard
    {
        public string nameOfUser;
        public int questionAnswered;
        public leaderboard()
        {

        }
        public leaderboard(string nameOfUser,int questionAnswered)
        {
            this.nameOfUser = nameOfUser;
            this.questionAnswered = questionAnswered;
        }
    }
    public class dataObject
    {
        public int id;
        public string title;
        public string date;
        public string body;
        public string userName;
        public string answers;

        public dataObject(int id,string title,string date)
        {
            this.id = id;
            this.title = title;
            this.date = date;
        }

        public dataObject(int id, string title, string date,string body,string userName,string answers)
        {
            this.id = id;
            this.title = title;
            this.date = date;
            this.body = body;
            this.userName = userName;
            this.answers = answers;
        }
        public dataObject()
        {

        }
    }

    


}