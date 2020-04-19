<%@ Page Language="C#" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Adhikaar - Edit Elections</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css" />
</head>
<body>
    <form runat="server">
    <!--Nav bar-->
        <nav class="orange" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="Default.aspx" class="brand-logo">ADHIKAAR</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="Elections.aspx">ELECTIONS</a></li>
                    <li><a href="Register.aspx">REGISTER</a></li>
                    <li><a href="Contact.aspx">CONTACT</a></li>
                    <li style="text-transform:uppercase;">
                        <asp:LoginName ID="LoginName1" runat="server" />
                    </li>
                    <li style="text-transform:uppercase;">
                        <asp:LoginStatus ID="LoginStatus1" runat="server"/>
                    </li>
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <li><a href="Elections.aspx">ELECTIONS</a></li>
                    <li><a href="Register.aspx">REGISTER</a></li>
                    <li><a href="Contact.aspx">CONTACT</a></li>
                    <li>
                        <a href="#" style="text-transform:uppercase;"><asp:LoginName ID="LoginName2" runat="server" /></a>
                    </li>
                    <li><asp:LoginStatus ID="LoginStatus2" runat="server" /></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
   
        <div class="container">
            <h3>STATS:</h3>
            <br />
            <h4>Results:</h4>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="party" HeaderText="Party" SortExpression="party" />
                    <asp:BoundField DataField="candidate" HeaderText="Candidates" SortExpression="candidate" />
                    <asp:BoundField DataField="no_of_voters" HeaderText="Total Number of Votes" ReadOnly="True" SortExpression="no_of_voters" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=CODEROOM\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT party,candidate, COUNT(candidate) AS no_of_voters FROM votes WHERE ([eid] = @eid) GROUP BY candidate,party ORDER BY no_of_voters DESC">
                <SelectParameters>
                    <asp:QueryStringParameter Name="eid" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
       
    </form>

    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
</body>
</html>
