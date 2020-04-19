<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewcandidate.aspx.cs" Inherits="viewcandidate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Adhikaar - View Candidate</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css" />
</head>
<body>
    <!--Nav bar-->
    <nav class="Red" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="Default.aspx" class="brand-logo" style="left: -46px; top: 0px">ADHIKAAR</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="Elections.aspx">ELECTIONS</a></li>
                
                <li><a href="Contact.aspx">CONTACT</a></li>
            </ul>

            <ul id="nav-mobile" class="side-nav">
                 <li><a href="Elections.aspx">ELECTIONS</a></li>
                
                <li><a href="Contact.aspx">CONTACT</a></li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
        </div>
    </nav>
    <!--Nav bar End-->
    <br /> <br />
    <form id="loginform" runat="server">
    <div class="container">
        <h4><strong>Candidate Details:</strong></h4>
        <br />
        <div class="row">
                <div class="col s6">
                        <p><b>First Name:     </b>
                            <asp:Label ID="fname" runat="server" Text="Label"></asp:Label>
                        </p>
                        <p><b>Last Name:     </b>
                            <asp:Label ID="lname" runat="server" Text="Label"></asp:Label>
                        </p>
                        <p><b>Gender:       </b>
                            <asp:Label ID="gender" runat="server" Text="Label"></asp:Label>
                        </p>
                        <p><b>Aadhar No:     </b>
                            <asp:Label ID="uid" runat="server" Text="Label"></asp:Label>
                        </p>
                        <p><b>Date of Birth:     </b>
                            <asp:Label ID="dob" runat="server" Text="Label"></asp:Label>
                        </p>
                        <p><b>State:     </b>
                            <asp:Label ID="state" runat="server" Text="Label"></asp:Label>
                        </p>
                    <p><b>Party:     </b>
                            <asp:Label ID="party" runat="server" Text="Label"></asp:Label>
                        </p>
                        <p><b>Mobile:     </b>
                            <asp:Label ID="mob" runat="server" Text="Label"></asp:Label>
                        </p>
                        <p><b>Email:     </b>
                            <asp:Label ID="mail" runat="server" Text="Label"></asp:Label>
                        </p>
                </div>
                <div class="col s6">
                        <p><b>Father's Name:     </b>
                            <asp:Label ID="father" runat="server" Text="Label"></asp:Label>
                        </p>
                        <p><b>Mother's Name:     </b>
                            <asp:Label ID="mother" runat="server" Text="Label"></asp:Label>
                        </p>
                        <p><b>Qualification:     </b>
                            <asp:Label ID="edu" runat="server" Text="Label"></asp:Label>
                        </p>
                        <p>
                            <b>Bio: </b>
                            <asp:TextBox ID="bio"  runat="server" TextMode="MultiLine" Height="150px" Width="150px" Wrap="true"></asp:TextBox>  
                        </p>

                </div>

        </div>

    </div></form>



    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
</body>
</html>
