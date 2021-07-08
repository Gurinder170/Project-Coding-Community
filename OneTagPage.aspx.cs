using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coding_Community
{
    public partial class OneTagPage : System.Web.UI.Page
    {
        public ArrayList finalquestionList;
        public ArrayList onehotTagList;
        protected void Page_Load(object sender, EventArgs e)
        {
            OneTagdataConnector connector = new OneTagdataConnector();
            finalquestionList = listProvider();


            string totalQuestions = getTotalQuestions().ToString();
            Label1.Text = totalQuestions;

            onehotTagList = hotTagListProvider();
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
            while (da.Read())
            {
                string tagName = da.GetValue(0).ToString();
                int tagCount = Convert.ToInt32(da.GetValue(1));
                hotTagDataObject obj = new hotTagDataObject(tagName, tagCount);
                list.Add(obj);
            }
            return list;
            con.Close();
        }

        public int getTotalQuestions()
        {
            int count = 0;
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            int tagId = getTagIdFromTagName(Request.QueryString["tagName"].ToString());
            sql = "select count(*) from realQuestion q inner join quesRtag r on q.Id = r.qid where r.assoTagId = '" + tagId + "'"; 
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            if (da.Read() != false)
            {
                count = Convert.ToInt32(da.GetValue(0));
            }
            return count;
            con.Close();
        }

        protected void logout_click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["username"] = null;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void abc_click(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                
            }
            else
            {

                Response.Redirect("~/AskQuestionPage.aspx?qid=0");
            }

        }
        public ArrayList listProvider()
        {
            string tagName = Request.QueryString["tagName"].ToString();
            int tagId = getTagIdFromTagName(tagName);
            ArrayList list = new ArrayList();
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select * from realQuestion q inner join quesRtag r on q.Id = r.qid where r.assoTagId = '"+tagId+"'";
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
                dataObject obj = new dataObject(id, title, date, body, userName, count);
                list.Add(obj);
            }
            return list;
            con.Close();
        }

        public int getAnswerCount(int qid)
        {
            int count = 0;
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select count(*) from answerTable where ques_id = '" + qid + "'";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            if (da.Read() != false)
            {
                count = Convert.ToInt32(da.GetValue(0));
            }
            return count;
            con.Close();
        }

        public int getTagIdFromTagName(string tagName)
        {
            int getTagId = 0;
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql;
            sql = "select tagId from tags where tagName ='"+tagName+"'";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            if (da.Read() != false)
            {
                getTagId = Convert.ToInt32(da.GetValue(0));
            }
            return getTagId;
            con.Close();
        }
    }

    public class OneTagdataConnector
    {

        

        

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
            con.Close();
        }
    }
}