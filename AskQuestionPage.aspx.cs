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
using System.Web.WebSockets;

namespace Coding_Community
{
    public partial class AskQuestionPage : System.Web.UI.Page
    {
        public static bool isUpdateQuestion;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Label1.Visible = true;
            }
            else
            {
                Label1.Visible = false;
            }
            tagsMust.Visible = false;

            ClientScript.RegisterStartupScript(GetType(), "hwa", "initializeTinyMCE();", true);

            if (!IsPostBack)
            {
                string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                string query = "select * from tags";
                SqlDataAdapter adapter = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                adapter.Fill(data);
                ListBox1.DataSource = data;
                ListBox1.DataTextField = "tagName";
                ListBox1.DataValueField = "tagId";
                ListBox1.DataBind();
                if (Request.QueryString["qid"].ToString().Equals("0"))
                {
                    isUpdateQuestion = false;
                    btReview.Text = "POST QUESTION";
                }
                else
                {
                    isUpdateQuestion = true;
                    btReview.Text = "UPDATE QUESTION";
                    fillAlreadyPostedQuestionContent();
                    /*deleteExistingQuestion();*/
                }
            }
            
        }

        public void deleteExistingQuestion()
        {
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql = "delete from realQuestion where Id='"+Request.QueryString["qid"]+"'";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void toUserDashBoard(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Response.Redirect("User dashboard.aspx?uname=" + Session["username"]);
            }

        }

        public void fillAlreadyPostedQuestionContent()
        {
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql = "select * from realQuestion where Id='" + Request.QueryString["qid"] + "'";
            
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
            while (da.Read())
            {
                tbTitle.Text = da.GetValue(1).ToString();
                qbody.InnerText = da.GetValue(2).ToString();
                
            }
            ArrayList selectedTags = selectAllRelatedTags();
            foreach(ListItem item in ListBox1.Items)
            {
                if (selectedTags.Contains(item.Value))
                {
                    item.Selected = true;
                }
            }
        }

        public ArrayList selectAllRelatedTags()
        {
            ArrayList list = new ArrayList();
            string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql = "select * from quesRtag where qid='" + Request.QueryString["qid"] + "'";
            SqlCommand command = new SqlCommand(sql, con);
            SqlDataReader da = command.ExecuteReader();
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

        

        protected void btReview_Click(object sender, EventArgs e)
        {

            if (Session["username"] != null)
            {
                if (isUpdateQuestion)
                {
                    string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    int id = Convert.ToInt32(Request.QueryString["qid"]);
                    SqlCommand command = new SqlCommand("updateQuestion", con);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@title",tbTitle.Text);
                    command.Parameters.AddWithValue("@qbody",qbody.InnerText);
                    command.Parameters.AddWithValue("@id",Request.QueryString["qid"]);
                    command.Parameters.AddWithValue("@usname",Session["username"]);
                    command.ExecuteNonQuery();
                    
                    con.Close();

                    con.Open();
                    SqlCommand cmd1 = con.CreateCommand();
                    cmd1.CommandType = CommandType.Text;
                    foreach (ListItem li in ListBox1.Items)
                    {
                        if (li.Selected)
                        {
                            try
                            {
                                cmd1.CommandText = "insert into quesRtag(qid,assoTagId) values('" + id + "','" + li.Value + "')";

                                cmd1.ExecuteNonQuery();
                            }
                            catch
                            {

                            }
                        }
                    }
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "afterQuesUpdate();", true);
                    con.Close();
                }
                else
                {
                    if (ifAnyTagSelected() && !tbTitle.Text.Equals("") && !qbody.InnerText.Equals(""))
                    {
                        string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
                        SqlConnection con = new SqlConnection(connection);
                        con.Open();
                        SqlCommand command = new SqlCommand("insertquestion", con);
                        command.CommandType = CommandType.StoredProcedure;
                        //date wala saab kitaab
                        string date = DateTime.Now.ToString("dd-MMM-yyyy hh:mm tt");
                        //image wala saab kitaab 



                        command.Parameters.AddWithValue("@qtitle", tbTitle.Text);
                        command.Parameters.AddWithValue("@body", qbody.InnerText);

                        command.Parameters.AddWithValue("@uid", Session["username"].ToString());
                        command.Parameters.AddWithValue("@date", date);
                        command.Parameters.Add("@Id", SqlDbType.Int).Direction = ParameterDirection.Output;
                        command.ExecuteNonQuery();
                        //just checking the retrieved qid after insertions
                        string qid = command.Parameters["@Id"].Value.ToString();
                        /*Response.Write(qid);*/
                        //Add associated tags into the quesRtag table using qid .
                        SqlCommand cmd = con.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        foreach (ListItem li in ListBox1.Items)
                        {
                            if (li.Selected)
                            {
                                cmd.CommandText = "insert into quesRtag(qid,assoTagId) values('" + qid + "','" + li.Value + "')";
                                /*cmd.Parameters.AddWithValue("@quesid", qid);*/

                                /*Response.Write(li.Text + " " + li.Value + " ");*/
                                cmd.ExecuteNonQuery();
                            }
                        }
                        tbTitle.Text = "";
                        qbody.Value = "";
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "afterQuesSubmit();", true);
                    }
                    else
                    {
                        tagsMust.Visible = true;
                    }
                }
                
            }
            else
            {
               /*Response.Write("else part");*/
                Label1.Visible = true;
            }
        }
        public bool ifAnyTagSelected()
        {
            foreach (ListItem li in ListBox1.Items)
            {
                if (li.Selected)
                {
                    return true;
                }
            }
            return false;
        }



    }
}
/*I 'm working on  a project which is in asp.net using c # language .
I 've used a database which is inbuilt in the asp.net  and to connect to that database 
I 've written these commands as follows please guide me what is the error so that I can complete this project on time.
The code is as follows :-
string connection = ConfigurationManager.ConnectionStrings["codingCommunity"].ConnectionString;
SqlConnection con = new SqlConnection(connection);
con.Open();
SqlCommand cmd = con.CreateCommand();
cmd.CommandType = CommandType.Text;
cmd.CommandText = "insert into body(body) values('" + tbBody.Text + "')";
cmd.ExecuteNonQuery();*/