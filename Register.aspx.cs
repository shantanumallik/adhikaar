
using System.Windows.Forms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using SecuGen.SecuBSPPro.Windows;


public partial class images_Register : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string connstr = null;
        connstr = "Data Source=CODEROOM\\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True";
        SqlConnection con = new SqlConnection(connstr);
        con.Open();
        //  Response.Write(abc.Value);

        // ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('ABC is  null');", true);


        string command = "insert into aadhaar values('" + firstname.Value + "','" + lastname.Value + "','" + ffirstname.Value + "','" + flastname.Value + "','" + mfirstname.Value + "','" + mlastname.Value + "','" + RadioButtonList1.SelectedValue + "','" + birthdate.Value + "','" + aadhaar.Value + "','" + state.Value + "','" + DropDownList3.SelectedValue + "','" + DropDownList2.SelectedValue + "','" + mobile.Value + "','" + email.Value + "','" + pass.Value + "','" + abc.Text + "','" + DropDownList1.SelectedValue + "','" + bio.Value + "','" + voterid.Value + "')";
        SqlCommand cmd = new SqlCommand(command, con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (SqlException sdfe)
        {
            Response.Write("Error. Check if you are already registered with same ID.");
        }
        con.Close();
        Response.Redirect("Default.aspx?uid=" + firstname.Value);
    }

}