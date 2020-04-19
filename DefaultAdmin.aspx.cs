using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using sendSMS;
using System.Net;
using System.Collections.Specialized;

namespace sendSMS
{
    class sendSMS
    {
        public string sendSMS1()
        {
            String message = HttpUtility.UrlEncode("This is your message");
            using (var wb = new WebClient())
            {
                byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "yourapiKey"},
                {"numbers" , "918123456789"},
                {"message" , message},
                {"sender" , "TXTLCL"}
                });
                string result = System.Text.Encoding.UTF8.GetString(response);
                return result;
            }
        }
    }
}


public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
       
   

            
// Label2.Text = "<iframe height=500 width=500 src=verificaion-form.php > </iframe>";
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string connstr = null;
        connstr = "Data Source=CODEROOM\\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True";
        SqlConnection con = new SqlConnection(connstr);
        con.Open();

        SqlCommand cmd = new SqlCommand("select * from admin where admin_id='" + username.Value + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read() == true)
        {
            abc.Text = dr.GetString(1);

        }
          /*  if (abc.Text.ToString() == dr.GetString(15))
            {
                FormsAuthentication.SetAuthCookie(username.Value, true);
                Response.Redirect("Elections.aspx");
            }
            else
            {
                Label1.Text = "Wrong Password! Try again.";
            }*/
        
        else
        {
            Label1.Text = "No user with this Username found. Please Register.";
        }

        con.Close();
       /* if (abc.Text == "true")
        {
            FormsAuthentication.SetAuthCookie(username.Value, true);
            Response.Redirect("Elections.aspx");
        }
        else
        {
            Label1.Text = "Wrong Password! Try again.";
        }*/


}

protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (abc.Text == "true")
        {
            FormsAuthentication.SetAuthCookie(username.Value, true);
            Response.Redirect("Admin.aspx");
        }
        else
        {
            Label1.Text = "Wrong Password! Try again.";
        }
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {


    }
}

/*
 *  <div class="col s4 offset-s4 offset-s4 input-field">
                    <i class="material-icons prefix">fingerprint</i>
                    <input id="password" type="password" class="validate" runat="server" />
                    <label for="password">Biometrics</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="password" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
*/