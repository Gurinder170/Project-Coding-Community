using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coding_Community
{
    public partial class AboutUs : System.Web.UI.Page
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
                Response.Redirect("Title Page.aspx");
            }
        }
        protected void contactus(object sender, EventArgs e)
        {
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.UseDefaultCredentials = false;
            client.EnableSsl = true;


            // Specify the email sender.
            // Create a mailing address that includes a UTF8 character
            client.Credentials = new System.Net.NetworkCredential("codingcommunity20@gmail.com", "coding@20");
            // in the display name.
            MailAddress from = new MailAddress("codingcommunity20@gmail.com");
            // Set destinations for the email message.

            MailAddress userp = new MailAddress(contactUsEmail.Value);
            MailAddress to = new MailAddress("codingcommunity20@gmail.com");
            // Specify the message content.
            MailMessage message = new MailMessage(from, to);
            MailMessage msg = new MailMessage(from, userp);
            message.Body = "This User :" + contactUsName.Value + "Email:" + contactUsEmail.Value + "is having a Problem  Coding Community..." + contactUsMessage.Value;
            msg.Body = "Dear User :" + contactUsName.Value + "  Our Developers will Reply to you shortly......";




            message.Subject = subject.Value;

            // Set the method that is called back when the send operation ends.

            // The userState can be any object that allows your callback
            // method to identify this send operation.
            // For this example, the userToken is a string constant.

            client.Send(message);
            client.Send(msg);
            Response.Write("entererd");

            // If the user canceled the send, and mail hasn't been sent yet,
            // then cancel the pending operation.



            // Clean up.
            message.Dispose();



        }
    }
}