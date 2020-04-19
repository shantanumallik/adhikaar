 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="addElections.aspx.cs" Inherits="addElections" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Adhikaar - Add Elections</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css" />
</head>
<body>
    <!--Nav bar-->
    <nav class="red" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="Default.aspx" class="brand-logo">ADHIKAAR</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="addElections.aspx">ADD ELECTIONS</a></li>
                <li><a href="editElections.aspx">EDIT ELECTIONS</a></li>
                
            </ul>

            <ul id="nav-mobile" class="side-nav">
                <li><a href="addElections.aspx">ADD ELECTIONS</a></li>
                <li><a href="editElections.aspx">EDIT ELECTIONS</a></li>
                <li><a href="addCandidates.aspx">ADD CANDIDATES</a></li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
        </div>
    </nav>
    <!--Nav bar End-->
    <asp:Label ID="Label1" runat="server" CssClass="red-text"></asp:Label>
    <br /> <br />
    <div class="container">
        <br />
        <h4><strong>ADD YOUR ELECTION HERE:</strong></h4>
        <br />
        <form runat="server" id="form1" class="col s12">
            <div class="row">
                <div class="col s6 input-field">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="id" type="text" class="validate" runat="server" />
                    <label for="title">Election ID</label>
                </div>
                <div class="col s6 input-field">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="title" type="text" class="validate" runat="server" />
                    <label for="title">Title</label>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="description" type="text" class="validate" runat="server"/>
                    <label for="description">Description</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s3">
                    <i class="material-icons prefix">today</i>
                    <input type="date" class="datepicker" id="startdate" runat="server" />
                    <label for="startdate">StartDate</label>
                </div>
                <div class="input-field col s3">
                    <i class="material-icons prefix">today</i>
                    <input type="time"  id="starttime" runat="server"/>
                    <label for="starttime"></label>
                </div>
                <div class="input-field col s3">
                    <i class="material-icons prefix">today</i>
                    <input type="date" class="datepicker" id="enddate" runat="server" />
                    <label for="enddate">EndDate</label>
                </div>
                <div class="input-field col s3">
                    <i class="material-icons prefix">today</i>
                    <input type="time"  id="endtime" runat="server" />
                    <label for="endtime"></label>
                </div>
            </div>
            <div class="row center-align">
                <div class="input-field col s6">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Text="kalikapur" Value="Kalikapur"></asp:ListItem>
                        <asp:ListItem Text="kasba" Value="Kasba"></asp:ListItem>
                        <asp:ListItem Text="saltlake" Value="Salt Lake"></asp:ListItem>
                        <asp:ListItem Text="dumdum" Value="Dum Dum"></asp:ListItem>
                        <asp:ListItem Text="behala" Value="Behala"></asp:ListItem>                       
                        <asp:ListItem Text="sonarpur" Value="Sonarpur"></asp:ListItem>
                        <asp:ListItem Text="garia" Value="Garia"></asp:ListItem>
                    </asp:DropDownList>
                    <label>Constituency</label>
                </div>
            </div>
            <div class="row center">
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-large waves-effect waves-light red lighten-1 hoverable" OnClick="LinkButton1_Click"><i class="material-icons left">person_add</i>Add ELection</asp:LinkButton>
            </div>   
        </form>
    </div>
    

    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
</body>
</html>
