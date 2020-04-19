<%@ Page Language="C#" AutoEventWireup="true" CodeFile="voting.aspx.cs" Inherits="voting" MasterPageFile="~/Site.Master"%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Adhikaar - Voting</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,200,500,600,700' rel='stylesheet' type='text/css' />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css" />
    <link href="Content/material-cards.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css"/>--%>
    <style>
        img {
            vertical-align: middle;
        }
        .img-responsive,
        .thumbnail > img,
        .thumbnail a > img,
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
        display: block;
        max-width: 100%;
        height: auto;
        }
        .img-rounded {
            border-radius: 6px;
        }
        .img-thumbnail {
            display: inline-block;
            max-width: 100%;
            height: auto;
            padding: 4px;
            line-height: 1.42857143;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            -webkit-transition: all .2s ease-in-out;
            -o-transition: all .2s ease-in-out;
            transition: all .2s ease-in-out;
        }
        .img-circle {
            border-radius: 50%;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <nav class="teal" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="Default.aspx" class="brand-logo">ADHIKAAR</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="Elections.aspx">ELECTIONS</a></li>
                
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
                
                <li><a href="Contact.aspx">CONTACT</a></li>
                <li>
                     <a href="#" style="text-transform:uppercase;"><asp:LoginName ID="LoginName2" runat="server" /></a>
                </li>
                <li style="text-transform:uppercase;">
                    <asp:LoginStatus ID="LoginStatus2" runat="server"/>
                </li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
        </div>
    </nav>
        <asp:Label ID="Label1" runat="server" CssClass=" red-text"></asp:Label>
        <br /> <br />
        <div class="container">
            <div class="row-center">
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-large waves-effect waves-light orange lighten-1 hoverable" OnClick="LinkButton1_Click">Click here to Enable</asp:LinkButton>
            </div>
            <div class="row">
                <div class="col s4 offset-s4"">
                      <img border="2" id="FPImage1" alt="Fingerpint Image" height="300" width="210" src=".\Images\PlaceFinger.bmp" /> 
                     </div> 
                </div>
            <div class="row">
                <div class="col s4 offset-s4">   
                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn btn-large waves-effect waves-light orange lighten-1 hoverable" OnClientClick="CallSGIFPGetData(SuccessFunc1, ErrorFunc); return false;">Scan Biometrics</asp:LinkButton>
                    </div>
                </div>
                    
            <div class="row">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>

                        
                        <asp:BoundField DataField="cid" HeaderText="Candidate" SortExpression="cid" />
                        <asp:BoundField DataField="fname" HeaderText="First Name"  />
                        <asp:BoundField DataField="lname" HeaderText="Last Name"  />

                        <asp:BoundField DataField="party" HeaderText="Party"  />
                        
                         <asp:TemplateField HeaderText="Candidate Details">
                        
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="cid" OnClick="details_Click">View Details</asp:LinkButton>    
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Vote Here">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="vote" OnClientClick="matchScore(succMatch, failureFunc)" OnClick="vote_Click">VOTE</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                 <asp:TextBox ID="abc" style="display: none;" runat="server"></asp:TextBox>
                <input type='hidden' id='quality'  value="100"/>

                

                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=CODEROOM\ADHIKAAR;Initial Catalog=AdhikaarDB;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT distinct [cid],[party],[fname],[lname] FROM [candidates] WHERE ([eid] = @eid)">
                     <SelectParameters>
                        <asp:QueryStringParameter Name="eid" QueryStringField="id" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
           
        

    </form>
    
    <script type="text/javascript">
    var template_1 = "";
    var template_2 = document.getElementById("<%=abc.ClientID%>").value;

    function SuccessFunc1(result) {
        if (result.ErrorCode == 0) {
            /* 	Display BMP data in image tag
                BMP data is in base 64 format 
            */
            if (result != null && result.BMPBase64.length > 0) {
                document.getElementById('FPImage1').src = "data:image/bmp;base64," + result.BMPBase64;
                template_1 = result.TemplateBase64;
            }
                
            else
                template_1 = "NULL Value";

            var temp=atob(template_1);
            
            var tbl = "<table border=1>";
            tbl += "<tr>";
            tbl += "<td> Template(base64)</td>";
            tbl += "<td> <b> <textarea rows=30 cols=50>" + result.TemplateBase64 + "</textarea></b> </td>";
            tbl += "</tr>";
            tbl += "</table>";
            //$(document).ready(function () {
              //  document.getElementById("<%=abc.ClientID%>").value = result.TemplateBase64;
            //document.getElementById('result1').innerText = result.TemplateBase64;
        //});
       
           
    }
        else {
            alert("Fingerprint Capture Error Code:  " + result.ErrorCode + ".\nDescription:  " + ErrorCodeToString(result.ErrorCode) + ".");
        }
    }

     function ErrorFunc(status) {
        /* 	
            If you reach here, user is probabaly not running the 
            service. Redirect the user to a page where he can download the
            executable and install it. 
        */
        alert("Check if SGIBIOSRV is running; status = " + status + ":");
    }

     function CallSGIFPGetData(successCall, failCall) {
         
        var uri = "https://localhost:8443/SGIFPCapture";
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                fpobject = JSON.parse(xmlhttp.responseText);

                //document.getElementById("<%=abc.ClientID%>").value = "";
                successCall(fpobject);
               // matchScore(succMatch, failureFunc);
            }
            else if (xmlhttp.status == 404) {
                failCall(xmlhttp.status)
            }
        }
        xmlhttp.onerror = function () {
            failCall(xmlhttp.status);
        }
        var params = "Timeout=" + "10000";
        params += "&Quality=" + "50";
        params += "&licstr=" + encodeURIComponent(secugen_lic);
        params += "&templateFormat=" + "ISO";
        xmlhttp.open("POST", uri, true);
        xmlhttp.send(params);
    }

     function matchScore(succFunction, failFunction) {
      
        if (template_1 == "" || template_2 == "") {
            alert("Please scan two fingers to verify!!");
            return;
        }
        var uri = "https://localhost:8443/SGIMatchScore";

        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                fpobject = JSON.parse(xmlhttp.responseText);
                succFunction(fpobject);
            }
            else if (xmlhttp.status == 404) {
                failFunction(xmlhttp.status)
            }
        }

        xmlhttp.onerror = function () {
            failFunction(xmlhttp.status);
        }
        var params = "template1=" + encodeURIComponent(template_1);
        params += "&template2=" + encodeURIComponent(template_2);
        params += "&licstr=" + encodeURIComponent(secugen_lic);
        params += "&templateFormat=" + "ISO";
        xmlhttp.open("POST", uri, false);
        xmlhttp.send(params);
    }

    function succMatch(result) {
        var idQuality = document.getElementById("quality").value;
        if (result.ErrorCode == 0) {
            if (result.MatchingScore >= idQuality) {
                document.getElementById("<%=abc.ClientID%>").value = "true";

                //alert("MATCHED ! (" + result.MatchingScore + ")");
            }


            else
                alert("NOT MATCHED ! (" + result.MatchingScore + ")");
        }
        else {
            alert("Error Scanning Fingerprint ErrorCode = " + result.ErrorCode);
        }
    }

    function failureFunc(error) {
        alert ("On Match Process, failure has been called");
    }

    </script>



    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
    <%--<script src="Scripts/bootstrap.min.js" type="text/javascript"></script>--%>
    <script>
    $(function() {
        $('.material-card > .mc-btn-action').click(function () {
            var card = $(this).parent('.material-card');
            var icon = $(this).children('i');
            icon.addClass('fa-spin-fast');
            if (card.hasClass('mc-active')) {
                card.removeClass('mc-active');
                window.setTimeout(function() {
                    icon
                        .removeClass('fa-arrow-left')
                        .removeClass('fa-spin-fast')
                        .addClass('fa-bars');
                }, 800);
            } else {
                card.addClass('mc-active');
                window.setTimeout(function() {
                    icon
                        .removeClass('fa-bars')
                        .removeClass('fa-spin-fast')
                        .addClass('fa-arrow-left');
                }, 800);
            }
        });
    });
</script>
</body>
</html>
       
</asp:content>
