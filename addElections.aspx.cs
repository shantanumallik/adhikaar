using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class addElections : System.Web.UI.Page
{
    //SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string one = startdate.Value;
        string two = starttime.Value;
        DateTime dt1 = Convert.ToDateTime(one + " " + two);

        one = enddate.Value;
        two = endtime.Value;
        DateTime dt2 = Convert.ToDateTime(one + " " + two);    

       
        string connstr = null;
        connstr = "Data Source=CODEROOM\\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True";
        SqlConnection con = new SqlConnection(connstr);
        con.Open();

        
        string command = "insert into elections values ('" + id.Value + "','" + title.Value + "','" + dt1.ToString("MM/dd/yyyy hh:mm:ss tt") + "','" + dt2.ToString("MM/dd/yyyy hh:mm:ss tt") + "','" + description.Value + "','" + DropDownList1.SelectedValue + "')";
        SqlCommand cmd = new SqlCommand(command, con);
        try
        {
            cmd.ExecuteNonQuery();
            string redirectScript = " window.location.href = 'addelections.aspx';";
            ScriptManager.RegisterStartupScript(this, typeof(string), "displayalertmessage", "alert('Record Added Successfully');" + redirectScript, true);
        }
        catch (SqlException exre)
        {
            //Label1.Text = Convert.ToString(exre);
            if (exre != null)
            {
                //System.Windows.Forms.MessageBox.Show("Duplicate Entry");
                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Duplicate Entry');", true);
            }
            else
               ScriptManager.RegisterStartupScript(this, typeof(string), "displayalertmessage", "alert('Record Added Successfully');", true);
        }
        con.Close();
    }
}