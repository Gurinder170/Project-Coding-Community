using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coding_Community
{
    public partial class Hidden : System.Web.UI.Page
    {
        public static int count;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            count = int.Parse(HiddenField1.Value);
            count++;
            HiddenField1.Value = count.ToString();
            Label1.Text = count.ToString();
        }
    }
}