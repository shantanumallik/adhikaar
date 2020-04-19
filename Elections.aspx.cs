using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Elections : System.Web.UI.Page
{
    SqlConnection con;


    protected void Page_Load(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Page Loaded!');", true);
    }
    protected void apply_Click(object sender, EventArgs e)
    {
        string connstr = null;
        string party;
        connstr = "Data Source=CODEROOM\\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True";
        SqlConnection con = new SqlConnection(connstr);
        con.Open();
        string fetch= "select * from aadhaar where aadhaar_card_no ='" + Context.User.Identity.Name + "'";
        SqlCommand cmd1 = new SqlCommand(fetch, con);
        SqlDataReader dr1 = cmd1.ExecuteReader();

        dr1.Read();
        string fname = dr1.GetString(0);
        string lname = dr1.GetString(1);
       party = dr1.GetString(16);
        con.Close();
       

        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
        string firstColData = grdrow.Cells[0].Text;
        string name = grdrow.Cells[1].Text;
        
        string secondColData = grdrow.Cells[3].Text;
        string thirdColData = grdrow.Cells[4].Text;

        DateTime start = Convert.ToDateTime(secondColData);
        DateTime end = Convert.ToDateTime(thirdColData);
        if (DateTime.Now <= start)
        {

            con.Open();
            string command = "insert into candidates values('" + Context.User.Identity.Name + "','" + firstColData + "','"+name+"','" + party + "','" + fname + "','" + lname + "')";
            SqlCommand cmd = new SqlCommand(command, con);
            try {
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Applied Successfully');", true);
            }
            catch(SqlException dsfve)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Already Applied for this election');", true);
            }
            con.Close();
            LinkButton l1 = sender as LinkButton;
            l1.Visible = false;
       }
        else if(DateTime.Now >start && DateTime.Now <=end)
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Cannot Apply. Election is going on. Please Vote!');", true);

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Election Over!');", true);
        }
    }
    protected void vote_Click(object sender, EventArgs e)
    {

        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;


        string firstColData = grdrow.Cells[0].Text;
        string name = grdrow.Cells[1].Text;

        string secondColData = grdrow.Cells[3].Text;
        string thirdColData = grdrow.Cells[4].Text;

        DateTime start = Convert.ToDateTime(secondColData);
        DateTime end = Convert.ToDateTime(thirdColData);
        if (DateTime.Now >= start && DateTime.Now <= end)
            Response.Redirect("voting.aspx?id=" + firstColData +"&title="+ name );
        else if (DateTime.Now < start)
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Election not started');", true);
        else
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Election Over');", true);
    }
    protected void result_Click(object sender, EventArgs e)
    {

        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;

        string firstColData = grdrow.Cells[0].Text;
        string name = grdrow.Cells[1].Text;

        string secondColData = grdrow.Cells[3].Text;
        string thirdColData = grdrow.Cells[4].Text;


        DateTime start = Convert.ToDateTime(secondColData);
        DateTime end = Convert.ToDateTime(thirdColData);
        if (DateTime.Now >= end)
            Response.Redirect("result.aspx?id=" + firstColData + "&title=" + name);
        else if (DateTime.Now >= start && DateTime.Now < end)
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Election is going on. Please Vote!');", true);
        ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Election not started');", true);
        //Label1.Text = "Election not started!!" ;
    }
}