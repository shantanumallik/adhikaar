<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultAdmin.aspx.cs" Inherits="_Default" MasterPageFile="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Adhikaar - Admin</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css" />
</head>
<body>
    <!--Login Form starts -->
    <form id="loginform2" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <!--Nav bar-->
        <nav class="red" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="Default.aspx" class="brand-logo">ADHIKAAR</a>
                <ul class="right hide-on-med-and-down">
                    
                    <li><a href="Contact.aspx">CONTACT</a></li>
                    <li style="text-transform:uppercase;">
                        <asp:LoginName ID="LoginName1" runat="server" />
                    </li>
                    <li style="text-transform:uppercase;">
                        <asp:LoginStatus ID="LoginStatus1" runat="server"/>
                    </li>
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <
                    <li><a href="Contact.aspx">CONTACT</a></li>
                    <li>
                        <a href="#" style="text-transform:uppercase;"><asp:LoginName ID="LoginName2" runat="server" /></a>
                    </li>
                    <li><asp:LoginStatus ID="LoginStatus2" runat="server" /></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
    <!--Nav bar End-->

    <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
            <div class="container">
                <br/><br/>
                <h1 class="header center white-text">ADHIKAAR</h1>
                <div class="row center">
                    <h5 class="header col s12 light">Admin Portal</h5>
                </div>
                <div class="row center">
                    <asp:Label ID="Label1" runat="server" Text="Label" CssClass=" black-text indicator text-darken-4"></asp:Label>
                   
                </div>
                <br/><br/>

            </div>
        </div>
        <div class="parallax"><img src="images/flag.jpg" alt="Unsplashed background img 1" /></div>
    </div>

    
        
            <div class="row">
                <div class="col s4 offset-s4 input-field">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="username" type="text" class="validate" runat="server" />
                    <label for="username">User ID</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="username" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
               
                <asp:TextBox ID="abc" style="display: none;" runat="server"></asp:TextBox>
                <input type='hidden' id=quality  value="100"/>
            </div>
            <div class="row center">
                <div class="col s4 offset-s4">
                                   
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-large waves-effect waves-light orange lighten-1 hoverable" OnClientClick="return true" OnClick="LinkButton1_Click">Confirm Admin ID</asp:LinkButton>
                    
                   </div> 

                </div>

                <div class="row center">
                <div class="col s4 offset-s4">
                    <img border="2" id="FPImage1" alt="Fingerpint Image" height="300" width="210" src=".\Images\PlaceFinger.bmp" /> 
                   </div> 
                    </div>
                    <div class="row center">
                 <div class="col s4 offset-s4">   
                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn btn-large waves-effect waves-light orange lighten-1 hoverable" OnClientClick="CallSGIFPGetData(SuccessFunc1, ErrorFunc); return false;">Scan Biometrics</asp:LinkButton>
                    

                </div>
            </div>

   


            <div class="row center">
                <div class="col s4 offset-s4">
                     <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-large waves-effect waves-light orange lighten-1 hoverable" OnClientClick="matchScore(succMatch, failureFunc)" OnClick="LinkButton2_Click">LOGIN</asp:LinkButton>
                </div>
            </div>
        </form>
    <!--Login Form ends -->

   
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
    </body>
</html>

   
</asp:content>

    


