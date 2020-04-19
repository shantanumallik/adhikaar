using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class voting : System.Web.UI.Page
{
   // SqlConnection con;
    string election_id;
    string title;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.QueryString["id"] != null)
        {
            Label1.Text = "success";
            election_id = Request.QueryString["id"].ToString();
            title = Request.QueryString["title"].ToString();
        }
        Label1.Text = "";
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string connstr = null;
        connstr = "Data Source=CODEROOM\\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True";
        SqlConnection con = new SqlConnection(connstr);
        con.Open();

        SqlCommand cmd = new SqlCommand("select * from aadhaar where aadhaar_card_no='" + Context.User.Identity.Name + "'", con);
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
    }
    protected void vote_Click(object sender, EventArgs e)
    {
       // string const_user;
        string const_elec;
        string bio;

        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;

        string firstColData = grdrow.Cells[1].Text;
        string party_data = grdrow.Cells[3].Text;
        string connstr = null;
        connstr = "Data Source=CODEROOM\\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True";
        SqlConnection con = new SqlConnection(connstr);
        con.Open();


        bool authorised = false;
        string str1 = "select * from aadhaar where aadhaar_card_no ='" + Context.User.Identity.Name + "'";
        string str2 = "select * from elections where id='" + election_id + "'";
        
        SqlCommand cmd2 = new SqlCommand(str2, con);
        
        SqlDataReader dr2 = cmd2.ExecuteReader();
        dr2.Read();
        const_elec = dr2.GetString(5);
       
        
        dr2.Close();
        SqlCommand cmd1 = new SqlCommand(str1, con);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        
        dr1.Read();
        bio = dr1.GetString(15);


        // if (dr1.Read() == true)
        //  {
        //Label1.Text = dr1.GetString(10);
        //  authorised = true;
        if (abc.Text=="true")
            {
                authorised = true;
            }

       // }
        dr1.Close();
    
        
        LinkButton l1 = sender as LinkButton;
        if (authorised)
        {
            string command = "insert into votes values ('" + election_id + "','" + title + "','" + firstColData + "','" + party_data + "')";
            SqlCommand cmd = new SqlCommand(command, con);
            try {
                cmd.ExecuteNonQuery();
                l1.Visible = false;
                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Vote captured successfully');", true);
            }
            catch(SqlException e1)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Already voted for this candidate');", true);
                l1.Visible=true;
            }
        }
        else
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('This Poll does not belong to your constituency');", true);
        con.Close();

        
        

    }
    protected void details_Click(object sender, EventArgs e)
    {
        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;

        string firstColData = grdrow.Cells[0].Text;
        Response.Redirect("viewcandidate.aspx?id=" + firstColData);
    }
}