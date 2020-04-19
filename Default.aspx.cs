using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Collections.Specialized;
using System.IO;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Request.QueryString["uid"] != null)
        {
            string msg = "You have successfully registered " + Request.QueryString["uid"].ToString() + ". Please Login.";
            Label1.Text = msg;
        }
        else
            Label1.Text = null;
        // Label2.Text = "<iframe height=500 width=500 src=verificaion-form.php > </iframe>";
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string connstr = null;
        connstr = "Data Source=CODEROOM\\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True";
        SqlConnection con = new SqlConnection(connstr);
        con.Open();

        SqlCommand cmd = new SqlCommand("select * from aadhaar where aadhaar_card_no='" + username.Value + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read() == true)
        {
            abc.Text = dr.GetString(15);

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
            Response.Redirect("Elections.aspx");
        }
        else
        {
            Label1.Text = "Wrong Credentials! Try again.";
        }
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Label1.Text = "Entered";
        string result;
        string apiKey = "G+FGqHXJdvQ-Ib2z150VWq8m8PMnYSOJQ5CTRYoEM6";
        string apiKey2 = "eZcYWszCjYM-ssLFM2TiM0xRDr0W7U2YtAdUR59F61";
        string numbers = phn.Text; // in a comma seperated list
        
        Random rnd = new Random();
        string randomNumber = rnd.Next(100000, 999999).ToString();
        string send = "AM-ADHIKAAR";
        def.Text = randomNumber;
        string message = "Your OTP for logging into Adhikaar is " + randomNumber;
        string url = "https://api.textlocal.in/send/?apikey=" + apiKey + "&numbers=" + numbers + "&message=" + message  ;
        //refer to parameters to complete correct url string

        StreamWriter myWriter = null;
        HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);

        objRequest.Method = "POST";
        objRequest.ContentLength = Encoding.UTF8.GetByteCount(url);
        objRequest.ContentType = "application/x-www-form-urlencoded";
        try
        {
            myWriter = new StreamWriter(objRequest.GetRequestStream());
            myWriter.Write(url);
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
        finally
        {
            myWriter.Close();
        }

        HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
        using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
        {
            result = sr.ReadToEnd();
            // Close and clean up the StreamReader
            sr.Close();
        }
        Label1.Text = result;

    }


    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        if (def.Text == otp.Text)
            def.Text = "true";

        Label1.Text = "Success";

    }
}

//https://api.textlocal.in/send/?apikey=zexk68ZSbAs-mfdRccW2GPhFVc5C3NepIKTfQmpvpt&numbers=9123117025&message=hello

/*
 *  <div class="col s4 offset-s4 offset-s4 input-field">
                    <i class="material-icons prefix">fingerprint</i>
                    <input id="password" type="password" class="validate" runat="server" />
                    <label for="password">Biometrics</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="password" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
*/
