using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewcandidate : System.Web.UI.Page
{
    string user_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            user_id = Request.QueryString["id"].ToString();
        }
        fname.Text = "";
        lname.Text = "";
        father.Text = "";
        mother.Text = "";
        gender.Text = "";
        dob.Text = "";
        uid.Text = "";
        state.Text = "";
        edu.Text = "";
        mob.Text = "";
        mail.Text = "";
        party.Text = "";
        bio.Text = "";
        
        string connstr = null;
        connstr = "Data Source=CODEROOM\\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True";
        SqlConnection con = new SqlConnection(connstr);
        con.Open();

        string c = "select * from aadhaar where aadhaar_card_no='" + user_id + "'";
        SqlCommand cmd = new SqlCommand(c, con);
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        fname.Text = dr.GetString(0);
        lname.Text = dr.GetString(1);
        father.Text = dr.GetString(2)+" "+dr.GetString(3);
        mother.Text = dr.GetString(4)+" "+dr.GetString(5);
        gender.Text = dr.GetString(6);
        dob.Text = dr.GetString(7);
        //Label8.Text = Convert.ToString(dr.GetDecimal(7));
        uid.Text = dr.GetString(8);
        state.Text = dr.GetString(9);
        party.Text = dr.GetString(16);
       // Label11.Text = Convert.ToString(dr.GetInt32(10));
        edu.Text = dr.GetString(11);
        mob.Text = dr.GetString(12);
        mail.Text = dr.GetString(13);
        bio.Text = dr.GetString(17);


    }
}