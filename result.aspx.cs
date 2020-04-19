using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class result : System.Web.UI.Page
{
    string election_id;
    string election_name;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {

        string connstr = null;
        connstr = "Data Source=CODEROOM\\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True";
        SqlConnection con = new SqlConnection(connstr);
        con.Open();

        if (Request.QueryString["id"] != null && Request.QueryString["title"] != null)
        {
            election_id = Request.QueryString["id"];
            election_name = Request.QueryString["title"];
        }


        con.Close();
    }
}