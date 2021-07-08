using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coding_Community
{
    public partial class HelpCentrePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void toUserDashBoard(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Response.Redirect("User dashboard.aspx?uname=" + Session["username"]);
            }

        }

        protected void logout_click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["username"] = null;
                Response.Redirect("HelpCentrePage.aspx");
            }
        }
    }
}