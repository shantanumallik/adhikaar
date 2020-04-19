using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addCandidates : System.Web.UI.Page
{
    //SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = "";
        if(Page.IsPostBack)
        {
            string connstr = null;
            connstr = "Data Source=CODEROOM\\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True";
            SqlConnection con = new SqlConnection(connstr);
            con.Open();

            string c = "select id from elections where title='"+DropDownList1.SelectedValue+"'";
            SqlCommand cmd = new SqlCommand(c, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read() == true)
            {
                Label1.Text = dr.GetString(0);
            }
            else
            {
                Label1.Text = "";
            }

            con.Close();

        }
    }
    protected void select_Click(object sender, EventArgs e)
    {
        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;

        string firstColData = grdrow.Cells[0].Text;
        string connstr = null;
        connstr = "Data Source=CODEROOM\\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True";
        SqlConnection con = new SqlConnection(connstr);
        con.Open();

        string command = "insert into selected_candidates values ('"+firstColData+"','"+Label1.Text+"','"+DropDownList1.SelectedValue+"')";
        SqlCommand cmd = new SqlCommand(command, con);
        try {
            cmd.ExecuteNonQuery();
        }
        catch(SqlException rsde)
        {
            Label2.Text = "Already selected this candidate for this election!";
        }
        con.Close();

        LinkButton l1 = sender as LinkButton;
        l1.Visible = false;
    }
    protected void details_Click(object sender, EventArgs e)
    {
        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;

        string firstColData = grdrow.Cells[0].Text;
        Response.Redirect("viewcandidate.aspx?id=" + firstColData);
    }
}